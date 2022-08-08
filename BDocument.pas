unit BDocument;

interface
uses BDocumentType, BPaymentStatus, BPaymentMethod, BCurrency,
     BDocumentOrganization, BPartner, BDocumentPartner, BStringArray,
     BDocumentNotificationStatus, BDocumentLanguage, BDocumentItems,
     BDocumentSummary, BDocumentSettings, BOnlineSzamlaStatusEnum,
     BDocumentAncestors, BDiscount, BCorrectionType, Classes, SysUtils,
     BillingoUtils, JsonUtils;



type
tBDocument = class
  private
    { protected declarations }
    p_id: integer;
    p_invoice_number: string;
    p_type: tBDocumentType;
    p_correction_type: tBCorrectionType;
    p_cancelled: boolean;
    p_block_id: integer;
    p_payment_status: tBPaymentStatus;
    p_payment_method: tBPaymentMethod;
    p_gross_total: double;
    p_currency: tBCurrency;
    p_conversion_rate: double;
    p_invoice_date: tDateTime;
    p_fulfillment_date: tDateTime;
    p_due_date: tDateTime;
    p_paid_date: tDateTime;
    p_organization: tBDocumentOrganization;
    p_partner: tBPartner;
    p_document_partner: tBDocumentPartner;
    p_electronic: boolean;
    p_comment: string;
    p_tags: tBStringArray;//string[]',
    p_notification_status: tBDocumentNotificationStatus;
    p_language: tBDocumentLanguage;
    p_items: tBDocumentItems;
    p_summary: tBDocumentSummary;
    p_settings: tBDocumentSettings;
    p_online_szamla_status: tBOnlineSzamlaStatusEnum;
    p_related_documents: tBDocumentAncestors;
    p_discount: tBDiscount;
  public
   { public declarations }
    constructor Create();virtual;
    destructor Destroy();override;
    //property vendor_id : string read p_vendor_id write p_vendor_id;
    property id: integer read p_id write p_id;
    property invoice_number: string read p_invoice_number write p_invoice_number;
    property type_: tBDocumentType read p_type write p_type;
    property correction_type: tBCorrectionType read p_correction_type write p_correction_type;
    property cancelled: boolean read p_cancelled write p_cancelled;
    property block_id: integer read p_block_id write p_block_id;
    property payment_status: tBPaymentStatus read p_payment_status write p_payment_status;
    property payment_method: tBPaymentMethod read p_payment_method write p_payment_method;
    property gross_total: double read p_gross_total write p_gross_total;
    property currency: tBCurrency read p_currency write p_currency;
    property conversion_rate: double read p_conversion_rate write p_conversion_rate;
    property invoice_date: tDateTime read p_invoice_date write p_invoice_date;
    property fulfillment_date: tDateTime read p_fulfillment_date write p_fulfillment_date;
    property due_date: tDateTime read p_due_date write p_due_date;
    property paid_date: tDateTime read p_paid_date write p_paid_date;
    property organization: tBDocumentOrganization read p_organization write p_organization;
    property partner: tBPartner read p_partner write p_partner;
    property document_partner: tBDocumentPartner read p_document_partner write p_document_partner;
    property electronic: boolean read p_electronic write p_electronic;
    property comment: string read p_comment write p_comment;
    property tags: tBStringArray read p_tags write p_tags;
    property notification_status: tBDocumentNotificationStatus read p_notification_status write p_notification_status;
    property language: tBDocumentLanguage read p_language write p_language;
    property items: tBDocumentItems read p_items write p_items;
    property summary: tBDocumentSummary read p_summary write p_summary;
    property settings: tBDocumentSettings read p_settings write p_settings;
    property online_szamla_status: tBOnlineSzamlaStatusEnum read p_online_szamla_status write p_online_szamla_status;
    property related_documents: tBDocumentAncestors read p_related_documents write p_related_documents;
    property discount: tBDiscount read p_discount write p_discount;

    function toJsonStr(deep : integer; after: string):string;
    procedure loadFromJson(data: string);
    procedure saveToJsonFile(path: string);
  end;

implementation
constructor tBDocument.Create();
begin
  p_organization:= tBDocumentOrganization.Create;
  p_partner:= tBPartner.Create;
  p_document_partner:= tBDocumentPartner.Create;
  p_summary:= tBDocumentSummary.Create;
  p_settings:= tBDocumentSettings.Create;
  p_discount:= tBDiscount.Create;
end;

destructor tBDocument.Destroy();
var
  i0  : integer;
begin
  p_organization.Destroy;
  p_partner.Destroy;
  p_document_partner.Destroy;
  setLength(p_tags,0);
  for i0 := length(p_items) - 1 downto 0 do
     p_items[i0].Destroy;
  setLength(p_items,0);
  p_summary.Destroy;
  p_settings.Destroy;
  for i0 := length(p_related_documents) - 1 downto 0 do
     p_related_documents[i0].Destroy;
  setLength(p_related_documents,0);
  p_discount.Destroy;
end;

procedure tBDocument.saveToJsonFile(path: string);
var
  workStream  : tStringStream;
  workStr     : string;
begin
  workStr:=toJsonStr(0,'');
  workStream:= TStringStream.Create(workStr, TEncoding.UTF8);
  workStream.SaveToFile(path);
  workStream.Free;
end;

procedure tBDocument.loadFromJson(data: string);
begin


  p_id:=jsonUtils.getIntValue(data, 'id');
  p_invoice_number:=jsonUtils.getStrValue(data, 'invoice_number'); //string;
  p_type:=BDocumentType.toEnum(jsonUtils.getStrValue(data, 'type')); // tBDocumentType;
  p_correction_type:=BCorrectionType.toEnum(jsonUtils.getStrValue(data, 'correction_type'));// tBCorrectionType;
  p_cancelled:=jsonUtils.getBoolValue(data, 'cancelled'); // boolean;
  p_block_id:=jsonUtils.getIntValue(data, 'block_id');// integer;
  p_payment_status:=BPaymentStatus.toEnum(jsonUtils.getStrValue(data, 'payment_status')); // tBPaymentStatus;
  p_payment_method:=BPaymentMethod.toEnum(jsonUtils.getStrValue(data, 'payment_method')); // tBPaymentMethod;
  p_gross_total:=jsonUtils.getFloatValue(data, 'gross_total');// double;
  p_currency:=jsonUtils.getBCurrency(data, 'currency'); // tBCurrency;
  p_conversion_rate:=jsonUtils.getFloatValue(data, 'conversion_rate');// double;
  p_invoice_date:=jsonUtils.getDateValue(data, 'invoice_date');// tDateTime;
  p_fulfillment_date:=jsonUtils.getDateValue(data, 'fulfillment_date');// tDateTime;
  p_due_date:=jsonUtils.getDateValue(data, 'due_date');// tDateTime;
  p_paid_date:=jsonUtils.getDateValue(data, 'paid_date');// tDateTime;
  p_organization.loadFromJson(jsonUtils.getValue(data, 'organization'));// tBDocumentOrganization;
  p_partner.loadFromJson(jsonUtils.getValue(data, 'partner'));//: tBPartner;
  p_document_partner.loadFromJson(jsonUtils.getValue(data, 'document_partner'));//: tBDocumentPartner;
  p_electronic:=JsonUtils.getBoolValue(data,'electronic');// boolean;
  p_comment:=JsonUtils.getStrValue(data,'comment');// string;
  p_tags:=BStringArray.toArrayFromJson(JsonUtils.getValue(data,'tags'));// tBStringArray;//string[]',
  p_notification_status:=BDocumentNotificationStatus.toEnum(JsonUtils.getStrValue(data,'notification_status'));// tBDocumentNotificationStatus;
  p_language:=BDocumentLanguage.toEnum(JsonUtils.getStrValue(data,'language'));// tBDocumentLanguage;
  p_items:=BDocumentItems.loadFromJson(JsonUtils.getValue(data,'items'));// tBDocumentItems;
  p_summary.loadFromJson(JsonUtils.getValue(data,'summary'));//: tBDocumentSummary;
  p_settings.loadFromJson(JsonUtils.getValue(data,'settings'));//: tBDocumentSettings;
  p_online_szamla_status:=BOnlineSzamlaStatusEnum.toEnum(JsonUtils.getStrValue(data,'online_szamla_status'));// tBOnlineSzamlaStatusEnum;
  p_related_documents:= BDocumentAncestors.loadFromJson(JsonUtils.getStrValue(data,'related_documents'));//: tBDocumentAncestors;
  p_discount.loadFromJson(JsonUtils.getValue(data,'discount'));//: tBDiscount;
end;

function tBDocument.toJsonStr(deep : integer; after: string):string;
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
  lines.Add(deepStr+#9+'"invoice_number": "'+p_invoice_number+'",');
  lines.Add(deepStr+#9+'"type": "'+BDocumentType.toString(p_type)+'",');
  lines.Add(deepStr+#9+'"p_cancelled": '+BillingoUtils.BoolToStr(p_cancelled)+', ');
  lines.Add(deepStr+#9+'"block_id": '+IntToStr(p_block_id)+', ');
  lines.Add(deepStr+#9+'"payment_status": "'+BPaymentStatus.toString(p_payment_status)+'",');
  lines.Add(deepStr+#9+'"payment_method": "'+BPaymentMethod.toString(p_payment_method)+'",');
  lines.Add(deepStr+#9+'"gross_total": '+FloatToStr(p_gross_total)+', ');
  lines.Add(deepStr+#9+'"currency": "'+BCurrency.toString(p_currency)+'",');
  lines.Add(deepStr+#9+'"conversion_rate": '+FloatToStr(p_conversion_rate)+', ');
  lines.Add(deepStr+#9+'"invoice_date": "'+FormatDateTime('yyyy-mm-dd', p_invoice_date)+'",');
  lines.Add(deepStr+#9+'"fulfillment_date": "'+FormatDateTime('yyyy-mm-dd', p_fulfillment_date)+'",');
  lines.Add(deepStr+#9+'"due_date": "'+FormatDateTime('yyyy-mm-dd', p_due_date)+'",');
  lines.Add(deepStr+#9+'"paid_date": "'+FormatDateTime('yyyy-mm-dd', p_paid_date)+'",');
  lines.Add(deepStr+#9+'"organization":');
  lines.Add(deepStr+#9+p_organization.toJsonStr(deep+2,','));
  lines.Add(deepStr+#9+'"partner":');
  lines.Add(deepStr+#9+p_partner.toJsonStr(deep+2,','));
  lines.Add(deepStr+#9+'"document_partner":');
  lines.Add(deepStr+#9+p_document_partner.toString(deep+2,','));
  lines.Add(deepStr+#9+'"electronic": '+BillingoUtils.BoolToStr(p_electronic)+', ');
  lines.Add(deepStr+#9+'"comment": "'+p_comment+'",');
  lines.Add(deepStr+#9+'"tags":');
  lines.Add(deepStr+#9+BStringArray.toString(p_tags,deep+2,','));
  lines.Add(deepStr+#9+'"notification_status": "'+BDocumentNotificationStatus.toString(p_notification_status)+'",');
  lines.Add(deepStr+#9+'"language": "'+BDocumentLanguage.toString(p_language)+'",');
  lines.Add(deepStr+#9+'"items":');
  lines.Add(deepStr+#9+BDocumentItems.toString(p_items,deep+2,','));
  lines.Add(deepStr+#9+'"summary":');
  lines.Add(deepStr+#9+p_summary.toJsonStr(deep+2,','));
  lines.Add(deepStr+#9+'"settings":');
  lines.Add(deepStr+#9+p_settings.toJsonStr(deep+2,','));
  lines.Add(deepStr+#9+'"online_szamla_status": "'+BOnlineSzamlaStatusEnum.toString(p_online_szamla_status)+'",');
  lines.Add(deepStr+#9+'"related_documents":');
  lines.Add(deepStr+#9+BDocumentAncestors.toString(p_related_documents,deep+2,','));
  lines.Add(deepStr+#9+'"discount":');
  lines.Add(deepStr+#9+p_discount.toJsonStr(deep+2,','));
  lines.Add(deepStr+#9+'"correction_type": "'+BCorrectionType.toString(p_correction_type)+'",');
  lines.Add(deepStr+'}');

  result:=copy(lines.Text,0,length(lines.Text)-2);
  lines.Destroy;
end;
end.
