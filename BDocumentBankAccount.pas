unit BDocumentBankAccount;

interface
uses Classes, SysUtils, JsonUtils;

type
tBDocumentBankAccount = class
    private
      { protected declarations }
      p_id: integer;
      p_name: string;
      p_account_number: string;
      p_account_number_iban: string;
      p_swift: string;
    public
      { public declarations }
      constructor Create();virtual;
      destructor Destroy();override;
      property id : integer read p_id write p_id;
      property name : string read p_name write p_name;
      property account_number : string read p_account_number write p_account_number;
      property account_number_iban : string read p_account_number_iban write p_account_number_iban;
      property swift : string read p_swift write p_swift;

      function toJsonStr(deep : integer; after: string):string;
      function loadFromJson(data: string): tBDocumentBankAccount;
    end;

implementation

constructor tBDocumentBankAccount.Create;
begin
end;

destructor tBDocumentBankAccount.Destroy;
begin
end;

function tBDocumentBankAccount.loadFromJson(data: string): tBDocumentBankAccount;
begin
  p_id:=JsonUtils.getIntValue(data,'id');// integer;
  p_name:=JsonUtils.getStrValue(data,'name');// string;
  p_account_number:=JsonUtils.getStrValue(data,'account_number');// string;
  p_account_number_iban:=JsonUtils.getStrValue(data,'account_number_iban');// string;
  p_swift:=JsonUtils.getStrValue(data,'swift');// string;
end;

function tBDocumentBankAccount.toJsonStr(deep : integer; after: string):string;
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
  lines.Add(deepStr+#9+'"name": "'+p_name+'",');
  lines.Add(deepStr+#9+'"account_number": "'+p_account_number+'",');
  lines.Add(deepStr+#9+'"account_number_iban": "'+p_account_number_iban+'",');
  lines.Add(deepStr+#9+'"swift": "'+p_swift+'"');
  lines.Add(deepStr+'}'+after);

  result:=copy(lines.Text,0,length(lines.Text)-2);
  lines.Destroy;
end;
end.
