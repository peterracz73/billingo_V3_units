unit BVat;

interface
type
tBVat = (
          NONE,
          _0,// = '0%';
          _1,// = '1%';
          _10,// = '10%';
          _11,// = '11%';
          _12,// = '12%';
          _13,// = '13%';
          _14,// = '14%';
          _15,// = '15%';
          _16,// = '16%';
          _17,// = '17%';
          _18,// = '18%';
          _19,// = '19%';
          _2,// = '2%';
          _20,// = '20%';
          _21,// = '21%';
          _22,// = '22%';
          _23,// = '23%';
          _24,// = '24%';
          _25,// = '25%';
          _26,// = '26%';
          _27,// = '27%';
          _3,// = '3%';
          _4,// = '4%';
          _5,//= '5%';
          _55,// = '5,5%';
          _6,// = '6%';
          _7,// = '7%';
          _77,// = '7,7%';
          _8,// = '8%';
          _9,// = '9%';
          _95,// = '9,5%';
          AAM,// = 'AAM';
          AM,// = 'AM';
          EU,// = 'EU';
          EUK,// = 'EUK';
          FAFA,// = 'F.AFA';
          FAD,// = 'FAD';
          KAFA,// = 'K.AFA';
          MAA,// = 'MAA';
          TAM,// = 'TAM';
          KK,// = '?KK';
          THK// = '?THK';
        );

  function toString(data: tBVat): string;
  function toEnum(data: string): tBVat;
implementation

function toEnum(data: string): tBVat;
begin
    result:=NONE;
      if data='0%' then result:= _0;
      if data='1%' then result:= _1;
      if data='10%' then result:= _10;
      if data='11%' then result:= _11;
      if data='12%' then result:= _12;
      if data='13%' then result:= _13;
      if data='14%' then result:= _14;
      if data='15%' then result:= _15;
      if data='16%' then result:= _16;
      if data='17%' then result:= _17;
      if data='18%' then result:= _18;
      if data='19%' then result:= _19;
      if data='2%' then result:= _2;
      if data='20%' then result:= _20;
      if data='21%' then result:= _21;
      if data='22%' then result:= _22;
      if data='23%' then result:= _23;
      if data='24%' then result:= _24;
      if data='25%' then result:= _25;
      if data='26%' then result:= _26;
      if data='27%' then result:= _27;
      if data='3%' then result:= _3;
      if data='4%' then result:= _4;
      if data='5%' then result:= _5;
      if data='5,5%' then result:= _55;
      if data='6%' then result:= _6;
      if data='7%' then result:= _7;
      if data='7,7%' then result:= _77;
      if data='8%' then result:= _8;
      if data='9%' then result:= _9;
      if data='9,5%' then result:= _95;
      if data='AAM' then result:= AAM;
      if data='AM' then result:= AM;
      if data='EU' then result:= EU;
      if data='EUK' then result:= EUK;
      if data='F.AFA' then result:= FAFA;
      if data='FAD' then result:= FAD;
      if data='K.AFA' then result:= KAFA;
      if data='MAA' then result:= MAA;
      if data='TAM' then result:= TAM;
      if data='?KK' then result:= KK;
      if data='?THK' then result:= THK;
end;

function toString(data: tBVat): string;
begin
  result:= 'NONE';
  case data of
          _0: result:= '0%';
          _1: result:= '1%';
          _10: result:= '10%';
          _11: result:= '11%';
          _12: result:= '12%';
          _13: result:= '13%';
          _14: result:= '14%';
          _15: result:= '15%';
          _16: result:= '16%';
          _17: result:= '17%';
          _18: result:= '18%';
          _19: result:= '19%';
          _2: result:= '2%';
          _20: result:= '20%';
          _21: result:= '21%';
          _22: result:= '22%';
          _23: result:= '23%';
          _24: result:= '24%';
          _25: result:= '25%';
          _26: result:= '26%';
          _27: result:= '27%';
          _3: result:= '3%';
          _4: result:= '4%';
          _5: result:= '5%';
          _55: result:= '5,5%';
          _6: result:= '6%';
          _7: result:= '7%';
          _77: result:= '7,7%';
          _8: result:= '8%';
          _9: result:= '9%';
          _95: result:= '9,5%';
          AAM: result:= 'AAM';
          AM: result:= 'AM';
          EU: result:= 'EU';
          EUK: result:= 'EUK';
          FAFA: result:= 'F.AFA';
          FAD: result:= 'FAD';
          KAFA: result:= 'K.AFA';
          MAA: result:= 'MAA';
          TAM: result:= 'TAM';
          KK: result:= '?KK';
          THK: result:= '?THK';
  end;
end;
end.
