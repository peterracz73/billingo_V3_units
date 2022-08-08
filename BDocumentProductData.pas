unit BDocumentProductData;

interface

uses BUnitPriceType, BVat, BEntitlement, Classes, SysUtils, JsonUtils;

type
  tBDocumentProductData = class
  private
    p_name: string;
    p_unit_price: double;
    p_unit_price_type: tBUnitPriceType;
    p_quantity: double;
    p_unit: string;
    p_vat: tBVat;
    p_comment: string;
    p_entitlement: tBEntitlement;
  public
    constructor Create();virtual;
    destructor Destroy();override;
    property name : string read p_name write p_name;
    property unit_price : double read p_unit_price write p_unit_price;
    property unit_price_type : tBUnitPriceType read p_unit_price_type write p_unit_price_type;
    property quantity : double read p_quantity write p_quantity;
    property unit_ : string read p_unit write p_unit;
    property vat : tBVat read p_vat write p_vat;
    property comment : string read p_comment write p_comment;
    property entitlement : tBEntitlement read p_entitlement write p_entitlement;

    function toJsonStr(deep: integer): string;
    procedure loadFromJson(workStr: string);
  end;

implementation
constructor tBDocumentProductData.Create;
begin
  p_vat:=tBVat.NONE;
end;

destructor tBDocumentProductData.Destroy;
begin
end;

procedure tBDocumentProductData.loadFromJson(workStr: string);
begin
  if length(workStr)>0 then
  begin
    p_name:=JsonUtils.getStrValue(workStr,'name');// string;
    p_unit_price:=JsonUtils.getFloatValue(workStr,'unit_price');// double;
    p_unit_price_type:=BUnitPriceType.toEnum(JsonUtils.getStrValue(workStr,'unit_price_type'));// tBUnitPriceType;
    p_quantity:=JsonUtils.getFloatValue(workStr,'quantity');// double;
    p_unit:=JsonUtils.getStrValue(workStr,'unit');// string;
    p_vat:=BVat.toEnum(JsonUtils.getStrValue(workStr,'vat'));// tBVat;
    p_comment:=JsonUtils.getStrValue(workStr,'comment');// string;
    p_entitlement:=BEntitlement.toEnum(JsonUtils.getStrValue(workStr,'entitlement'));// tBEntitlement;
  end;
end;

function tBDocumentProductData.toJsonStr(deep: integer): string;
var
  lines : tStringList;
  s0    : string;
  i0      : integer;
  deepStr : string;
  i1: Integer;
begin
  lines:=tStringList.Create;
  deepStr:='';
  for i1 := 1 to deep do
    deepStr:=deepStr+#9;

  lines.Add(deepStr+'{');
  lines.Add(deepStr+#9+'"name": "'+p_name+'",');
  lines.Add(deepStr+#9+'"unit_price": '+FloatToStr(p_unit_price)+',');
  lines.Add(deepStr+#9+'"unit_price_type": "'+BUnitPriceType.toString(p_unit_price_type)+'",');
  lines.Add(deepStr+#9+'"quantity": '+FloatToStr(p_quantity)+',');
  lines.Add(deepStr+#9+'"unit": "'+p_unit+'",');
  lines.Add(deepStr+#9+'"vat": "'+BVat.toString(p_vat)+'",');
  s0:=BEntitlement.toString(p_entitlement);
  if s0='' then
    lines.Add(deepStr+#9+'"comment": "'+p_comment+'"')
  else
  begin
    lines.Add(deepStr+#9+'"comment": "'+p_comment+'",');
    lines.Add(deepStr+#9+'"entitlement": "'+s0+'"');
  end;
  lines.Add(deepStr+'}');

  result:=copy(lines.Text,0,length(lines.Text)-2);
  lines.Destroy;
end;

end.
