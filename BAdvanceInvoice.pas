unit BAdvanceInvoice;

interface
  uses SysUtils, Classes;

type
  tBAdvanceInvoice = array of integer;

  function loadFromJson(data: string): tBAdvanceInvoice;
  function toJson(data: tBAdvanceInvoice; deep: integer; after: string): string;
implementation
function loadFromJson(data: string): tBAdvanceInvoice;
var
  indxNew : integer;
  indxOld : integer;
  str0  : string;
begin
  indxNew:=pos(',',data);
  indxOld:=3;
  while indxNew>0 do
  begin
    data[indxNew]:=';';
    setLength(result,length(result)+1);
    result[length(result)-1]:=StrToInt(copy(data,indxOld,indxNew-indxOld-1));
    indxOld:=indxNew+2;
    indxNew:=pos(',',data);
  end;
  if length(data)>indxOld then
  begin
    setLength(result,length(result)+1);
    result[length(result)-1]:=StrToInt(copy(data,indxOld,length(data)-indxOld-1));
  end;
end;

function toJson(data: tBAdvanceInvoice; deep: integer; after: string): string;
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
      lines.Add(deepStr+#9+intToStr(data[i0]))
    else
      lines.Add(deepStr+#9+intToStr(data[i0])+',');
  end;
  lines.Add(deepStr+']');

  result:=copy(lines.Text,0,length(lines.Text)-2);
  lines.Destroy;
end;end.
