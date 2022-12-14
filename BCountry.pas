unit BCountry;

interface
type
tBCountry = (
              EMPTY,// = '';
              AC,// = 'AC';
              AD,// = 'AD';
              AE,// = 'AE';
              AF,// = 'AF';
              AG,// = 'AG';
              AI,// = 'AI';
              AL,// = 'AL';
              AM,// = 'AM';
              AO,// = 'AO';
              AQ,// = 'AQ';
              AR,// = 'AR';
              AS_,// = 'AS';
              AT,// = 'AT';
              AU,// = 'AU';
              AW,// = 'AW';
              AX,// = 'AX';
              AZ,// = 'AZ';
              BA,// = 'BA';
              BB,// = 'BB';
              BD,// = 'BD';
              BE,// = 'BE';
              BF,// = 'BF';
              BG,// = 'BG';
              BH,// = 'BH';
              BI,// = 'BI';
              BJ,// = 'BJ';
              BL,// = 'BL';
              BM,// = 'BM';
              BN,// = 'BN';
              BO,// = 'BO';
              BQ,// = 'BQ';
              BR,// = 'BR';
              BS,// = 'BS';
              BT,// = 'BT';
              BW,// = 'BW';
              BY,// = 'BY';
              BZ,// = 'BZ';
              CA,// = 'CA';
              CC,// = 'CC';
              CD,// = 'CD';
              CF,// = 'CF';
              CG,// = 'CG';
              CH,// = 'CH';
              CI,// = 'CI';
              CK,// = 'CK';
              CL,// = 'CL';
              CM,// = 'CM';
              CN,// = 'CN';
              CO,// = 'CO';
              CR,// = 'CR';
              CU,// = 'CU';
              CV,// = 'CV';
              CW,// = 'CW';
              CX,// = 'CX';
              CY,// = 'CY';
              CZ,// = 'CZ';
              DE,// = 'DE';
              DG,// = 'DG';
              DJ,// = 'DJ';
              DK,// = 'DK';
              DM,// = 'DM';
              DO_,// = 'DO';
              DZ,// = 'DZ';
              EA,// = 'EA';
              EC,// = 'EC';
              EE,// = 'EE';
              EG,// = 'EG';
              EH,// = 'EH';
              ER,// = 'ER';
              ES,// = 'ES';
              ET,// = 'ET';
              FI,// = 'FI';
              FJ,// = 'FJ';
              FK,// = 'FK';
              FM,// = 'FM';
              FO,// = 'FO';
              FR,// = 'FR';
              GA,// = 'GA';
              GB,// = 'GB';
              GD,// = 'GD';
              GE,// = 'GE';
              GF,// = 'GF';
              GG,// = 'GG';
              GH,// = 'GH';
              GI,// = 'GI';
              GL,// = 'GL';
              GM,// = 'GM';
              GN,// = 'GN';
              GP,// = 'GP';
              GQ,// = 'GQ';
              GR,// = 'GR';
              GS,// = 'GS';
              GT,// = 'GT';
              GU,// = 'GU';
              GW,// = 'GW';
              GY,// = 'GY';
              HK,// = 'HK';
              HN,// = 'HN';
              HR,// = 'HR';
              HT,// = 'HT';
              HU,// = 'HU';
              IC,// = 'IC';
              ID,// = 'ID';
              IE,// = 'IE';
              IL,// = 'IL';
              IM,// = 'IM';
              IN_,// = 'IN';
              IO,// = 'IO';
              IQ,// = 'IQ';
              IR,// = 'IR';
              IS_,// = 'IS';
              IT,// = 'IT';
              JE,// = 'JE';
              JM,// = 'JM';
              JO,// = 'JO';
              JP,// = 'JP';
              KE,// = 'KE';
              KG,// = 'KG';
              KH,// = 'KH';
              KI,// = 'KI';
              KM,// = 'KM';
              KN,// = 'KN';
              KP,// = 'KP';
              KR,// = 'KR';
              KW,// = 'KW';
              KY,// = 'KY';
              KZ,// = 'KZ';
              LA,// = 'LA';
              LB,// = 'LB';
              LC,// = 'LC';
              LI,// = 'LI';
              LK,// = 'LK';
              LR,// = 'LR';
              LS,// = 'LS';
              LT,// = 'LT';
              LU,// = 'LU';
              LV,// = 'LV';
              LY,// = 'LY';
              MA,// = 'MA';
              MC,// = 'MC';
              MD,// = 'MD';
              ME,// = 'ME';
              MF,// = 'MF';
              MG,// = 'MG';
              MH,// = 'MH';
              MK,// = 'MK';
              ML,// = 'ML';
              MM,// = 'MM';
              MN,// = 'MN';
              MO,// = 'MO';
              MP,// = 'MP';
              MQ,// = 'MQ';
              MR,// = 'MR';
              MS,// = 'MS';
              MT,// = 'MT';
              MU,// = 'MU';
              MV,// = 'MV';
              MW,// = 'MW';
              MX,// = 'MX';
              MY,// = 'MY';
              MZ,// = 'MZ';
              NA,// = 'NA';
              NC,// = 'NC';
              NE,// = 'NE';
              NF,// = 'NF';
              NG,// = 'NG';
              NI,// = 'NI';
              NL,// = 'NL';
              NO,// = 'NO';
              NP,// = 'NP';
              NR,// = 'NR';
              NU,// = 'NU';
              NZ,// = 'NZ';
              OM,// = 'OM';
              PA,// = 'PA';
              PE,// = 'PE';
              PF,// = 'PF';
              PG,// = 'PG';
              PH,// = 'PH';
              PK,// = 'PK';
              PL,// = 'PL';
              PM,// = 'PM';
              PN,// = 'PN';
              PR,// = 'PR';
              PS,// = 'PS';
              PT,// = 'PT';
              PW,// = 'PW';
              PY,// = 'PY';
              QA,// = 'QA';
              RE,// = 'RE';
              RO,// = 'RO';
              RS,// = 'RS';
              RU,// = 'RU';
              RW,// = 'RW';
              SA,// = 'SA';
              SB,// = 'SB';
              SC,// = 'SC';
              SD,// = 'SD';
              SE,// = 'SE';
              SG,// = 'SG';
              SH,// = 'SH';
              SI,// = 'SI';
              SJ,// = 'SJ';
              SK,// = 'SK';
              SL,// = 'SL';
              SM,// = 'SM';
              SN,// = 'SN';
              SO,// = 'SO';
              SR,// = 'SR';
              SS,// = 'SS';
              ST,// = 'ST';
              SV,// = 'SV';
              SX,// = 'SX';
              SY,// = 'SY';
              SZ,// = 'SZ';
              TA,// = 'TA';
              TC,// = 'TC';
              TD,// = 'TD';
              TF,// = 'TF';
              TG,// = 'TG';
              TH,// = 'TH';
              TJ,// = 'TJ';
              TK,// = 'TK';
              TL,// = 'TL';
              TM,// = 'TM';
              TN,// = 'TN';
              TO_,// = 'TO';
              TR,// = 'TR';
              TT,// = 'TT';
              TV,// = 'TV';
              TW,// = 'TW';
              TZ,// = 'TZ';
              UA,// = 'UA';
              UG,// = 'UG';
              UM,// = 'UM';
              US,// = 'US';
              UY,// = 'UY';
              UZ,// = 'UZ';
              VA,// = 'VA';
              VC,// = 'VC';
              VE,// = 'VE';
              VG,// = 'VG';
              VI,// = 'VI';
              VN,// = 'VN';
              VU,// = 'VU';
              WF,// = 'WF';
              WS,// = 'WS';
              XA,// = 'XA';
              XB,// = 'XB';
              XK,// = 'XK';
              YE,// = 'YE';
              YT,// = 'YT';
              ZA,// = 'ZA';
              ZM,// = 'ZM';
              ZW// = 'ZW';
            );

  function toString(data: tBCountry): string;
  function toEnum(data: string): tBCountry;
implementation

function toEnum(data: string): tBCountry;
begin
          if data='' then result:= EMPTY;
          if data='AC' then result:= AC;
          if data='AD' then result:= AD;
          if data='AE' then result:= AE;
          if data='AF' then result:= AF;
          if data='AG' then result:= AG;
          if data='AI' then result:= AI;
          if data='AL' then result:= AL;
          if data='AM' then result:= AM;
          if data='AO' then result:= AO;
          if data='AQ' then result:= AQ;
          if data='AR' then result:= AR;
          if data='AS' then result:= AS_;
          if data='AT' then result:= AT;
          if data='AU' then result:= AU;
          if data='AW' then result:= AW;
          if data='AX' then result:= AX;
          if data='AZ' then result:= AZ;
          if data='BA' then result:= BA;
          if data='BB' then result:= BB;
          if data='BD' then result:= BD;
          if data='BE' then result:= BE;
          if data='BF' then result:= BF;
          if data='BG' then result:= BG;
          if data='BH' then result:= BH;
          if data='BI' then result:= BI;
          if data='BJ' then result:= BJ;
          if data='BL' then result:= BL;
          if data='BM' then result:= BM;
          if data='BN' then result:= BN;
          if data='BO' then result:= BO;
          if data='BQ' then result:= BQ;
          if data='BR' then result:= BR;
          if data='BS' then result:= BS;
          if data='BT' then result:= BT;
          if data='BW' then result:= BW;
          if data='BY' then result:= BY;
          if data='BZ' then result:= BZ;
          if data='CA' then result:= CA;
          if data='CC' then result:= CC;
          if data='CD' then result:= CD;
          if data='CF' then result:= CF;
          if data='CG' then result:= CG;
          if data='CH' then result:= CH;
          if data='CI' then result:= CI;
          if data='CK' then result:= CK;
          if data='CL' then result:= CL;
          if data='CM' then result:= CM;
          if data='CN' then result:= CN;
          if data='CO' then result:= CO;
          if data='CR' then result:= CR;
          if data='CU' then result:= CU;
          if data='CV' then result:= CV;
          if data='CW' then result:= CW;
          if data='CX' then result:= CX;
          if data='CY' then result:= CY;
          if data='CZ' then result:= CZ;
          if data='DE' then result:= DE;
          if data='DG' then result:= DG;
          if data='DJ' then result:= DJ;
          if data='DK' then result:= DK;
          if data='DM' then result:= DM;
          if data='DO' then result:= DO_;
          if data='DZ' then result:= DZ;
          if data='EA' then result:= EA;
          if data='EC' then result:= EC;
          if data='EE' then result:= EE;
          if data='EG' then result:= EG;
          if data='EH' then result:= EH;
          if data='ER' then result:= ER;
          if data='ES' then result:= ES;
          if data='ET' then result:= ET;
          if data='FI' then result:= FI;
          if data='FJ' then result:= FJ;
          if data='FK' then result:= FK;
          if data='FM' then result:= FM;
          if data='FO' then result:= FO;
          if data='FR' then result:= FR;
          if data='GA' then result:= GA;
          if data='GB' then result:= GB;
          if data='GD' then result:= GD;
          if data='GE' then result:= GE;
          if data='GF' then result:= GF;
          if data='GG' then result:= GG;
          if data='GH' then result:= GH;
          if data='GI' then result:= GI;
          if data='GL' then result:= GL;
          if data='GM' then result:= GM;
          if data='GN' then result:= GN;
          if data='GP' then result:= GP;
          if data='GQ' then result:= GQ;
          if data='GR' then result:= GR;
          if data='GS' then result:= GS;
          if data='GT' then result:= GT;
          if data='GU' then result:= GU;
          if data='GW' then result:= GW;
          if data='GY' then result:= GY;
          if data='HK' then result:= HK;
          if data='HN' then result:= HN;
          if data='HR' then result:= HR;
          if data='HT' then result:= HT;
          if data='HU' then result:= HU;
          if data='IC' then result:= IC;
          if data='ID' then result:= ID;
          if data='IE' then result:= IE;
          if data='IL' then result:= IL;
          if data='IM' then result:= IM;
          if data='IN' then result:= IN_;
          if data='IO' then result:= IO;
          if data='IQ' then result:= IQ;
          if data='IR' then result:= IR;
          if data='IS' then result:= IS_;
          if data='IT' then result:= IT;
          if data='JE' then result:= JE;
          if data='JM' then result:= JM;
          if data='JO' then result:= JO;
          if data='JP' then result:= JP;
          if data='KE' then result:= KE;
          if data='KG' then result:= KG;
          if data='KH' then result:= KH;
          if data='KI' then result:= KI;
          if data='KM' then result:= KM;
          if data='KN' then result:= KN;
          if data='KP' then result:= KP;
          if data='KR' then result:= KR;
          if data='KW' then result:= KW;
          if data='KY' then result:= KY;
          if data='KZ' then result:= KZ;
          if data='LA' then result:= LA;
          if data='LB' then result:= LB;
          if data='LC' then result:= LC;
          if data='LI' then result:= LI;
          if data='LK' then result:= LK;
          if data='LR' then result:= LR;
          if data='LS' then result:= LS;
          if data='LT' then result:= LT;
          if data='LU' then result:= LU;
          if data='LV' then result:= LV;
          if data='LY' then result:= LY;
          if data='MA' then result:= MA;
          if data='MC' then result:= MC;
          if data='MD' then result:= MD;
          if data='ME' then result:= ME;
          if data='MF' then result:= MF;
          if data='MG' then result:= MG;
          if data='MH' then result:= MH;
          if data='MK' then result:= MK;
          if data='ML' then result:= ML;
          if data='MM' then result:= MM;
          if data='MN' then result:= MN;
          if data='MO' then result:= MO;
          if data='MP' then result:= MP;
          if data='MQ' then result:= MQ;
          if data='MR' then result:= MR;
          if data='MS' then result:= MS;
          if data='MT' then result:= MT;
          if data='MU' then result:= MU;
          if data='MV' then result:= MV;
          if data='MW' then result:= MW;
          if data='MX' then result:= MX;
          if data='MY' then result:= MY;
          if data='MZ' then result:= MZ;
          if data='NA' then result:= NA;
          if data='NC' then result:= NC;
          if data='NE' then result:= NE;
          if data='NF' then result:= NF;
          if data='NG' then result:= NG;
          if data='NI' then result:= NI;
          if data='NL' then result:= NL;
          if data='NO' then result:= NO;
          if data='NP' then result:= NP;
          if data='NR' then result:= NR;
          if data='NU' then result:= NU;
          if data='NZ' then result:= NZ;
          if data='OM' then result:= OM;
          if data='PA' then result:= PA;
          if data='PE' then result:= PE;
          if data='PF' then result:= PF;
          if data='PG' then result:= PG;
          if data='PH' then result:= PH;
          if data='PK' then result:= PK;
          if data='PL' then result:= PL;
          if data='PM' then result:= PM;
          if data='PN' then result:= PN;
          if data='PR' then result:= PR;
          if data='PS' then result:= PS;
          if data='PT' then result:= PT;
          if data='PW' then result:= PW;
          if data='PY' then result:= PY;
          if data='QA' then result:= QA;
          if data='RE' then result:= RE;
          if data='RO' then result:= RO;
          if data='RS' then result:= RS;
          if data='RU' then result:= RU;
          if data='RW' then result:= RW;
          if data='SA' then result:= SA;
          if data='SB' then result:= SB;
          if data='SC' then result:= SC;
          if data='SD' then result:= SD;
          if data='SE' then result:= SE;
          if data='SG' then result:= SG;
          if data='SH' then result:= SH;
          if data='SI' then result:= SI;
          if data='SJ' then result:= SJ;
          if data='SK' then result:= SK;
          if data='SL' then result:= SL;
          if data='SM' then result:= SM;
          if data='SN' then result:= SN;
          if data='SO' then result:= SO;
          if data='SR' then result:= SR;
          if data='SS' then result:= SS;
          if data='ST' then result:= ST;
          if data='SV' then result:= SV;
          if data='SX' then result:= SX;
          if data='SY' then result:= SY;
          if data='SZ' then result:= SZ;
          if data='TA' then result:= TA;
          if data='TC' then result:= TC;
          if data='TD' then result:= TD;
          if data='TF' then result:= TF;
          if data='TG' then result:= TG;
          if data='TH' then result:= TH;
          if data='TJ' then result:= TJ;
          if data='TK' then result:= TK;
          if data='TL' then result:= TL;
          if data='TM' then result:= TM;
          if data='TN' then result:= TN;
          if data='TO' then result:= TO_;
          if data='TR' then result:= TR;
          if data='TT' then result:= TT;
          if data='TV' then result:= TV;
          if data='TW' then result:= TW;
          if data='TZ' then result:= TZ;
          if data='UA' then result:= UA;
          if data='UG' then result:= UG;
          if data='UM' then result:= UM;
          if data='US' then result:= US;
          if data='UY' then result:= UY;
          if data='UZ' then result:= UZ;
          if data='VA' then result:= VA;
          if data='VC' then result:= VC;
          if data='VE' then result:= VE;
          if data='VG' then result:= VG;
          if data='VI' then result:= VI;
          if data='VN' then result:= VN;
          if data='VU' then result:= VU;
          if data='WF' then result:= WF;
          if data='WS' then result:= WS;
          if data='XA' then result:= XA;
          if data='XB' then result:= XB;
          if data='XK' then result:= XK;
          if data='YE' then result:= YE;
          if data='YT' then result:= YT;
          if data='ZA' then result:= ZA;
          if data='ZM' then result:= ZM;
          if data='ZW' then result:= ZW;
end;

function toString(data: tBCountry): string;
begin
  case data of
          EMPTY: result:= '';
          AC: result:= 'AC';
          AD: result:= 'AD';
          AE: result:= 'AE';
          AF: result:= 'AF';
          AG: result:= 'AG';
          AI: result:= 'AI';
          AL: result:= 'AL';
          AM: result:= 'AM';
          AO: result:= 'AO';
          AQ: result:= 'AQ';
          AR: result:= 'AR';
          AS_: result:= 'AS';
          AT: result:= 'AT';
          AU: result:= 'AU';
          AW: result:= 'AW';
          AX: result:= 'AX';
          AZ: result:= 'AZ';
          BA: result:= 'BA';
          BB: result:= 'BB';
          BD: result:= 'BD';
          BE: result:= 'BE';
          BF: result:= 'BF';
          BG: result:= 'BG';
          BH: result:= 'BH';
          BI: result:= 'BI';
          BJ: result:= 'BJ';
          BL: result:= 'BL';
          BM: result:= 'BM';
          BN: result:= 'BN';
          BO: result:= 'BO';
          BQ: result:= 'BQ';
          BR: result:= 'BR';
          BS: result:= 'BS';
          BT: result:= 'BT';
          BW: result:= 'BW';
          BY: result:= 'BY';
          BZ: result:= 'BZ';
          CA: result:= 'CA';
          CC: result:= 'CC';
          CD: result:= 'CD';
          CF: result:= 'CF';
          CG: result:= 'CG';
          CH: result:= 'CH';
          CI: result:= 'CI';
          CK: result:= 'CK';
          CL: result:= 'CL';
          CM: result:= 'CM';
          CN: result:= 'CN';
          CO: result:= 'CO';
          CR: result:= 'CR';
          CU: result:= 'CU';
          CV: result:= 'CV';
          CW: result:= 'CW';
          CX: result:= 'CX';
          CY: result:= 'CY';
          CZ: result:= 'CZ';
          DE: result:= 'DE';
          DG: result:= 'DG';
          DJ: result:= 'DJ';
          DK: result:= 'DK';
          DM: result:= 'DM';
          DO_: result:= 'DO';
          DZ: result:= 'DZ';
          EA: result:= 'EA';
          EC: result:= 'EC';
          EE: result:= 'EE';
          EG: result:= 'EG';
          EH: result:= 'EH';
          ER: result:= 'ER';
          ES: result:= 'ES';
          ET: result:= 'ET';
          FI: result:= 'FI';
          FJ: result:= 'FJ';
          FK: result:= 'FK';
          FM: result:= 'FM';
          FO: result:= 'FO';
          FR: result:= 'FR';
          GA: result:= 'GA';
          GB: result:= 'GB';
          GD: result:= 'GD';
          GE: result:= 'GE';
          GF: result:= 'GF';
          GG: result:= 'GG';
          GH: result:= 'GH';
          GI: result:= 'GI';
          GL: result:= 'GL';
          GM: result:= 'GM';
          GN: result:= 'GN';
          GP: result:= 'GP';
          GQ: result:= 'GQ';
          GR: result:= 'GR';
          GS: result:= 'GS';
          GT: result:= 'GT';
          GU: result:= 'GU';
          GW: result:= 'GW';
          GY: result:= 'GY';
          HK: result:= 'HK';
          HN: result:= 'HN';
          HR: result:= 'HR';
          HT: result:= 'HT';
          HU: result:= 'HU';
          IC: result:= 'IC';
          ID: result:= 'ID';
          IE: result:= 'IE';
          IL: result:= 'IL';
          IM: result:= 'IM';
          IN_: result:= 'IN';
          IO: result:= 'IO';
          IQ: result:= 'IQ';
          IR: result:= 'IR';
          IS_: result:= 'IS';
          IT: result:= 'IT';
          JE: result:= 'JE';
          JM: result:= 'JM';
          JO: result:= 'JO';
          JP: result:= 'JP';
          KE: result:= 'KE';
          KG: result:= 'KG';
          KH: result:= 'KH';
          KI: result:= 'KI';
          KM: result:= 'KM';
          KN: result:= 'KN';
          KP: result:= 'KP';
          KR: result:= 'KR';
          KW: result:= 'KW';
          KY: result:= 'KY';
          KZ: result:= 'KZ';
          LA: result:= 'LA';
          LB: result:= 'LB';
          LC: result:= 'LC';
          LI: result:= 'LI';
          LK: result:= 'LK';
          LR: result:= 'LR';
          LS: result:= 'LS';
          LT: result:= 'LT';
          LU: result:= 'LU';
          LV: result:= 'LV';
          LY: result:= 'LY';
          MA: result:= 'MA';
          MC: result:= 'MC';
          MD: result:= 'MD';
          ME: result:= 'ME';
          MF: result:= 'MF';
          MG: result:= 'MG';
          MH: result:= 'MH';
          MK: result:= 'MK';
          ML: result:= 'ML';
          MM: result:= 'MM';
          MN: result:= 'MN';
          MO: result:= 'MO';
          MP: result:= 'MP';
          MQ: result:= 'MQ';
          MR: result:= 'MR';
          MS: result:= 'MS';
          MT: result:= 'MT';
          MU: result:= 'MU';
          MV: result:= 'MV';
          MW: result:= 'MW';
          MX: result:= 'MX';
          MY: result:= 'MY';
          MZ: result:= 'MZ';
          NA: result:= 'NA';
          NC: result:= 'NC';
          NE: result:= 'NE';
          NF: result:= 'NF';
          NG: result:= 'NG';
          NI: result:= 'NI';
          NL: result:= 'NL';
          NO: result:= 'NO';
          NP: result:= 'NP';
          NR: result:= 'NR';
          NU: result:= 'NU';
          NZ: result:= 'NZ';
          OM: result:= 'OM';
          PA: result:= 'PA';
          PE: result:= 'PE';
          PF: result:= 'PF';
          PG: result:= 'PG';
          PH: result:= 'PH';
          PK: result:= 'PK';
          PL: result:= 'PL';
          PM: result:= 'PM';
          PN: result:= 'PN';
          PR: result:= 'PR';
          PS: result:= 'PS';
          PT: result:= 'PT';
          PW: result:= 'PW';
          PY: result:= 'PY';
          QA: result:= 'QA';
          RE: result:= 'RE';
          RO: result:= 'RO';
          RS: result:= 'RS';
          RU: result:= 'RU';
          RW: result:= 'RW';
          SA: result:= 'SA';
          SB: result:= 'SB';
          SC: result:= 'SC';
          SD: result:= 'SD';
          SE: result:= 'SE';
          SG: result:= 'SG';
          SH: result:= 'SH';
          SI: result:= 'SI';
          SJ: result:= 'SJ';
          SK: result:= 'SK';
          SL: result:= 'SL';
          SM: result:= 'SM';
          SN: result:= 'SN';
          SO: result:= 'SO';
          SR: result:= 'SR';
          SS: result:= 'SS';
          ST: result:= 'ST';
          SV: result:= 'SV';
          SX: result:= 'SX';
          SY: result:= 'SY';
          SZ: result:= 'SZ';
          TA: result:= 'TA';
          TC: result:= 'TC';
          TD: result:= 'TD';
          TF: result:= 'TF';
          TG: result:= 'TG';
          TH: result:= 'TH';
          TJ: result:= 'TJ';
          TK: result:= 'TK';
          TL: result:= 'TL';
          TM: result:= 'TM';
          TN: result:= 'TN';
          TO_: result:= 'TO';
          TR: result:= 'TR';
          TT: result:= 'TT';
          TV: result:= 'TV';
          TW: result:= 'TW';
          TZ: result:= 'TZ';
          UA: result:= 'UA';
          UG: result:= 'UG';
          UM: result:= 'UM';
          US: result:= 'US';
          UY: result:= 'UY';
          UZ: result:= 'UZ';
          VA: result:= 'VA';
          VC: result:= 'VC';
          VE: result:= 'VE';
          VG: result:= 'VG';
          VI: result:= 'VI';
          VN: result:= 'VN';
          VU: result:= 'VU';
          WF: result:= 'WF';
          WS: result:= 'WS';
          XA: result:= 'XA';
          XB: result:= 'XB';
          XK: result:= 'XK';
          YE: result:= 'YE';
          YT: result:= 'YT';
          ZA: result:= 'ZA';
          ZM: result:= 'ZM';
          ZW: result:= 'ZW';
  end;
end;
end.
