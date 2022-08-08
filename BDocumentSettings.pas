unit BDocumentSettings;

interface
uses BOnlinePayment, BRound, BDocumentType, Classes, SysUtils, BillingoUtils,
    JsonUtils;

type

  tBDocumentSettings = class
  private
    p_mediated_service: boolean;
    p_without_financial_fulfillment: boolean;
    p_online_payment: tBOnlinePayment;
    p_round: tBRound;
    p_no_send_onlineszamla_by_user: boolean;
    p_order_number: string;
    p_place_id: integer;
    p_instant_payment: boolean;
    p_selected_type: tBDocumentType;
  public
    constructor Create();virtual;
    destructor Destroy();override;
    property mediatedService : boolean read p_mediated_service write p_mediated_service;
    property without_financial_fulfillment : boolean read p_without_financial_fulfillment write p_without_financial_fulfillment;
    property online_payment : tBOnlinePayment read p_online_payment write p_online_payment;
    property round : tBRound read p_round write p_round;
    property no_send_onlineszamla_by_user : boolean read p_no_send_onlineszamla_by_user write p_no_send_onlineszamla_by_user;
    property order_number : string read p_order_number write p_order_number;
    property place_id : integer read p_place_id write p_place_id;
    property instant_payment : boolean read p_instant_payment write p_instant_payment;
    property selected_type : tBDocumentType read p_selected_type write p_selected_type;

    function toJsonStr(deep: integer; after: string): string;
    procedure loadFromJson(data: string);
  end;
implementation
constructor tBDocumentSettings.Create;
begin
end;

destructor tBDocumentSettings.Destroy;
begin
end;

procedure tBDocumentSettings.loadFromJson(data: string);
begin
    p_mediated_service:=JsonUtils.getBoolValue(data, 'mediated_service');// boolean;
    p_without_financial_fulfillment:=JsonUtils.getBoolValue(data, 'p_without_financial_fulfillment');// boolean;
    p_online_payment:=BOnlinePayment.toEnum(JsonUtils.getStrValue(data, 'online_payment'));// tBOnlinePayment;
    p_round:=BRound.toEnum(JsonUtils.getStrValue(data, 'round'));// tBRound;
    p_no_send_onlineszamla_by_user:=JsonUtils.getBoolValue(data, 'no_send_onlineszamla_by_user');// boolean;
    p_order_number:=JsonUtils.getStrValue(data, 'order_number');// string;
    p_place_id:=JsonUtils.getIntValue(data, 'place_id');//integer;
    p_instant_payment:=JsonUtils.getBoolValue(data, 'instant_payment');// boolean;
    p_selected_type:=BDocumentType.toEnum(JsonUtils.getStrValue(data, 'selected_type'));// tBDocumentType;
end;

function tBDocumentSettings.toJsonStr(deep: integer; after: string): string;
var
  deepStr :  string;
  i0      : integer;
  lines   : tStringList;
  s0  : string;
begin
  deepStr:='';
  for i0 := 1 to deep do
    deepStr:=deepStr+#9;

  lines:=tStringList.Create;

  lines.Add(deepStr+'{');
  lines.Add(deepStr+#9'"mediated_service": '+BillingoUtils.BoolToStr(p_mediated_service)+',');
  lines.Add(deepStr+#9'"without_financial_fulfillment": '+BillingoUtils.BoolToStr(p_without_financial_fulfillment)+',');
  lines.Add(deepStr+#9'"online_payment": "'+BOnlinePayment.toString(p_online_payment)+'",');
  lines.Add(deepStr+#9'"round": "'+BRound.toString(p_round)+'",');
  lines.Add(deepStr+#9'"no_send_onlineszamla_by_user": '+BillingoUtils.BoolToStr(p_no_send_onlineszamla_by_user)+',');
  lines.Add(deepStr+#9'"order_number": "'+p_order_number+'",');
  lines.Add(deepStr+#9'"place_id": '+IntToStr(p_place_id)+',');
  lines.Add(deepStr+#9'"instant_payment": '+BillingoUtils.BoolToStr(p_instant_payment)+',');
  lines.Add(deepStr+#9'"selected_type": "'+BDocumentType.toString(p_selected_type)+'"');
  lines.Add(deepStr+'}'+after);

  result:=copy(lines.Text,0,length(lines.Text)-2);
  lines.Destroy;
end;

end.
