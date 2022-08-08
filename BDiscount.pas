unit BDiscount;

interface
uses BDiscountType, Classes, SysUtils, JsonUtils;

type

tBDiscount = class
private
    p_type:   tBDiscountType;
    p_value:  integer;
public
    constructor Create();virtual;
    destructor Destroy();override;
    property type_ : tBDiscountType read p_type write p_type;
    property value : integer read p_value write p_value;

    function toJsonStr(deep : integer; after: string):string;
    procedure loadFromJson(data: string);
end;

implementation
constructor tBDiscount.Create;
begin
end;

destructor tBDiscount.Destroy;
begin
end;

procedure tBDiscount.loadFromJson(data: string);
begin
  if (data<>'null')and(data<>'') then
  begin
    p_type:=BDiscountType.toEnum(JsonUtils.getStrValue(data,'type'));//   tBDiscountType;
    p_value:=JsonUtils.getIntValue(data,'value');//  integer;
  end;
end;

function tBDiscount.toJsonStr(deep : integer; after: string):string;
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
    lines.Add(deepStr+#9+'"type": "'+BDiscountType.toString(p_type)+'",');
    lines.Add(deepStr+#9+'"value": '+IntToStr(p_value));
    lines.Add(deepStr+'}'+after);

    result:=copy(lines.Text,0,length(lines.Text)-2);
    lines.Destroy;
end;
end.
