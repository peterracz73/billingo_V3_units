unit BPartner;

interface
uses Classes, SysUtils, BAddress, BStringArray, BPartnerTaxType,
     BPartnerCustomBillingSettings, JsonUtils;

type
tBPartner = class
  private
    p_id: integer;
    p_name: string;
    p_address: tBAddress;
    p_emails: tBStringArray;
    p_taxcode: string;
    p_iban: string;
    p_swift: string;
    p_account_number: string;
    p_phone: string;
    p_general_ledger_number: string;
    p_tax_type: tBPartnerTaxType;
    p_custom_billing_settings: tBPartnerCustomBillingSettings;
    p_group_member_tax_number: string;
  public
    constructor Create();virtual;
    destructor Destroy();override;
    property id : integer read p_id write p_id;
    property name : string read p_name write p_name;
    property address : tBAddress read p_address write p_address;
    property emails : tBStringArray read p_emails write p_emails;
    property taxcode : string read p_taxcode write p_taxcode;
    property iban : string read p_iban write p_iban;
    property swift : string read p_swift write p_swift;
    property account_number : string read p_account_number write p_account_number;
    property phone : string read p_phone write p_phone;
    property general_ledger_number : string read p_general_ledger_number write p_general_ledger_number;
    property tax_type : tBPartnerTaxType read p_tax_type write p_tax_type;
    property custom_billing_settings : tBPartnerCustomBillingSettings read p_custom_billing_settings write p_custom_billing_settings;
    property group_member_tax_number : string read p_group_member_tax_number write p_group_member_tax_number;

    function toJsonStr(deep : integer; after: string):string;
    function getEmails: tBStringArray;
    procedure setEmails(data: tBStringArray);
    procedure addEmail(data: string);
    procedure loadFromJson(data: string);
end;

implementation
constructor tBPartner.Create;
begin
    p_address:= tBAddress.Create;
    p_custom_billing_settings:= tBPartnerCustomBillingSettings.Create
end;

destructor tBPartner.Destroy;
begin
    p_address.Destroy;
    setlength(p_emails,0);
    p_custom_billing_settings.Destroy;
end;

procedure tBPartner.loadFromJson(data: string);
begin
    p_id:=JsonUtils.getIntValue(data,'id');// integer;
    p_name:=JsonUtils.getStrValue(data,'name');// string;
    p_address.loadFromJson(jsonUtils.getValue(data, 'address'));// : tBAddress;
    p_emails:=BStringArray.toArrayFromJson(jsonUtils.getValue(data, 'emails')); //tBStringArray;//string[]',
    p_taxcode:=JsonUtils.getStrValue(data,'taxcode');// string;
    p_iban:=JsonUtils.getStrValue(data,'iban');// string;
    p_swift:=JsonUtils.getStrValue(data,'swift');// string;
    p_account_number:=JsonUtils.getStrValue(data,'account_number');// string;
    p_phone:=JsonUtils.getStrValue(data,'phone');// string;
    p_general_ledger_number:=JsonUtils.getStrValue(data,'general_ledger_number');// string;
    p_tax_type:=BPartnerTaxType.toEnum(JsonUtils.getStrValue(data,'tax_type'));// tBPartnerTaxType;
    p_custom_billing_settings.loadFromJson(jsonUtils.getValue(data, 'custom_billing_settings'));//: tBPartnerCustomBillingSettings;
    p_group_member_tax_number:=JsonUtils.getStrValue(data,'group_member_tax_number');// string;
end;

function tBPartner.getEmails: tBStringArray;
begin
  result:= p_emails;
end;

procedure tBPartner.setEmails(data: tBStringArray);
begin
  p_emails:= data;
end;

procedure tBPartner.addEmail(data: string);
begin
  setlength(p_emails, length(p_emails)+1);
  p_emails[length(p_emails)-1]:=data;
end;

function tBPartner.toJsonStr(deep : integer; after: string):string;
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
  lines.Add(deepStr+#9+'"id": '+IntToStr(p_id)+',');
  lines.Add(deepStr+#9+'"name": "'+p_name+'",');
  lines.Add(deepStr+#9+'"address": ');
  lines.Add(p_address.toJsonStr(deep+2,','));
  lines.Add(deepStr+#9+'"emails":');
  lines.Add(BStringArray.toString(p_emails,deep,','));
  lines.Add(deepStr+#9+'"taxcode": "'+p_taxcode+'",');
  lines.Add(deepStr+#9+'"iban": "'+iban+'",');
  lines.Add(deepStr+#9+'"swift": "'+p_swift+'",');
  lines.Add(deepStr+#9+'"account_number": "'+p_account_number+'",');
  lines.Add(deepStr+#9+'"phone": "'+p_phone+'",');
  lines.Add(deepStr+#9+'"general_ledger_number": "'+general_ledger_number+'",');
  lines.Add(deepStr+#9+'"tax_type": "'+BPartnerTaxType.toString(tax_type)+'",');
  lines.Add(deepStr+#9+'"custom_billing_settings": ');
  lines.Add(p_custom_billing_settings.toJsonStr(deep+2,','));
  lines.Add(deepStr+#9+'"group_member_tax_number": "'+p_group_member_tax_number+'"');
  lines.Add(deepStr+'}'+after);

  result:=copy(lines.Text,0,length(lines.Text)-2);
  lines.Destroy;
end;
end.
