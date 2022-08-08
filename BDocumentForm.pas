unit BDocumentForm;

interface
type
tBDocumentForm = (
        NULL,
        ELECTRONIC,// = 'electronic';
        PAPER// = 'paper'
                  );
  function toString(data: tBDocumentForm): string;
  function toEnum(data: string): tBDocumentForm;
implementation

function toEnum(data: string): tBDocumentForm;
begin
        result:=NULL;
        if data='electronic' then result:= ELECTRONIC;
        if data='paper' then result:= PAPER;
end;

function toString(data: tBDocumentForm): string;
begin
  case data of
        ELECTRONIC: result:= 'electronic';
        PAPER: result:= 'paper'
  end;
end;
end.
