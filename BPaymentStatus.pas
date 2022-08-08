unit BPaymentStatus;

interface
type
tBPaymentStatus = (
                    NULL,
                    EXPIRED,// = 'expired';
                    NONE,// = 'none';
                    OUTSTANDING,// = 'outstanding';
                    PAID,// = 'paid';
                    PARTIALLY_PAID// = 'partially_paid';
                  );

  function toString(data: tBPaymentStatus): string;
  function toEnum(data: string): tBPaymentStatus;

implementation

function toEnum(data: string): tBPaymentStatus;
begin
    result:=NULL;
    if data='expired' then result:= EXPIRED;
    if data='none' then result:= NONE;
    if data='outstanding' then result:= OUTSTANDING;
    if data='paid' then result:= PAID;
    if data='partially_paid' then result:= PARTIALLY_PAID;
end;

function toString(data: tBPaymentStatus): string;
begin
  case data of
    EXPIRED: result:= 'expired';
    NONE: result:= 'none';
    OUTSTANDING: result:= 'outstanding';
    PAID: result:= 'paid';
    PARTIALLY_PAID: result:= 'partially_paid';
  end;
end;
end.
