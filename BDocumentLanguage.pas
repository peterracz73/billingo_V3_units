unit BDocumentLanguage;

interface
type
tBDocumentLanguage = (
                      NULL,
                      DE,// = 'de';
                      EN,// = 'en';
                      FR,// = 'fr';
                      HR,// = 'hr';
                      HU,// = 'hu';
                      IT,// = 'it';
                      RO,// = 'ro';
                      SK,// = 'sk';
                      US// = 'us';
                    );

  function toString(data: tBDocumentLanguage): string;
  function toEnum(data: string): tBDocumentLanguage;
implementation

function toEnum(data: string): tBDocumentLanguage;
begin
    result:=NULL;
    if data='de' then result:= DE;
    if data='en' then result:= EN;
    if data='fr' then result:= FR;
    if data='hr' then result:= HR;
    if data='hu' then result:= HU;
    if data='it' then result:= IT;
    if data='ro' then result:= RO;
    if data='sk' then result:= SK;
    if data='us' then result:= US;
end;

function toString(data: tBDocumentLanguage): string;
begin
  case data of
    DE: result:= 'de';
    EN: result:= 'en';
    FR: result:= 'fr';
    HR: result:= 'hr';
    HU: result:= 'hu';
    IT: result:= 'it';
    RO: result:= 'ro';
    SK: result:= 'sk';
    US: result:= 'us';
  end;
end;

end.
