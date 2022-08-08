unit BDocumentAncestors;

interface
uses Classes, SysUtils, JsonUtils;

type
tBDocumentAncestor = class
  private
    p_id: integer;
    p_invoice_number: string;
  public
      { public declarations }
      constructor Create();virtual;
      destructor Destroy();override;
      property id : integer read p_id write p_id;
      property invoice_number : string read p_invoice_number write p_invoice_number;

      function toJsonStr(deep : integer; after: string):string;
    end;

  tBDocumentAncestors = array of tBDocumentAncestor;

  function loadAncestorFromJson(data: string): tBDocumentAncestor;
  function toString(data: tBDocumentAncestors; deep: integer; after: string): string;
  function loadFromJson(data: string): tBDocumentAncestors;
implementation
function loadAncestorFromJson(data: string): tBDocumentAncestor;
begin
    result:= tBDocumentAncestor.Create;
    result.p_id:=JsonUtils.getIntValue(data, 'id');// integer;
    result.p_invoice_number:=JsonUtils.getStrValue(data, 'invoice_number');// string;
end;

constructor tBDocumentAncestor.Create;
begin
end;

destructor tBDocumentAncestor.Destroy;
begin
end;

function toString(data: tBDocumentAncestors; deep: integer; after: string): string;
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

function loadFromJson(data: string): tBDocumentAncestors;
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
    result[length(result)-1]:=BDocumentAncestors.loadAncestorFromJson(workStr);
    data[startSignPos]:='(';
    data[endSignPos]:=')';
    startSignPos:=pos('{',data);
    endSignPos:=pos('}',data);
  end;
end;

function tBDocumentAncestor.toJsonStr(deep : integer; after: string):string;
var
  i0  : integer;
  deepStr : string;
  lines   : tStringList;
begin
  deepStr:='';
  for i0 := 1 to deep do
    deepStr:=deepStr+#9;

  lines:=tStringList.Create;

  lines.Add(deepStr+'{');
  lines.Add(deepStr+#9+'"id": '+IntToStr(p_id)+', ');
  lines.Add(deepStr+#9+'"invoice_number": "'+p_invoice_number+'"');

  result:=copy(lines.Text,0,length(lines.Text)-2);
  lines.Destroy;
end;
end.
