unit BDocumentItemData;

interface
uses Classes, SysUtils, JsonUtils;
type
  tBDocumentItemData = class
  private
    p_product_id: integer;
    p_quantity: double;
    p_comment:  string;
  public
    constructor Create();virtual;
    destructor Destroy();override;
    property product_id : integer read p_product_id write p_product_id;
    property quantity : double read p_quantity write p_quantity;
    property comment : string read p_comment write p_comment;

    function toJsonStr(deep: integer): string;
    procedure loadFromJson(workStr: string);
  end;
implementation

constructor tBDocumentItemData.Create;
begin
  p_product_id:=-1;
end;

destructor tBDocumentItemData.Destroy;
begin
end;

procedure tBDocumentItemData.loadFromJson(workStr: string);
begin
  if length(workStr)>0 then
  begin
    p_product_id:= JsonUtils.getIntValue(workStr,'product_id');
    p_quantity:= JsonUtils.getFloatValue(workStr,'quantity');
    p_comment:= JsonUtils.getStrValue(workStr,'comment');
  end;
end;

function tBDocumentItemData.toJsonStr(deep: integer) : string;
var
  lines : tStringList;
  deepStr : string;
  i0      : integer;
  i1: Integer;
begin
  lines:=tStringList.Create;
  deepStr:='';
  for i1 := 1 to deep do
    deepStr:=deepStr+#9;

  lines.Add(deepStr+'{');
  lines.Add(deepStr+#9+'"product_id": '+IntToStr(p_product_id)+',');
  lines.Add(deepStr+#9+'"quantity": '+FloatToStr(p_quantity)+',');
  lines.Add(deepStr+#9+'"comment": "'+p_comment+'"');
  lines.Add(deepStr+'}');

  result:=copy(lines.Text,0,length(lines.Text)-2);
  lines.Destroy;
end;
end.
