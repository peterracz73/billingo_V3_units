unit BDocuments;

interface
uses Classes, SysUtils, JsonUtils, BDocument;

type
  tBDocuments = array of tBDocument;

  function loadFromJsonStream(jsonTxt: tStringStream): tBDocuments;
implementation

function loadFromJsonStream(jsonTxt: tStringStream): tBDocuments;
var
  i0  : integer;
  s0  : String;
  signCnt   : integer;
  startPos  : integer;
  mChar     : char;
begin
  if jsonTxt.Size>2 then
  begin
    signCnt:=0;
    for i0 := 1 to jsonTxt.Size-2 do
    begin
      jsonTxt.Position:=i0;
      mChar:=jsonTxt.ReadString(1)[1];
      case mChar of
        '{' :
          begin
            signCnt:=signCnt+1;
            if signCnt=1 then
              startPos:=i0;
          end;
        '}' :
          begin
            signCnt:=signCnt-1;
            if signCnt=0 then
            begin
              jsonTxt.Position:=startPos;
              s0:=jsonTxt.ReadString(i0-startPos);
              if length(s0)>0 then
              begin
                setLength(result,length(result)+1);
                result[length(result)-1]:= tBDocument.Create;
                result[length(result)-1].loadFromJson(s0);
              end;
            end;
          end;
      end;
    end;
  end;
end;

end.
