unit BDocumentInsertType;

interface
type
tBDocumentInsertType = ( ADVANCE,// string = 'advance',
                        DRAFT,// = 'draft',
                        INVOICE,// = 'invoice',
                        PROFORMA// = 'proforma'
                      );
function toString(data: tBDocumentInsertType): string;
function toEnum(data: string): tBDocumentInsertType;
implementation

function toEnum(data: string): tBDocumentInsertType;
begin
      if data='advance' then result:= ADVANCE;
      if data='draft' then result:= DRAFT;
      if data='invoice' then result:= INVOICE;
      if data='proforma' then result:= PROFORMA;
end;

function toString(data: tBDocumentInsertType): string;
begin
  result:='';
  case data of
      ADVANCE: result:= 'advance';
      DRAFT: result:= 'draft';
      INVOICE: result:= 'invoice';
      PROFORMA: result:= 'proforma';
  end;
end;

end.
