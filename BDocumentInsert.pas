unit BDocumentInsert;

interface

uses SysUtils, Classes, BOnlinePayment, BDocumentInsertType, BCurrency, BVat,
     IdHTTP, IdSSLOpenSSL, BPaymentMethod, BDocumentLanguage, BUnitPriceType, JsonUtils,
     BEntitlement, BDocumentItemData, BOneOfDocumentInsertItemsItems, BDocumentSettings,
     BDocumentProductData, BDiscount, BillingoUtils, BDocument, BItems, BAdvanceInvoice,
     BDiscountType;

type

  tBDocumentInsert = class
  private
    p_vendor_id: string;
    p_partner_id: integer;
    p_block_id: integer;
    p_bank_account_id: integer;
    p_type: tBDocumentInsertType;
    p_fulfillment_date: tDateTime;
    p_due_date: tDateTime;
    p_payment_method: tBPaymentMethod;
    p_language: tBDocumentLanguage;
    p_currency: tBCurrency;
    p_conversion_rate: double;
    p_electronic: boolean;
    p_paid: boolean;
    p_items: tBItems;
    p_comment: string;
    p_settings: tBDocumentSettings;
    p_advance_invoice: tBAdvanceInvoice;
    p_discount: tBDiscount;
    p_instant_payment: boolean;
    function  getItems : tBItems;
    procedure setItems(data: tBItems);
    function generateJson: string;
  public
    constructor Create();virtual;
    destructor Destroy();override;
    property vendor_id : string read p_vendor_id write p_vendor_id;
    property partner_id : integer read p_partner_id write p_partner_id;
    property block_id : integer read p_block_id write p_block_id;
    property bank_account_id: integer read p_bank_account_id write p_bank_account_id;
    property type_: tBDocumentInsertType read p_type write p_type;
    property fulfillment_date: tDateTime read p_fulfillment_date write p_fulfillment_date;
    property due_date: tDateTime read p_due_date write p_due_date;
    property payment_method: tBPaymentMethod read p_payment_method write p_payment_method;
    property language: tBDocumentLanguage read p_language write p_language;
    property currency: tBCurrency read p_currency write p_currency;
    property conversion_rate: double read p_conversion_rate write p_conversion_rate;
    property electronic: boolean read p_electronic write p_electronic;
    property paid: boolean read p_paid write p_paid;
    property items: tBItems read getItems write setItems;
    property comment: string read p_comment write p_comment;
    property settings: tBDocumentSettings read p_settings write p_settings;
    property advance_invoice: tBAdvanceInvoice read p_advance_invoice write p_advance_invoice;
    property discount: tBDiscount read p_discount write p_discount;
    property instant_payment: boolean read p_instant_payment write p_instant_payment;

    procedure AddItem(item: tBDocumentItemData);
    procedure AddProduct(product: tBDocumentProductData);
    function  getJson: string;
    procedure loadFromJson(data: string);
  end;


implementation

constructor tBDocumentInsert.Create();
begin
  p_settings:=tBDocumentSettings.Create;
  p_discount:=tBDiscount.Create;
  p_discount.type_:=BDiscountType.PERCENT;
  p_discount.value:=0;
end;

destructor tBDocumentInsert.Destroy();
var
  i0  : integer;
begin
  for i0 := 0 to length(p_items) - 1 do
  begin
    p_items[i0].Free;
  end;
  setLength(p_items,0);
  setLength(p_advance_invoice,0);
  p_settings.Destroy;
  p_discount.Destroy;
end;

function  tBDocumentInsert.getItems : tBItems;
begin
  result:=p_items;
end;

procedure tBDocumentInsert.setItems(data: tBItems);
begin
  p_items:= data;
end;

procedure tBDocumentInsert.AddItem(item: tBDocumentItemData);
var
  dItem : tBOneOfDocumentInsertItemsItems;
begin
  dItem:= tBOneOfDocumentInsertItemsItems.Create;
  dItem.setDocumentItemData(item);
  setlength(p_items, length(p_items)+1);
  p_items[length(p_items)-1]:= dItem;
end;

procedure tBDocumentInsert.AddProduct(product: tBDocumentProductData);
var
  dItem : tBOneOfDocumentInsertItemsItems;
begin
  dItem:= tBOneOfDocumentInsertItemsItems.Create;
  dItem.setDocumentProductData(product);
  setlength(p_items, length(p_items)+1);
  p_items[length(p_items)-1]:= dItem;
end;

function tBDocumentInsert.getJson: string;
var
  answer  : string;
begin
  result:= generateJson;
end;

function tBDocumentInsert.generateJson: string;
var
  lines   : tStringList;
  i0,i1,sLength   : integer;
  subLines: tStringList;
begin
  lines:=tStringList.Create;
  lines.Add('{');
  lines.Add(#09+'"vendor_id": "'+p_vendor_id+'",');
  lines.Add(#09+'"partner_id": '+IntToStr(p_partner_id)+',');
  lines.Add(#09+'"block_id": '+IntToStr(p_block_id)+',');
  lines.Add(#09+'"bank_account_id": '+IntToStr(p_bank_account_id)+',');
  lines.Add(#09+'"type": "'+BDocumentInsertType.toString(p_type)+'",');
  lines.Add(#09+'"fulfillment_date": "'+FormatDateTime('yyyy-mm-dd', p_fulfillment_date)+'",');
  lines.Add(#09+'"due_date": "'+FormatDateTime('yyyy-mm-dd', p_due_date)+'",');
  lines.Add(#09+'"payment_method": "'+BPaymentMethod.toString(p_payment_method)+'",');
  lines.Add(#09+'"language": "'+BDocumentLanguage.toString(p_language)+'",');
  lines.Add(#09+'"currency": "'+BCurrency.toString(p_currency)+'",');
  lines.Add(#09+'"conversion_rate": '+FloatToStr(p_conversion_rate)+',');
  lines.Add(#09+'"electronic": '+BillingoUtils.BoolToStr(p_electronic)+',');
  lines.Add(#09+'"paid": '+BillingoUtils.BoolToStr(p_paid)+',');
  lines.Add(#09+'"items": [');
  for i0 := 0 to length(p_items) - 1 do
  begin
    subLines:=tStringList.Create;
    subLines.Text:=p_items[i0].toJsonStr(2);
    lines.AddStrings(sublines);
    subLines.Destroy;
    if i0<length(p_items) - 1 then
    lines.Add(#09#09+',');
  end;
  lines.Add(#09+'],');
  lines.Add(#09+'"comment": "'+p_comment+'",');
  lines.Add(#09+'"settings": ');
  lines.Add(p_settings.toJsonStr(2,','));
  sLength:=length(p_advance_invoice);
  if sLength>0 then
  begin
    lines.Add(#09+'"advance_invoice": [');
    for i0 := 0 to sLength - 1 do
    begin
      if i0< sLength-1 then
        lines.Add(#09#09+IntToStr(p_advance_invoice[i0])+',')
      else
        lines.Add(#09#09+IntToStr(p_advance_invoice[i0]));
    end;
    lines.Add(#09+',');
  end;
  lines.Add(#09+'"discount": ');
  lines.Add(p_discount.toJsonStr(2,','));
  lines.Add(#09+'"instant_payment": '+BillingoUtils.BoolToStr(p_instant_payment));

  lines.Add('}');
  lines.SaveToFile('DocumentInsert.json');
  result:=lines.Text;
  lines.Destroy;
end;

procedure tBDocumentInsert.loadFromJson(data: string);
begin
    p_vendor_id:=jsonUtils.getStrValue(data, 'vendor_id');
    p_partner_id:=jsonUtils.getIntValue(data, 'partner_id');
    p_block_id:=jsonUtils.getIntValue(data, 'block_id');
    p_bank_account_id:=jsonUtils.getIntValue(data, 'bank_account_id');
    p_type:= BDocumentInsertType.toEnum(jsonUtils.getStrValue(data, 'type'));
    p_fulfillment_date:=jsonUtils.getDateValue(data, 'fulfillment_date');
    p_due_date:=jsonUtils.getDateValue(data, 'due_date');
    p_payment_method:= BPaymentMethod.toEnum(jsonUtils.getStrValue(data, 'payment_method'));
    p_language:= BDocumentLanguage.toEnum(jsonUtils.getStrValue(data, 'language'));
    p_currency:= BCurrency.toEnum(jsonUtils.getStrValue(data, 'currency'));
    p_conversion_rate:=jsonUtils.getFloatValue(data, 'conversion_rate');
    p_electronic:=jsonUtils.getBoolValue(data, 'electronic');
    p_paid:=jsonUtils.getBoolValue(data, 'paid');
    p_items:=BItems.loadFromJson(JsonUtils.getValue(data,'items'));
    p_comment:=jsonUtils.getStrValue(data, 'comment');
    p_settings.loadFromJson(JsonUtils.getValue(data,'settings'));//:=BDocumentSettings;
    p_advance_invoice:= BAdvanceInvoice.loadFromJson(JsonUtils.getValue(data,'advance_invoice'));
    p_discount.loadFromJson(JsonUtils.getValue(data,'discount'));//: BDiscount;
    p_instant_payment:=jsonUtils.getBoolValue(data, 'instant_payment');
end;

end.
