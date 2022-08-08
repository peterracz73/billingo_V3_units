unit B_API_documents;

interface
uses  Classes, SysUtils, IdHTTP, IdSSLOpenSSL, BillingoUtils, BDocumentInsert,
    BDocument, BDocuments, BPartners, BPartner, BStringArray, BPartnerTaxType,
    BCountry, BDocumentPartner, JsonUtils;

const
  aURL = 'https://api.billingo.hu/v3';
type

tBPartnerAnswer = class
  private
    p_total: integer;
    p_per_page: integer;
    p_current_page: integer;
    p_last_page: integer;
    p_prev_page_url: string;
    p_next_page_url: string;
    p_data: tBPartners;
  public
    constructor Create();virtual;
    destructor Destroy();override;
    property total: integer read p_total write p_total;
    property per_page: integer read p_per_page write p_per_page;
    property current_page: integer read p_current_page write p_current_page;
    property last_page: integer read p_last_page write p_last_page;
    property prev_page_url: string read p_prev_page_url write p_prev_page_url;
    property next_page_url: string read p_next_page_url write p_next_page_url;
    property data: tBPartners read p_data write p_data;

    procedure loadFromJson(data: tStringStream);
end;


tGetPartnerQuery = class
  private
    p_page: integer;
    p_per_page: integer;
    p_query: string;
  public
    constructor Create();virtual;
    destructor Destroy();override;
    property page: integer read p_page write p_page;
    property per_page: integer read p_per_page write p_per_page;
    property query : string read p_query write p_query;

    function toString: string;
end;

tBDocumentAnswer = class
  private
    p_total: integer;
    p_per_page: integer;
    p_current_page: integer;
    p_last_page: integer;
    p_prev_page_url: string;
    p_next_page_url: string;
    p_data: tBDocuments;
  public
    constructor Create();virtual;
    destructor Destroy();override;
    property total : integer read p_total write p_total;
    property per_page: integer read p_per_page write p_per_page;
    property current_page : integer read p_current_page write p_current_page;
    property last_page : integer read p_last_page write p_last_page;
    property prev_page_url: string read p_prev_page_url write p_prev_page_url;
    property next_page_url: string read p_next_page_url write p_next_page_url;
    property data: tBDocuments read p_data write p_data;
    procedure addData(data: tBDocument);
end;

tGetDocumentsQuery = class
  private
    p_page: integer;
    p_per_page: integer; //(query) maximum: 100 minimum: 1
    p_block_id: integer;//
    p_partner_id: integer; // (query) Filter documents by the identifier of your Partner. partner_id
    p_payment_method: string; //(query) Filter documents by PaymentMethod value.
    p_payment_status: string ; //(query) Filter documents by PaymentStatus value.
    p_start_date: string;// ($date) (query) Filter documents by their invoice date.
    p_end_date: string;// ($date) (query) Filter documents by their invoice date.
    p_start_number: integer;//(query) Starting number of the document, should not contain year or any other formatting. Required if start_year given
    p_end_number: integer;//(query) Ending number of the document, should not contain year or any other formatting. Required if end_year given
    p_start_year: integer;//(query) Year for start_number parameter. Required if start_number given.
    p_end_year: integer;//(query) Year for end_number parameter. Required if end_number given.
    p_type: string;//(query) Filter documents by type
    p_query: string;//(query) Filter documents by the given text
    p_paid_start_date: string;// ($date)(query)Filter documents by their payment date.
    p_paid_end_date: string;//($date)(query) Filter documents by their payment date.
    p_fulfillment_start_date: string;//($date)(query) Filter documents by their fulfillment date.
    p_fulfillment_end_date: string;//($date)(query) Filter documents by their fulfillment date.
    p_last_modified_date: string;//($datetime)(query)

  public
    constructor Create();virtual;
    destructor Destroy();override;
    property page : integer read p_page write p_page;
    property per_page: integer read p_per_page write p_per_page; //(query) maximum: 100 minimum: 1
    property block_id: integer read p_block_id write p_block_id;//
    property partner_id: integer read p_partner_id write p_partner_id; // (query) Filter documents by the identifier of your Partner. partner_id
    property payment_method: string read p_payment_method write p_payment_method; //(query) Filter documents by PaymentMethod value.
    property payment_status: string read p_payment_status write p_payment_status; //(query) Filter documents by PaymentStatus value.
    property start_date: string read p_start_date write p_start_date;// ($date) (query) Filter documents by their invoice date.
    property end_date: string read p_end_date write p_end_date;// ($date) (query) Filter documents by their invoice date.
    property start_number: integer read p_start_number write p_start_number;//(query) Starting number of the document, should not contain year or any other formatting. Required if start_year given
    property end_number: integer read p_end_number write p_end_number;//(query) Ending number of the document, should not contain year or any other formatting. Required if end_year given
    property start_year: integer read p_start_year write p_start_year;//(query) Year for start_number parameter. Required if start_number given.
    property end_year: integer read p_end_year write p_end_year;//(query) Year for end_number parameter. Required if end_number given.
    property type_: string read p_type write p_type;//(query) Filter documents by type
    property query: string read p_query write p_query;//(query) Filter documents by the given text
    property paid_start_date: string read p_paid_start_date write p_paid_start_date;// ($date)(query)Filter documents by their payment date.
    property paid_end_date: string read p_paid_end_date write p_paid_end_date;//($date)(query) Filter documents by their payment date.
    property fulfillment_start_date : string read p_fulfillment_start_date write p_fulfillment_start_date;//($date)(query) Filter documents by their fulfillment date.
    property fulfillment_end_date : string read p_fulfillment_end_date write p_fulfillment_end_date;//($date)(query) Filter documents by their fulfillment date.
    property last_modified_date: string read p_last_modified_date write p_last_modified_date;//($datetime)(query)
    function toString: string;

end;

tBillingo = class
  protected
    p_api_key : string;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdHTTP1: TIdHTTP;
    function IdSSLIOHandlerSocketOpenSSL2VerifyPeer(Certificate: TIdX509; AOk: Boolean;
      ADepth, AError: Integer): Boolean;
  public
    constructor Create(api_key: string);virtual;
    destructor Destroy();override;
    property api_key: string read p_api_key write p_api_key; //(query) Filter documents by PaymentMethod value.

    function getDocuments(query: tGetDocumentsQuery): tBDocumentAnswer;//var response: TMemoryStream);
    function insertDocument(doc: tBDocumentInsert): tBDocument;
    //function deleteDocument(docId: integer): tBDocument;
    function cancelDocument(docId: integer; cancellation_reason, cancellation_recipients: string): tBDocument;
    function downloadPDF(docId: integer): tMemoryStream;
    function getDocumentId(invoice_number : string): integer;
    function checkPartner(userRealName, userZipcode, userCity, userAddress, dbusermail: string):integer;
    function createPartner(partnerData: tBDocumentPartner): tBPartner;
    procedure sendDocument(doc : tBDocument);
end;

implementation

constructor tBDocumentAnswer.Create();
begin
end;

destructor tBDocumentAnswer.Destroy();
var
  i0: integer;
begin
  for i0 := 0 to length(p_data) - 1 do
    p_data[i0].Destroy;
  setLength(p_data,0);
end;

procedure tBDocumentAnswer.addData(data: tBDocument);
begin
  setLength(p_data,length(p_data)+1);
  p_data[length(p_data)-1]:=data;
end;

procedure tBillingo.sendDocument(doc : tBDocument);
var
  mJson     : string;
  url       : string;
  ReqJson   : TStringStream;
  RespJson  : TStringStream;

begin
  mJson:=BStringArray.toString(doc.partner.emails,0,'');
  url:=aURL+'/documents/'+IntToStr(doc.id)+'/send';
  RespJson := TStringStream.Create;
  try
    ReqJson:= TStringStream.Create;
    ReqJson := TStringStream.Create(mJson, TEncoding.UTF8);
    try
      IdHTTP1.Post(url, ReqJson, RespJson);
    finally
      ReqJson.Free;
    end;
    RespJson.Position := 0;
    mJson:=RespJson.DataString;
  finally
    RespJson.Free;
  end;
end;



function tBillingo.downloadPDF(docId: integer): tMemoryStream;
var
  ReqJson : TStringStream;
  url     : string;
  i0      : integer;
  s0      : string;
begin
    url:= aURL+'/documents/'+IntToStr(docId)+'/download';
    for i0 := 0 to 4 do
    begin
      ReqJson := TStringStream.Create;
      IdHTTP1.Get(url, ReqJson);
      ReqJson.Position:=0;
      if ReqJson.Size>200 then
      begin
        result := tMemoryStream.Create;
        result.CopyFrom(ReqJson,ReqJson.Size);
        ReqJson.Destroy;
        exit;
      end
      else
      begin
        ReqJson.Destroy;
        sleep(1000);
      end;
    end;
end;

function tBillingo.getDocumentId(invoice_number : string): integer;
var
  query : tGetDocumentsQuery;
  answer: tBDocumentAnswer;
begin
  query := tGetDocumentsQuery.Create;
  query.query:=invoice_number;
  answer:= getDocuments(query);
  result:=-1;
  if length(answer.data)=1 then
    result:=answer.data[0].id;
end;

function tBillingo.checkPartner(userRealName, userZipcode, userCity, userAddress, dbusermail: string):integer;
var
  ReqJson : TStringStream;
  url     : string;
  query   : tGetPartnerQuery;
  answer  : tBPartnerAnswer;
  i0      : integer;
  partner : tBPartner;
  s0      : string;
  newPartner    : tBDocumentPartner;
  savedPartner  : tBPartner;
begin
    answer := tBPartnerAnswer.Create;
    query := tGetPartnerQuery.Create;
    query.query:=userRealName;

    userRealName:=TrimLeft(TrimRight(userRealName));
    userZipcode:=TrimLeft(TrimRight(userZipcode));
    userCity:=TrimLeft(TrimRight(userCity));
    userAddress:=TrimLeft(TrimRight(userAddress));
    dbusermail:=TrimLeft(TrimRight(dbusermail));

    url:= aURL+'/partners'+query.toString;
    ReqJson := TStringStream.Create;
    IdHTTP1.Get(url, ReqJson);
    ReqJson.Position:=0;
    answer.loadFromJson(ReqJson);
    i0:=length(answer.data);
    if i0>0 then
    begin
      for i0 := 0 to length(answer.data) - 1 do
      begin
        partner:=answer.data[i0];
        s0:= BStringArray.toList(partner.emails,',');
        if (partner.name=userRealName)
            and(partner.address.post_code=userZipcode)
            and(partner.address.city=userCity)
            and(partner.address.address=userAddress)
            and(s0=dbusermail)
          then
        begin
          result:=partner.id;
          answer.Free;
          exit;
        end;
      end;
    end;
    answer.Free;
    // Create a new partner with input datas
    newPartner := tBDocumentPartner.Create;
    newPartner.name:=userRealName;
    newPartner.account_number:='--';
    newPartner.tax_type:=BPartnerTaxType.NO_TAX_NUMBER;
    newPartner.emails:=BStringArray.toArrayFromStr(dbusermail);
    newPartner.address.country_code:=BCountry.HU;
    newPartner.address.post_code:=userZipcode;
    newPartner.address.city:=userCity;
    newPartner.address.address:=userAddress;
    savedPartner:=createPartner(newPartner);
    result:=savedPartner.id;
end;

function tBillingo.createPartner(partnerData: tBDocumentPartner): tBPartner;
var
  mJson     : string;
  url       : string;
  ReqJson   : TStringStream;
  RespJson  : TStringStream;
begin
  result:= tBPartner.Create;
  url:=aURL+'/partners';
  mJson:=partnerData.toString(0,'');
  RespJson := TStringStream.Create;
  try
    ReqJson:= TStringStream.Create;
    ReqJson := TStringStream.Create(mJson, TEncoding.UTF8);
    try
      IdHTTP1.Post(url, ReqJson, RespJson);
    finally
      ReqJson.Free;
    end;
    RespJson.Position := 0;
    result.loadFromJson(RespJson.DataString);
  finally
    RespJson.Free;
  end;
end;

constructor tBillingo.Create(api_key: string);
begin
  p_api_key:=api_key;
  IdSSLIOHandlerSocketOpenSSL1:=TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method := sslvTLSv1_2;
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.SSLVersions := [sslvTLSv1_2];
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyDepth := 1;
  IdSSLIOHandlerSocketOpenSSL1.OnVerifyPeer := IdSSLIOHandlerSocketOpenSSL2VerifyPeer;

  IdHTTP1:=TIdHTTP.Create(nil);
  IdHTTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
  IdHTTP1.HandleRedirects := True;
  IdHTTP1.RedirectMaximum := 30;
  IdHTTP1.Request.ContentType := 'application/json';
  IdHTTP1.Request.Accept := '*/*';
  IdHTTP1.Request.CharSet := 'utf-8';
  IdHTTP1.Request.AcceptCharSet := 'utf-8';
  IdHTTP1.Request.BasicAuthentication := False;
  IdHTTP1.Request.CustomHeaders.AddValue('X-API-KEY',p_api_key);
end;

destructor tBillingo.Destroy();
begin
  IdHTTP1.Destroy;
  IdSSLIOHandlerSocketOpenSSL1.Destroy;
end;

function tBillingo.IdSSLIOHandlerSocketOpenSSL2VerifyPeer(Certificate: TIdX509;
  AOk: Boolean; ADepth, AError: Integer): Boolean;
begin
  // Lehet a kapott tanusútványt ellenõrizni
  // Ha a tanusítvány jó, akkor a Result:= True
  Result:=True;
end;

function tBillingo.getDocuments(query: tGetDocumentsQuery): tBDocumentAnswer;//  var response: TMemoryStream);
var
  ReqJson : TStringStream;
  params  : string;
  url     : string;
begin
    params:=query.ToString;
    url:= aURL+'/documents'+params;
    ReqJson := TStringStream.Create;
    IdHTTP1.Get(url, ReqJson);
    result := tBDocumentAnswer.Create;
    result.total:=JsonUtils.getIntFromStream(ReqJson,'total');
    result.per_page:=JsonUtils.getIntFromStream(ReqJson,'per_page');
    result.current_page:=JsonUtils.getIntFromStream(ReqJson,'current_page');
    result.last_page:=JsonUtils.getIntFromStream(ReqJson,'last_page');
    result.prev_page_url:=JsonUtils.getStrFromStream(ReqJson,'prev_page_url');
    result.next_page_url:=JsonUtils.getStrFromStream(ReqJson,'next_page_url');
    result.data:=BDocuments.loadFromJsonStream(JsonUtils.getValueFromStream(ReqJson,'data'));
end;

function tBillingo.insertDocument(doc: tBDocumentInsert): tBDocument;
var
  mJson     : string;
  url       : string;
  ReqJson   : TStringStream;
  RespJson  : TStringStream;
begin
  result:= tBDocument.Create;
  url:=aURL+'/documents';
  mJson:=doc.getJson;
  RespJson := TStringStream.Create;
  try
    ReqJson:= TStringStream.Create;
    ReqJson := TStringStream.Create(mJson, TEncoding.UTF8);
    try
      IdHTTP1.Post(url, ReqJson, RespJson);
    finally
      ReqJson.Free;
    end;
    RespJson.Position := 0;
    result.loadFromJson(RespJson.DataString);
  finally
    RespJson.Free;
  end;
end;

// A delete funkcio csak egy szamla tervezetet tud torolni, a stornot a cancelDocument vegzi
{function tBillingo.deleteDocument(docId: integer): tBDocument;
var
  url       : string;
  s0        : string;
  RespJson  : TStringStream;
begin
  result:= tBDocument.Create;
  url:= aURL+'/documents'+'&id='+IntToStr(docId);
  RespJson := TStringStream.Create;
  try
    IdHTTP1.Delete(url, RespJson);
    RespJson.Position := 0;
    result.loadFromJson(RespJson.DataString);
  finally
    RespJson.Free;
  end;
end;}

function tBillingo.cancelDocument(docId: integer; cancellation_reason, cancellation_recipients: string): tBDocument;
var
  mJson     : string;
  url       : string;
  ReqJson   : TStringStream;
  RespJson  : TStringStream;
begin
  result:= tBDocument.Create;
  url:= aURL+'/documents/'+IntToStr(docId)+'/cancel';
  mJson:='{"cancellation_reason": "'+cancellation_reason+'", "cancellation_recipients": "'+cancellation_recipients+'"}';
  RespJson := TStringStream.Create;
  try
    ReqJson:= TStringStream.Create;
    ReqJson := TStringStream.Create(mJson, TEncoding.UTF8);
    try
      IdHTTP1.Post(url, ReqJson, RespJson);
    except

    end;
    ReqJson.Free;
    RespJson.Position := 0;
    result.loadFromJson(RespJson.DataString);
  finally
    RespJson.Free;
  end;
end;

constructor tGetDocumentsQuery.Create();
begin
    p_page:=1;// integer;
    p_per_page:=25;// integer; //(query) maximum: 100 minimum: 1
    p_block_id:=-1;// integer//
    p_partner_id:=-1;// integer; // (query) Filter documents by the identifier of your Partner. partner_id
    p_payment_method:='';// string; //(query) Filter documents by PaymentMethod value.
    p_payment_status:='';// string ; //(query) Filter documents by PaymentStatus value.
    p_start_date:='';// string;// ($date) (query) Filter documents by their invoice date.
    p_end_date:='';// string;// ($date) (query) Filter documents by their invoice date.
    p_start_number:=-1;// integer;//(query) Starting number of the document, should not contain year or any other formatting. Required if start_year given
    p_end_number:=-1;// integer;//(query) Ending number of the document, should not contain year or any other formatting. Required if end_year given
    p_start_year:=-1;// integer;//(query) Year for start_number parameter. Required if start_number given.
    p_end_year:=-1;// integer;//(query) Year for end_number parameter. Required if end_number given.
    p_type:='';// string;//(query) Filter documents by type
    p_query:='';// string;//(query) Filter documents by the given text
    p_paid_start_date:='';// string;// ($date)(query)Filter documents by their payment date.
    p_paid_end_date:='';// string;//($date)(query) Filter documents by their payment date.
    p_fulfillment_start_date:='';// string;//($date)(query) Filter documents by their fulfillment date.
    p_fulfillment_end_date:='';// string;//($date)(query) Filter documents by their fulfillment date.
    p_last_modified_date:='';// string;//($datetime)(query)
end;

destructor tGetDocumentsQuery.Destroy();
begin
end;

function tGetDocumentsQuery.toString: string;
begin
  result:='?page='+IntToStr(p_page);
  result:=result+'&per_page='+IntToStr(p_per_page);//:=25;// integer; //(query) maximum: 100 minimum: 1
  if p_block_id>-1 then
    result:=result+'&block_id='+IntToStr(p_block_id);//-1;// integer//
  if p_partner_id>-1 then
    result:=result+'&partner_id='+IntToStr(p_partner_id);//-1;// integer; // (query) Filter documents by the identifier of your Partner. partner_id
  if p_payment_method<>'' then
    result:=result+'&payment_method='+p_payment_method;// string; //(query) Filter documents by PaymentMethod value.
  if p_payment_status<>'' then
    result:=result+'&payment_status='+p_payment_status;// string ; //(query) Filter documents by PaymentStatus value.
  if p_start_date<>'' then
    result:=result+'&start_date='+p_start_date;// string;// ($date) (query) Filter documents by their invoice date.
  if p_end_date<>'' then
    result:=result+'&end_date='+p_end_date;// string;// ($date) (query) Filter documents by their invoice date.
  if p_start_number>-1 then
    result:=result+'&start_number='+IntToStr(p_start_number);//-1;// integer;//(query) Starting number of the document, should not contain year or any other formatting. Required if start_year given
  if p_end_number>-1 then
    result:=result+'&end_number='+IntToStr(p_end_number);//-1;// integer;//(query) Ending number of the document, should not contain year or any other formatting. Required if end_year given
  if p_start_year>-1 then
     result:=result+'&start_year='+IntToStr(p_start_year);//-1;// integer;//(query) Year for start_number parameter. Required if start_number given.
  if p_end_year>-1 then
     result:=result+'&end_year='+IntToStr(p_end_year);//-1;// integer;//(query) Year for end_number parameter. Required if end_number given.
  if p_type<>'' then
    result:=result+'&type='+p_type;// string;//(query) Filter documents by type
  if p_query<>'' then
    result:=result+'&query='+p_query;// string;//(query) Filter documents by the given text
  if p_paid_start_date<>'' then
    result:=result+'&paid_start_date='+p_paid_start_date;// string;// ($date)(query)Filter documents by their payment date.
  if p_paid_end_date<>'' then
    result:=result+'&paid_end_date='+p_paid_end_date;// string;//($date)(query) Filter documents by their payment date.
  if p_fulfillment_start_date<>'' then
    result:=result+'&fulfillment_start_date='+p_fulfillment_start_date;// string;//($date)(query) Filter documents by their fulfillment date.
  if p_fulfillment_end_date<>'' then
    result:=result+'&fulfillment_end_date='+p_fulfillment_end_date;// string;//($date)(query) Filter documents by their fulfillment date.
  if p_last_modified_date<>'' then
    result:=result+'&last_modified_date='+p_last_modified_date;// string;//($datetime)(query)
end;


constructor tGetPartnerQuery.Create();
begin
    p_page:=1;// integer;
    p_per_page:=25;// integer; //(query) maximum: 100 minimum: 1
    p_query:='';
end;

destructor tGetPartnerQuery.Destroy();
begin
end;

function tGetPartnerQuery.toString: string;
var
  str     : string;
begin
  str:='?page='+IntToStr(p_page);
  str:=str+'&per_page='+IntToStr(p_per_page);
  if p_query<>'' then
    str:=str+'&query='+p_query;
  result:=JsonUtils.toPathVariable(str);
end;

constructor tBPartnerAnswer.Create();
begin
end;

destructor tBPartnerAnswer.Destroy();
var
  i0  : integer;
begin
  for i0 := 0 to length(p_data) - 1 do
    p_data[i0].Free;
  setLength(p_data,0);
end;

procedure tBPartnerAnswer.loadFromJson(data: tStringStream);
begin
    p_total:=JsonUtils.getIntFromStream(data,'total');// integer;
    p_per_page:=JsonUtils.getIntFromStream(data,'per_page');// integer;
    p_current_page:=JsonUtils.getIntFromStream(data,'current_page');//: integer;
    p_last_page:=JsonUtils.getIntFromStream(data,'last_page');//: integer;
    p_prev_page_url:=JsonUtils.getStrFromStream(data,'prev_page_url');//: string;
    p_next_page_url:=JsonUtils.getStrFromStream(data,'next_page_url');//: string;
    p_data:= BPartners.loadFromJson(JsonUtils.getValueFromStream(data,'data'));
end;
end.
