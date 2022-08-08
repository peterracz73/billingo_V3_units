unit BDocumentItems;

interface
uses BDocumentItem, Classes;
type
tBDocumentItems = array of tBDocumentItem;

  function toString(data: tBDocumentItems; deep: integer; after: string): string;
  function loadFromJson(data: string): tBDocumentItems;
implementation

function loadFromJson(data: string): tBDocumentItems;
var
  startSignPos  : integer;
  endSignPos    : integer;
  workStr : string;
begin
  startSignPos:=pos('{',data);
  endSignPos:=pos('}',data);
  while startSignPos>0 do
  begin
    setLength(result,length(result)+1);
    workStr:=copy(data,startSignPos,endSignPos-startSignPos+1);
    result[length(result)-1]:=BDocumentItem.loadFromJson(workStr);
    data[startSignPos]:='(';
    data[endSignPos]:=')';
    startSignPos:=pos('{',data);
    endSignPos:=pos('}',data);
  end;
end;

function toString(data: tBDocumentItems; deep: integer; after: string): string;
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
