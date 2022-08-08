unit BDocumentVatRateSummary;

interface
uses Classes, SysUtils, JsonUtils;

type

tDocumentVatRateSummary = class
  private
    p_vat_name: string;
    p_vat_percentage: double;
    p_vat_rate_net_amount: double;
    p_vat_rate_vat_amount: double;
    p_vat_rate_vat_amount_local: double;
    p_vat_rate_gross_amount: double;
  public
    constructor Create();virtual;
    destructor Destroy();override;
    property vat_name : string read p_vat_name write p_vat_name;
    property vat_percentage : double read p_vat_percentage write p_vat_percentage;
    property vat_rate_net_amount : double read p_vat_rate_net_amount write p_vat_rate_net_amount;
    property vat_rate_vat_amount : double read p_vat_rate_vat_amount write p_vat_rate_vat_amount;
    property vat_rate_vat_amount_local : double read p_vat_rate_vat_amount_local write p_vat_rate_vat_amount_local;
    property p_vat_rate_gross_amountvat_rate_gross_amount : double read p_vat_rate_gross_amount write p_vat_rate_gross_amount;

    function toJsonStr(deep : integer; after: string):string;
  end;

tBDocumentVatRateSummary =  array of tDocumentVatRateSummary;
function loadFromJson(data: string):tBDocumentVatRateSummary;
function p_loadFromJson(data: string):tDocumentVatRateSummary;
implementation
constructor tDocumentVatRateSummary.Create;
begin
end;

destructor tDocumentVatRateSummary.Destroy;
begin
end;

function p_loadFromJson(data: string):tDocumentVatRateSummary;
begin
    result:=tDocumentVatRateSummary.Create;
    result.p_vat_name:=JsonUtils.getStrValue(data,'vat_name');// string;
    result.p_vat_percentage:=JsonUtils.getFloatValue(data,'vat_percentage');// double;
    result.p_vat_rate_net_amount:=JsonUtils.getFloatValue(data,'vat_rate_net_amount');// double;
    result.p_vat_rate_vat_amount:=JsonUtils.getFloatValue(data,'vat_rate_vat_amount');// double;
    result.p_vat_rate_vat_amount_local:=JsonUtils.getFloatValue(data,'vat_rate_vat_amount_local');// double;
    result.p_vat_rate_gross_amount:=JsonUtils.getFloatValue(data,'vat_rate_gross_amount');// double;
end;

function loadFromJson(data: string):tBDocumentVatRateSummary;
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
    result[length(result)-1]:=p_loadFromJson(workStr);
    data[startSignPos]:='(';
    data[endSignPos]:=')';
    startSignPos:=pos('{',data);
    endSignPos:=pos('}',data);
  end;
end;



function tDocumentVatRateSummary.toJsonStr(deep : integer; after: string):string;
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
  lines.Add(deepStr+#9+'"vat_name": "'+p_vat_name+'",');
  lines.Add(deepStr+#9+'"vat_percentage": '+FloatToStr(p_vat_percentage)+',');
  lines.Add(deepStr+#9+'"vat_rate_net_amount": '+FloatToStr(p_vat_rate_net_amount)+',');
  lines.Add(deepStr+#9+'"vat_rate_vat_amount": '+FloatToStr(p_vat_rate_vat_amount)+',');
  lines.Add(deepStr+#9+'"vat_rate_vat_amount_local": '+FloatToStr(p_vat_rate_vat_amount_local)+',');
  lines.Add(deepStr+#9+'"vat_rate_gross_amount": '+FloatToStr(p_vat_rate_gross_amount));
  lines.Add(deepStr+'}'+after);

  result:=copy(lines.Text,0,length(lines.Text)-2);
  lines.Destroy;
end;
end.
