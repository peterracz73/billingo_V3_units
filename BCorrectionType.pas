unit BCorrectionType;

interface
type
tBCorrectionType = (
        ADVANCE,// = 'advance';
        CANCELED,// = 'canceled';
        CANCELLATION,// = 'cancellation';
        CERT_OF_COMPLETION,// = 'cert_of_completion';
        D_CERT_OF_COMPLETION,// = 'd_cert_of_completion';
        DOSSIER,// = 'dossier';
        DRAFT,// = 'draft';
        DRAFT_OFFER,// = 'draft_offer';
        DRAFT_ORDER_FORM,// = 'draft_order_form';
        DRAFT_WAYBILL,// = 'draft_waybill';
        INVOICE,// = 'invoice';
        MODIFICATION,// = 'modification';
        MODIFIED,// = 'modified';
        OFFER,// = 'offer';
        ORDER_FORM,// = 'order_form';
        PROFORMA,// = 'proforma';
        RECEIPT,// = 'receipt';
        RECEIPT_CANCELLATION,// = 'receipt_cancellation';
        WAYBILL// = 'waybill';
        );

  function toString(data: tBCorrectionType): string;
  function toEnum(data: string): tBCorrectionType;
implementation
function toEnum(data: string): tBCorrectionType;
begin
  if data='advance' then result:= ADVANCE;
  if data='canceled' then result:= CANCELED;
  if data='cancellation' then result:= CANCELLATION;
  if data='cert_of_completion' then result:= CERT_OF_COMPLETION;
  if data='d_cert_of_completion' then result:= D_CERT_OF_COMPLETION;
  if data='dossier' then result:= DOSSIER;
  if data='draft' then result:= DRAFT;
  if data='draft_offer' then result:= DRAFT_OFFER;
  if data='draft_order_form' then result:= DRAFT_ORDER_FORM;
  if data='draft_waybill' then result:= DRAFT_WAYBILL;
  if data='invoice' then result:= INVOICE;
  if data='modification' then result:= MODIFICATION;
  if data='modified' then result:= MODIFIED;
  if data='offer' then result:= OFFER;
  if data='order_form' then result:= ORDER_FORM;
  if data='proforma' then result:= PROFORMA;
  if data='receipt' then result:= RECEIPT;
  if data='receipt_cancellation' then result:= RECEIPT_CANCELLATION;
  if data='waybill' then result:= WAYBILL;
end;

function toString(data: tBCorrectionType): string;
begin
  case data of
        ADVANCE: result:= 'advance';
        CANCELED: result:= 'canceled';
        CANCELLATION: result:= 'cancellation';
        CERT_OF_COMPLETION: result:= 'cert_of_completion';
        D_CERT_OF_COMPLETION: result:= 'd_cert_of_completion';
        DOSSIER: result:= 'dossier';
        DRAFT: result:= 'draft';
        DRAFT_OFFER: result:= 'draft_offer';
        DRAFT_ORDER_FORM: result:= 'draft_order_form';
        DRAFT_WAYBILL: result:= 'draft_waybill';
        INVOICE: result:= 'invoice';
        MODIFICATION: result:= 'modification';
        MODIFIED: result:= 'modified';
        OFFER: result:= 'offer';
        ORDER_FORM: result:= 'order_form';
        PROFORMA: result:= 'proforma';
        RECEIPT: result:= 'receipt';
        RECEIPT_CANCELLATION: result:= 'receipt_cancellation';
        WAYBILL: result:= 'waybill';  end;
end;
end.
