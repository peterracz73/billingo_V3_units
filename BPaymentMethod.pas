unit BPaymentMethod;

interface
type
tBPaymentMethod = ( NULL,
                    ARUHITEL,// = 'aruhitel',
                    BANKCARD,// = 'bankcard',
                    BARION,// = 'barion',
                    BARTER,// = 'barter',
                    CASH,// = 'cash',
                    CASH_ON_DELIVERY,// = 'cash_on_delivery',
                    COUPON,// = 'coupon',
                    ELORE_UTALAS,// = 'elore_utalas',
                    EP_KARTYA,// = 'ep_kartya',
                    KOMPENZACIO,// = 'kompenzacio',
                    LEVONAS,// = 'levonas',
                    ONLINE_BANKCARD,// = 'online_bankcard',
                    OTHER,// = 'other',
                    PAYLIKE,// = 'paylike',
                    PAYONEER,// = 'payoneer',
                    PAYPAL,// = 'paypal',
                    PAYPAL_UTOLAG,// = 'paypal_utolag',
                    PAYU,// = 'payu',
                    PICK_PACK_PONT,// = 'pick_pack_pont',
                    POSTAI_CSEKK,// = 'postai_csekk',
                    POSTAUTALVANY,// = 'postautalvany',
                    SKRILL,// = 'skrill',
                    SZEP_CARD,// = 'szep_card',
                    TRANSFERWISE,// = 'transferwise',
                    UPWORK,// = 'upwork',
                    UTALVANY,// = 'utalvany',
                    VALTO,// = 'valto',
                    WIRE_TRANSFER// = 'wire_transfer'
                  );

  function toString(data: tBPaymentMethod): string;
  function toEnum(data: string): tBPaymentMethod;

implementation

function toEnum(data: string): tBPaymentMethod;
begin
    result:=NULL;
    if data='aruhitel' then result:= ARUHITEL;
    if data='bankcard' then result:= BANKCARD;
    if data='barion' then result:= BARION;
    if data='barter' then result:= BARTER;
    if data='cash' then result:= CASH;
    if data='cash_on_delivery' then result:= CASH_ON_DELIVERY;
    if data='coupon' then result:= COUPON;
    if data='elore_utalas' then result:= ELORE_UTALAS;
    if data='ep_kartya' then result:= EP_KARTYA;
    if data='kompenzacio' then result:= KOMPENZACIO;
    if data='levonas' then result:= LEVONAS;
    if data='online_bankcard' then result:= ONLINE_BANKCARD;
    if data='other' then result:= OTHER;
    if data='paylike' then result:= PAYLIKE;
    if data='payoneer' then result:= PAYONEER;
    if data='paypal' then result:= PAYPAL;
    if data='paypal_utolag' then result:= PAYPAL_UTOLAG;
    if data='payu' then result:= PAYU;
    if data='pick_pack_pont' then result:= PICK_PACK_PONT;
    if data='postai_csekk' then result:= POSTAI_CSEKK;
    if data='postautalvany' then result:= POSTAUTALVANY;
    if data='skrill' then result:= SKRILL;
    if data='szep_card' then result:= SZEP_CARD;
    if data='transferwise' then result:= TRANSFERWISE;
    if data='upwork' then result:= UPWORK;
    if data='utalvany' then result:= UTALVANY;
    if data='valto' then result:= VALTO;
    if data='wire_transfer' then result:= WIRE_TRANSFER;
end;

function toString(data: tBPaymentMethod): string;
begin
  case data of
    ARUHITEL: result:= 'aruhitel';
    BANKCARD: result:= 'bankcard';
    BARION: result:= 'barion';
    BARTER: result:= 'barter';
    CASH: result:= 'cash';
    CASH_ON_DELIVERY: result:= 'cash_on_delivery';
    COUPON: result:= 'coupon';
    ELORE_UTALAS: result:= 'elore_utalas';
    EP_KARTYA: result:= 'ep_kartya';
    KOMPENZACIO: result:= 'kompenzacio';
    LEVONAS: result:= 'levonas';
    ONLINE_BANKCARD: result:= 'online_bankcard';
    OTHER: result:= 'other';
    PAYLIKE: result:= 'paylike';
    PAYONEER: result:= 'payoneer';
    PAYPAL: result:= 'paypal';
    PAYPAL_UTOLAG: result:= 'paypal_utolag';
    PAYU: result:= 'payu';
    PICK_PACK_PONT: result:= 'pick_pack_pont';
    POSTAI_CSEKK: result:= 'postai_csekk';
    POSTAUTALVANY: result:= 'postautalvany';
    SKRILL: result:= 'skrill';
    SZEP_CARD: result:= 'szep_card';
    TRANSFERWISE: result:= 'transferwise';
    UPWORK: result:= 'upwork';
    UTALVANY: result:= 'utalvany';
    VALTO: result:= 'valto';
    WIRE_TRANSFER: result:= 'wire_transfer';
  end;
end;
end.
