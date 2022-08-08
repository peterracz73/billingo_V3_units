unit BAddress;

interface
uses BCountry, SysUtils, Classes, JsonUtils;

type
tBAddress = class
  private
    p_country_code: tBCountry;
    p_post_code: string;
    p_city: string;
    p_address: string;
  public
    constructor Create();virtual;
    destructor Destroy();override;
    property country_code : tBCountry read p_country_code write p_country_code;
    property post_code : string read p_post_code write p_post_code;
    property city : string read p_city write p_city;
    property address : string read p_address write p_address;

    function toJsonStr(deep : integer; after: string) : string;
    procedure loadFromJson(data: string);
  end;
implementation
constructor tBAddress.Create;
begin
end;

destructor tBAddress.Destroy;
begin
end;

procedure tBAddress.loadFromJson(data: string);
begin
    p_country_code:=BCountry.toEnum(JsonUtils.getStrValue(data,'country_code'));// tBCountry;
    p_post_code:=JsonUtils.getStrValue(data,'post_code');// string;
    p_city:=JsonUtils.getStrValue(data,'city');// string;
    p_address:=JsonUtils.getStrValue(data,'address');// string;
end;

function tBAddress.toJsonStr(deep : integer; after: string):string;
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
  lines.Add(deepStr+#9+'"country_code": "'+BCountry.toString(p_country_code)+'",');
  lines.Add(deepStr+#9+'"post_code": "'+p_post_code+'",');
  lines.Add(deepStr+#9+'"city": "'+p_city+'",');
  lines.Add(deepStr+#9+'"address": "'+p_address+'"');
  lines.Add(deepStr+'}'+after);

  result:=copy(lines.Text,0,length(lines.Text)-2);
  lines.Destroy;
end;

end.
