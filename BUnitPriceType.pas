unit BUnitPriceType;

interface
type
tBUnitPriceType = (
                    GROSS,// = 'gross';
                    NET// = 'net';
                  );

  function toString(data : tBUnitPriceType): string;
  function toEnum(data: string):tBUnitPriceType;
implementation

function toEnum(data: string):tBUnitPriceType;
begin
        if data='gross' then result:= GROSS;
        if data='net' then result:= NET;
end;

function toString(data : tBUnitPriceType): string;
begin
  case data of
        GROSS: result:= 'gross';
        NET: result:= 'net';
  end;
end;
end.
