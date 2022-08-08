unit BCurrency;

interface
type
tBCurrency = (
              NULL,
              AED,// = 'AED';
              AUD,// = 'AUD';
              BGN,// = 'BGN';
              BRL,// = 'BRL';
              CAD,// = 'CAD';
              CHF,// = 'CHF';
              CNY,// = 'CNY';
              CZK,// = 'CZK';
              DKK,// = 'DKK';
              EUR,// = 'EUR';
              GBP,// = 'GBP';
              HKD,// = 'HKD';
              HRK,// = 'HRK';
              HUF,// = 'HUF';
              IDR,// = 'IDR';
              ILS,// = 'ILS';
              INR,// = 'INR';
              ISK,// = 'ISK';
              JPY,// = 'JPY';
              KRW,// = 'KRW';
              MXN,// = 'MXN';
              MYR,// = 'MYR';
              NOK,// = 'NOK';
              NZD,// = 'NZD';
              PHP,// = 'PHP';
              PLN,// = 'PLN';
              RON,// = 'RON';
              RSD,// = 'RSD';
              RUB,// = 'RUB';
              SEK,// = 'SEK';
              SGD,// = 'SGD';
              THB,// = 'THB';
              _TRY,// = 'TRY';
              UAH,// = 'UAH';
              USD,// = 'USD';
              ZAR// = 'ZAR';
            );

  function toString(data: tBCurrency): string;
  function toEnum(data: string): tBCurrency;
implementation

function toEnum(data: string): tBCurrency;
begin
  result:=NULL;
  if data='AED' then result:= AED;
  if data='AUD' then result:= AUD;
  if data='BGN' then result:= BGN;
  if data='BRL' then result:= BRL;
  if data='CAD' then result:= CAD;
  if data='CHF' then result:= CHF;
  if data='CNY' then result:= CNY;
  if data='CZK' then result:= CZK;
  if data='DKK' then result:= DKK;
  if data='EUR' then result:= EUR;
  if data='GBP' then result:= GBP;
  if data='HKD' then result:= HKD;
  if data='HRK' then result:= HRK;
  if data='HUF' then result:= HUF;
  if data='IDR' then result:= IDR;
  if data='ILS' then result:= ILS;
  if data='INR' then result:= INR;
  if data='ISK' then result:= ISK;
  if data='JPY' then result:= JPY;
  if data='KRW' then result:= KRW;
  if data='MXN' then result:= MXN;
  if data='MYR' then result:= MYR;
  if data='NOK' then result:= NOK;
  if data='NZD' then result:= NZD;
  if data='PHP' then result:= PHP;
  if data='PLN' then result:= PLN;
  if data='RON' then result:= RON;
  if data='RSD' then result:= RSD;
  if data='RUB' then result:= RUB;
  if data='SEK' then result:= SEK;
  if data='SGD' then result:= SGD;
  if data='THB' then result:= THB;
  if data='TRY' then result:= _TRY;
  if data='UAH' then result:= UAH;
  if data='USD' then result:= USD;
  if data='ZAR' then result:= ZAR;
end;

function toString(data: tBCurrency): string;
begin
  result:='';
  case data of
      AED: result:= 'AED';
      AUD: result:= 'AUD';
      BGN: result:= 'BGN';
      BRL: result:= 'BRL';
      CAD: result:= 'CAD';
      CHF: result:= 'CHF';
      CNY: result:= 'CNY';
      CZK: result:= 'CZK';
      DKK: result:= 'DKK';
      EUR: result:= 'EUR';
      GBP: result:= 'GBP';
      HKD: result:= 'HKD';
      HRK: result:= 'HRK';
      HUF: result:= 'HUF';
      IDR: result:= 'IDR';
      ILS: result:= 'ILS';
      INR: result:= 'INR';
      ISK: result:= 'ISK';
      JPY: result:= 'JPY';
      KRW: result:= 'KRW';
      MXN: result:= 'MXN';
      MYR: result:= 'MYR';
      NOK: result:= 'NOK';
      NZD: result:= 'NZD';
      PHP: result:= 'PHP';
      PLN: result:= 'PLN';
      RON: result:= 'RON';
      RSD: result:= 'RSD';
      RUB: result:= 'RUB';
      SEK: result:= 'SEK';
      SGD: result:= 'SGD';
      THB: result:= 'THB';
      _TRY: result:= 'TRY';
      UAH: result:= 'UAH';
      USD: result:= 'USD';
      ZAR: result:= 'ZAR';
  end;
end;
end.
