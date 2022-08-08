unit BPartners;

interface
uses Classes, SysUtils, JsonUtils, BPartner;

type
  tBPartners = array of tBPartner;

  function loadFromJson(jsonTxt: tStringStream): tBPartners;
  function toString(data: tBPartners; deep: integer; after: string): string;
implementation

function loadFromJson(jsonTxt: tStringStream): tBPartners;
var
  i0      : integer;
  mChar   : char;
  signCnt : integer;
  startPos: integer;
begin
  if jsonTxt.Size>2 then
  begin
    signCnt:=0;
    startPos:=-1;
    for i0 := 0 to jsonTxt.Size- 2 do
    begin
      jsonTxt.Position:=i0;
      mChar:=jsonTxt.ReadString(1)[1];
      case mChar of
        '{':  begin
              if signCnt=0 then
                startPos:=i0;
              signCnt:=signCnt+1;
          end;
        '}':  begin
              signCnt:=signCnt-1;
              if signCnt=0 then
              begin
                jsonTxt.Position:=startPos;
                setLength(result,length(result)+1);
                result[length(result)-1]:=tBPartner.Create;
                result[length(result)-1].loadFromJson(jsonTxt.ReadString(i0-startPos+1));
              end;
          end;
      end;
    end;
  end;
end;

function toString(data: tBPartners; deep: integer; after: string): string;
var
  lines : tStringList;
  i0    : integer;
  deepStr : string;
begin
  deepStr:='';
  for i0 := 1 to deep do
    deepStr:=deepStr+#9;

  lines:=tStringList.Create;
  lines.Add(deepStr+'[');
  for i0 := 0 to length(data) - 1 do
  begin
    if i0=length(data) - 1 then
      lines.Add(data[i0].toJsonStr(deep+2,''))
    else
      lines.Add(data[i0].toJsonStr(deep+2,','));
  end;
  lines.Add(deepStr+']');

  result:=copy(lines.Text,0,length(lines.Text)-2);
  lines.Destroy;
end;
end.
