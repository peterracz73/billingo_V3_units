unit BPartnerCustomBillingSettings;

interface
uses  Classes, SysUtils, BPaymentMethod, BDocumentForm, BCurrency,
      BDocumentLanguage, BDiscount, JsonUtils;
type
tBPartnerCustomBillingSettings = class
  private
    p_payment_method: tBPaymentMethod;
    p_document_form: tBDocumentForm;
    p_due_days: integer;
    p_document_currency: tBCurrency;
    p_template_language_code: tBDocumentLanguage;
    p_discount: tBDiscount;
  public
    { public declarations }
    constructor Create();virtual;
    destructor Destroy();override;
    property payment_method : tBPaymentMethod read p_payment_method write p_payment_method;
    property document_form : tBDocumentForm read p_document_form write p_document_form;
    property due_days : integer read p_due_days write p_due_days;
    property document_currency : tBCurrency read p_document_currency write p_document_currency;
    property template_language_code : tBDocumentLanguage read p_template_language_code write p_template_language_code;
    property discount : tBDiscount read p_discount write p_discount;

    function toJsonStr(deep : integer; after: string):string;
    procedure loadFromJson(data: string);
  end;

implementation

constructor tBPartnerCustomBillingSettings.Create;
begin
end;

destructor tBPartnerCustomBillingSettings.Destroy;
begin
end;

procedure tBPartnerCustomBillingSettings.loadFromJson(data: string);
begin
    p_payment_method:=BPaymentMethod.toEnum(JsonUtils.getValue(data,'payment_method'));// tBPaymentMethod;
    p_document_form:=BDocumentForm.toEnum(JsonUtils.getStrValue(data,'document_form'));// tBDocumentForm;
    p_due_days:=JsonUtils.getIntValue(data,'due_days');// integer;
    p_document_currency:=BCurrency.toEnum(JsonUtils.getValue(data,'document_currency'));// tBCurrency;
    p_template_language_code:=BDocumentLanguage.toEnum(JsonUtils.getValue(data,'template_language_code'));// tBDocumentLanguage;
    p_discount.loadFromJson(JsonUtils.getStrValue(data,'discount'));//: tBDiscount;
end;

function tBPartnerCustomBillingSettings.toJsonStr(deep : integer; after: string):string;
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
  lines.Add(deepStr+#9+'"payment_method": "'+BPaymentMethod.toString(p_payment_method)+'", ');
  lines.Add(deepStr+#9+'"document_form": "'+BDocumentForm.toString(p_document_form)+'",');
  lines.Add(deepStr+#9+'"due_days": '+IntToStr(p_due_days)+',');
  lines.Add(deepStr+#9+'"document_currency": "'+BCurrency.toString(p_document_currency)+'",');
  lines.Add(deepStr+#9+'"template_language_code": "'+BDocumentLanguage.toString(p_template_language_code)+'",');
  lines.Add(deepStr+#9+'"discount": ');
    if p_discount=nil then
        lines.Add(deepStr+#9+#9+#9+'null')
    else
      lines.Add(p_discount.toJsonStr(deep+2,','));
  lines.Add(deepStr+'}'+after);

  result:=copy(lines.Text,0,length(lines.Text)-2);
  lines.Destroy;
end;
end.
