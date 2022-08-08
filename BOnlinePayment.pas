unit BOnlinePayment;

interface
type
tBOnlinePayment = (
                   EMPTY,// = '';
                   BARION,// = 'Barion';
                   SIMPLE_PAY,// = 'SimplePay';
                   NO// = 'no';
                );

  function toString(data : tBOnlinePayment): string;
  function toEnum(data: string): tBOnlinePayment;
implementation

function toEnum(data: string): tBOnlinePayment;
begin
         if data='' then result:= EMPTY;
         if data='Barion' then result:= BARION;
         if data='SimplePay' then result:= SIMPLE_PAY;
         if data='no' then result:= NO;
end;

function toString(data : tBOnlinePayment): string;
begin
  case data of
         EMPTY: result:= '';
         BARION: result:= 'Barion';
         SIMPLE_PAY: result:= 'SimplePay';
         NO: result:= 'no';
  end;
end;
end.
