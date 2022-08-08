unit BPartnerTaxType;

interface
type
tBPartnerTaxType = (
        EMPTY,// = '';
        FOREIGN,// = 'FOREIGN';
        HAS_TAX_NUMBER,// = 'HAS_TAX_NUMBER';
        NO_TAX_NUMBER// = 'NO_TAX_NUMBER';
        );
  function toString(data: tBPartnerTaxType): string;
  function toEnum(data: string): tBPartnerTaxType;
implementation

function toEnum(data: string): tBPartnerTaxType;
begin
        if data='' then result:= EMPTY;
        if data='FOREIGN' then result:= FOREIGN;
        if data='HAS_TAX_NUMBER' then result:= HAS_TAX_NUMBER;
        if data='NO_TAX_NUMBER' then result:= NO_TAX_NUMBER;
end;

function toString(data: tBPartnerTaxType): string;
begin
  case data of
        EMPTY: result:= '';
        FOREIGN: result:= 'FOREIGN';
        HAS_TAX_NUMBER: result:= 'HAS_TAX_NUMBER';
        NO_TAX_NUMBER: result:= 'NO_TAX_NUMBER';
  end;
end;
end.
