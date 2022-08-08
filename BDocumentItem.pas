unit BDocumentItem;

interface
uses BVat, BEntitlement, Classes, SysUtils, JsonUtils;
type
tBDocumentItem = class
  private
    p_product_id: integer;
    p_name: string;
    p_net_unit_amount: double;
    p_quantity: double;
    p_unit: string;
    p_net_amount: double;
    p_gross_amount: double;
    p_vat: tBVat;
    p_vat_amount: double;
    p_entitlement: tBEntitlement;
    p_comment: string;
  public
    { public declarations }
    constructor Create();virtual;
    destructor Destroy();override;
    property product_id : integer read p_product_id write p_product_id;
    property name : string read p_name write p_name;
    property net_unit_amount : double read p_net_unit_amount write p_net_unit_amount;
    property quantity : double read p_quantity write p_quantity;
    property unit_ : string read p_unit write p_unit;
    property net_amount : double read p_net_amount write p_net_amount;
    property gross_amount : double read p_gross_amount write p_gross_amount;
    property vat : tBVat read p_vat write p_vat;
    property vat_amount : double read p_vat_amount write p_vat_amount;
    property entitlement : tBEntitlement read p_entitlement write p_entitlement;
    property comment : string read p_comment write p_comment;

    function toJsonStr(deep : integer; after: string): string;
  end;

  function loadFromJson(data: string): tBDocumentItem;
implementation

function loadFromJson(data: string): tBDocumentItem;
begin
  result:=tBDocumentItem.Create;
  result.p_product_id:= JsonUtils.getIntValue(data,'product_id');// integer;
  result.p_name:= JsonUtils.getStrValue(data,'name');// string;
  result.p_net_unit_amount:=JsonUtils.getFloatValue(data,'net_unit_amount');// double;
  result.p_quantity:=JsonUtils.getFloatValue(data,'quantity');// double;
  result.p_unit:=JsonUtils.getStrValue(data,'unit');// string;
  result.p_net_amount:=JsonUtils.getFloatValue(data,'net_amount');// double;
  result.p_gross_amount:=JsonUtils.getFloatValue(data,'gross_amount');// double;
  result.p_vat:=BVat.toEnum(JsonUtils.getStrValue(data,'vat'));// tBVat;
  result.p_vat_amount:=JsonUtils.getFloatValue(data,'vat_amount');// double;
  result.p_entitlement:=BEntitlement.toEnum(JsonUtils.getStrValue(data,'p_entitlement'));// tBEntitlement;
  result.p_comment:=JsonUtils.getStrValue(data,'comment');// string;
end;

constructor tBDocumentItem.Create;
begin
  {}
end;

destructor tBDocumentItem.Destroy;
begin
  {}
end;

function tBDocumentItem.toJsonStr(deep : integer; after: string):string;
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
  lines.Add(deepStr+#9+'"product_id": '+IntToStr(p_product_id)+', ');
  lines.Add(deepStr+#9+'"name": "'+p_name+'",');
  lines.Add(deepStr+#9+'"net_unit_amount": '+FloatToStr(p_net_unit_amount)+',');
  lines.Add(deepStr+#9+'"quantity": '+FloatToStr(p_net_amount)+',');
  lines.Add(deepStr+#9+'"unit": "'+p_unit+'",');
  lines.Add(deepStr+#9+'"net_unit_amount": '+FloatToStr(p_net_unit_amount)+',');
  lines.Add(deepStr+#9+'"gross_amount": '+FloatToStr(p_gross_amount)+',');
  lines.Add(deepStr+#9+'"p_vat": "'+BVat.toString(p_vat)+'"');
  lines.Add(deepStr+#9+'"vat_amount": '+FloatToStr(p_vat_amount)+',');
  lines.Add(deepStr+#9+'"entitlement": "'+BEntitlement.toString(p_entitlement)+'"');
  lines.Add(deepStr+#9+'"comment": "'+p_comment+'"');
  lines.Add(deepStr+'}'+after);

  result:=copy(lines.Text,0,length(lines.Text)-2);
  lines.Destroy;
end;
end.
