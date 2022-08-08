unit BRound;

interface
type
  tBRound =(
            FIVE,// = 'five';
            NONE,// = 'none';
            ONE,// = 'one';
            TEN// = 'ten';
          );

  function toString(data : tBRound): string;
  function toEnum(data: string): tBRound;
implementation

function toEnum(data: string): tBRound;
begin
  if data='five' then result:= FIVE;
  if data='none' then result:= NONE;
  if data='one' then result:= ONE;
  if data='ten' then result:= TEN;
end;

function toString(data : tBRound): string;
begin
  case data of
          FIVE: result:= 'five';
          NONE: result:= 'none';
          ONE: result:= 'one';
          TEN: result:= 'ten';
  end;
end;
end.
