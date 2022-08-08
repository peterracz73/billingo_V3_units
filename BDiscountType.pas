unit BDiscountType;

interface
type
tBDiscountType = (
                  NULL,
                  PERCENT// = 'percent';
                );

  function toString(data : tBDiscountType): string;
  function toEnum(data: string): tBDiscountType;
implementation

function toEnum(data: string): tBDiscountType;
begin
  result:=NULL;
  if data='percent' then result:=PERCENT;
end;

function toString(data : tBDiscountType): string;
begin
  case data of
        PERCENT: result:= 'percent';
  end;
end;
end.
