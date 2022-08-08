unit BEntitlement;

interface
type
tBEntitlement = (
                  NONE,
                  AAM,// = 'AAM';
                  ANTIQUES,// = 'ANTIQUES';
                  ARTWORK,// = 'ARTWORK';
                  ATK,// = 'ATK';
                  EAM,// = 'EAM';
                  EUE,// = 'EUE';
                  EUFAD37,// = 'EUFAD37';
                  EUFADE,// = 'EUFADE';
                  HO,// = 'HO';
                  KBAET,// = 'KBAET';
                  NAM_1,// = 'NAM_1';
                  NAM_2,// = 'NAM_2';
                  SECOND_HAND,// = 'SECOND_HAND';
                  TAM,// = 'TAM';
                  TRAVEL_AGENCY// = 'TRAVEL_AGENCY';
                );

  function toString(data : tBEntitlement) : string;
  function toEnum(data: string): tBEntitlement;
implementation

function toEnum(data: string): tBEntitlement;
begin
    result:=NONE;
    if data='AAM' then result:= AAM;
    if data='ANTIQUES' then result:= ANTIQUES;
    if data='ARTWORK' then result:= ARTWORK;
    if data='ATK' then result:= ATK;
    if data='EAM' then result:= EAM;
    if data='EUE' then result:= EUE;
    if data='EUFAD37' then result:= EUFAD37;
    if data='EUFADE' then result:= EUFADE;
    if data='HO' then result:= HO;
    if data='KBAET' then result:= KBAET;
    if data='NAM_1' then result:= NAM_1;
    if data='NAM_2' then result:= NAM_2;
    if data='SECOND_HAND' then result:= SECOND_HAND;
    if data='TAM' then result:= TAM;
    if data='TRAVEL_AGENCY' then result:= TRAVEL_AGENCY;
end;

function toString(data : tBEntitlement) : string;
begin
  case data of
        NONE: result:='';
        AAM: result:= 'AAM';
        ANTIQUES: result:= 'ANTIQUES';
        ARTWORK: result:= 'ARTWORK';
        ATK: result:= 'ATK';
        EAM: result:= 'EAM';
        EUE: result:= 'EUE';
        EUFAD37: result:= 'EUFAD37';
        EUFADE: result:= 'EUFADE';
        HO: result:= 'HO';
        KBAET: result:= 'KBAET';
        NAM_1: result:= 'NAM_1';
        NAM_2: result:= 'NAM_2';
        SECOND_HAND: result:= 'SECOND_HAND';
        TAM: result:= 'TAM';
        TRAVEL_AGENCY: result:= 'TRAVEL_AGENCY';
  end;
end;
end.
