unit BDocumentOrganization;

interface
uses BDocumentBankAccount, BAddress, Classes, SysUtils, BillingoUtils,
    JsonUtils;

type
tBDocumentOrganization = class
  private
    p_name: string;
    p_tax_number: string;
    p_bank_account: tBDocumentBankAccount;
    p_address: tBAddress;
    p_small_taxpayer: boolean;
    p_ev_number: string;
    p_eu_tax_number: string;
    p_cash_settled: boolean;
  public
    constructor Create();virtual;
    destructor Destroy();override;
    property name : string read p_name write p_name;
    property tax_number : string read p_tax_number write p_tax_number;
    property bank_account : tBDocumentBankAccount read p_bank_account write p_bank_account;
    property address : tBAddress read p_address write p_address;
    property small_taxpayer : boolean read p_small_taxpayer write p_small_taxpayer;
    property ev_number : string read p_ev_number write p_ev_number;
    property eu_tax_number : string read p_eu_tax_number write p_eu_tax_number;
    property cash_settled : boolean read p_cash_settled write p_cash_settled;

    function toJsonStr(deep : integer; after: string): string;
    procedure loadFromJson(data: string);
  end;

implementation

constructor tBDocumentOrganization.Create;
begin
    p_bank_account:= tBDocumentBankAccount.Create;
    p_address:= tBAddress.Create;
end;

destructor tBDocumentOrganization.Destroy;
begin
    p_bank_account.Destroy;
    p_address.Destroy;
end;

procedure tBDocumentOrganization.loadFromJson(data: string);
begin
    p_name:=JsonUtils.getStrValue(data,'name');// string;
    p_tax_number:=JsonUtils.getStrValue(data,'tax_number');// string;

    p_bank_account.loadFromJson(jsonUtils.getValue(data, 'bank_account'));//: tBDocumentBankAccount;
    p_address.loadFromJson(jsonUtils.getValue(data, 'address'));// tBAddress;
    p_small_taxpayer:=JsonUtils.getBoolValue(data,'small_taxpayer');// boolean;
    p_ev_number:=JsonUtils.getStrValue(data,'ev_number');// string;
    p_eu_tax_number:=JsonUtils.getStrValue(data,'eu_tax_number');// string;
    p_cash_settled:=JsonUtils.getBoolValue(data,'cash_settled');// boolean;

end;

function tBDocumentOrganization.toJsonStr(deep : integer; after: string): string;
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
  lines.Add(deepStr+#9+'"name": "'+p_name+'",');
  lines.Add(deepStr+#9+'"tax_number": "'+p_tax_number+'",');
  lines.Add(deepStr+#9+'"bank_account": [');
  lines.Add(p_bank_account.toJsonStr(2,','));
  lines.Add(deepStr+#9+'"address": ');
  lines.Add(p_address.toJsonStr(2,','));

  lines.Add(deepStr+#9+'"small_taxpayer": "'+BillingoUtils.BoolToStr(p_small_taxpayer)+'",');
  lines.Add(deepStr+#9+'"ev_number": "'+p_ev_number+'",');
  lines.Add(deepStr+#9+'"eu_tax_number": "'+p_eu_tax_number+'",');
  lines.Add(deepStr+#9+'"cash_settled": "'+BillingoUtils.BoolToStr(small_taxpayer)+'",');
  lines.Add(deepStr+'}'+after);

  result:=copy(lines.Text,0,length(lines.Text)-2);
  lines.Destroy;
end;
end.
