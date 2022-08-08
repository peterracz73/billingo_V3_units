unit BDocumentSummary;

interface
uses Classes, SysUtils, BDocumentVatRateSummary, JsonUtils;

type
tBDocumentSummary =  class
  private
    p_net_amount: double;
    p_net_amount_local: double;
    p_gross_amount_local: double;
    p_vat_amount: double;
    p_vat_amount_local: double;
    p_vat_rate_summary: tBDocumentVatRateSummary;//[]'
  public
    constructor Create();virtual;
    destructor Destroy();override;
    property net_amount : double read p_net_amount write p_net_amount;
    property net_amount_local : double read p_net_amount_local write p_net_amount_local;
    property gross_amount_local : double read p_gross_amount_local write p_gross_amount_local;
    property vat_amount : double read p_vat_amount write p_vat_amount;
    property vat_amount_local : double read p_vat_amount_local write p_vat_amount_local;
    property vat_rate_summary : tBDocumentVatRateSummary read p_vat_rate_summary write p_vat_rate_summary;

    function toJsonStr(deep : integer; after: string):string;
    procedure add_vat_rate_summary(data: tDocumentVatRateSummary);
    procedure loadFromJson(data: string);
end;

implementation
constructor tBDocumentSummary.Create;
begin
end;

destructor tBDocumentSummary.Destroy;
begin
  setLength(p_vat_rate_summary,0);
end;

procedure tBDocumentSummary.loadFromJson(data: string);
begin
    p_net_amount:=JsonUtils.getFloatValue(data, 'net_amount');// double;
    p_net_amount_local:=JsonUtils.getFloatValue(data, 'net_amount_local');// double;
    p_gross_amount_local:=JsonUtils.getFloatValue(data, 'gross_amount_local');// double;
    p_vat_amount:=JsonUtils.getFloatValue(data, 'vat_amount');// double;
    p_vat_amount_local:=JsonUtils.getFloatValue(data, 'vat_amount_local');// double;
    p_vat_rate_summary:=BDocumentVatRateSummary.loadFromJson(JsonUtils.getValue(data, 'vat_rate_summary'));// tBDocumentVatRateSummary;//[]'
end;

procedure tBDocumentSummary.add_vat_rate_summary(data: tDocumentVatRateSummary);
begin
  setLength(p_vat_rate_summary,length(p_vat_rate_summary)+1);
  p_vat_rate_summary[length(p_vat_rate_summary)-1]:=data;
end;

function tBDocumentSummary.toJsonStr(deep : integer; after: string):string;
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
  lines.Add(deepStr+#9+'"net_amount": '+FloatToStr(p_net_amount)+',');
  lines.Add(deepStr+#9+'"net_amount_local": '+FloatToStr(p_net_amount_local)+',');
  lines.Add(deepStr+#9+'"gross_amount_local": '+FloatToStr(p_gross_amount_local)+',');
  lines.Add(deepStr+#9+'"vat_amount": '+FloatToStr(p_vat_amount)+',');
  lines.Add(deepStr+#9+'"vat_amount_local": '+FloatToStr(p_vat_amount_local)+',');
  lines.Add(deepStr+#9+'"vat_rate_summary": [');
  for i0 := 0 to length(p_vat_rate_summary) - 1 do
  begin
    if i0=length(p_vat_rate_summary) - 1 then
      lines.Add(deepStr+#9+p_vat_rate_summary[i0].toJsonStr(deep+2,''))
    else
      lines.Add(deepStr+#9+p_vat_rate_summary[i0].toJsonStr(deep+2,','));
  end;
  lines.Add(deepStr+#9+']');
  lines.Add(deepStr+'}'+after);


  result:=copy(lines.Text,0,length(lines.Text)-2);
  lines.Destroy;
end;
end.
