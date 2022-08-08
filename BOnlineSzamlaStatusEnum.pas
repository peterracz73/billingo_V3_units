unit BOnlineSzamlaStatusEnum;

interface
type
tBOnlineSzamlaStatusEnum = (
          ABORTED,// = 'aborted';
          DONE,// = 'done';
          EMPTY_ORGANIZATION_COUNTRY_CODE,// = 'empty_organization_country_code';
          EMPTY_PARTNER_COUNTRY_CODE,// = 'empty_partner_country_code';
          EMPTY_TAX,// = 'empty_tax';
          FORBIDDEN,// = 'forbidden';
          INVALID_ADDRESS,// = 'invalid_address';
          INVALID_CLIENT,// = 'invalid_client';
          INVALID_CONVERSION_RATE,// = 'invalid_conversion_rate';
          INVALID_CUSTOMER,// = 'invalid_customer';
          INVALID_INVOICE_REFERENCE,// = 'invalid_invoice_reference';
          INVALID_POSTALCODE,// = 'invalid_postalcode';
          INVALID_SECURITY_USER,// = 'invalid_security_user';
          INVALID_TAX,// = 'invalid_tax';
          INVALID_TAX_NUMBER,// = 'invalid_tax_number';
          INVALID_USER_RELATION,// = 'invalid_user_relation';
          INVALID_VAT_DATA,// = 'invalid_vat_data';
          INVOICE_NUMBER_NOT_UNIQUE,// = 'invoice_number_not_unique';
          KOBAK_PROCESSING,// = 'kobak_processing';
          MISSING_DOCUMENT_ITEM_NAME,// = 'missing_document_item_name';
          NAV_WARN,// = 'nav_warn';
          NO_ONLINE_SZAMLA_SETTINGS,// = 'no_online_szamla_settings';
          NO_SEND_BY_USER,// = 'no_send_by_user';
          NON_EXIST_TAX_NUMBER,// = 'non_exist_tax_number';
          NOT_UNIQUE,// = 'not unique';
          NOT_CHECKED,// = 'not_checked';
          NOT_REGISTERED_CUSTOMER,// = 'not_registered_customer';
          PROCESSING,// = 'processing';
          RECEIVED,// = 'received';
          SAVED,// = 'saved';
          SEND_FAILED,// = 'send_failed';
          SENT,// = 'sent';
          STARTED,// = 'started';
          TECHNICAL_ERROR,// = 'technical_error';
          UNDER_TAX_LIMIT,// = 'under_tax_limit';
          USER_HAS_INVALID_KOBAK,// = 'user_has_invalid_kobak';
          USER_HASNOT_KOBAK,// = 'user_hasnot_kobak';
          VALIDATION_OK// = 'validation_ok';
      );
  function toString(data: tBOnlineSzamlaStatusEnum):string;
  function toEnum(data: string): tBOnlineSzamlaStatusEnum;
implementation

function toEnum(data: string): tBOnlineSzamlaStatusEnum;
begin
       if data='aborted' then result:= ABORTED;
       if data='done' then result:= DONE;
       if data='empty_organization_country_code' then result:= EMPTY_ORGANIZATION_COUNTRY_CODE;
       if data='empty_partner_country_code' then result:= EMPTY_PARTNER_COUNTRY_CODE;
       if data='empty_tax' then result:= EMPTY_TAX;
       if data='forbidden' then result:= FORBIDDEN;
       if data='invalid_address' then result:= INVALID_ADDRESS;
       if data='invalid_client' then result:= INVALID_CLIENT;
       if data='invalid_conversion_rate' then result:= INVALID_CONVERSION_RATE;
       if data='invalid_customer' then result:= INVALID_CUSTOMER;
       if data='invalid_invoice_reference' then result:= INVALID_INVOICE_REFERENCE;
       if data='invalid_postalcode' then result:= INVALID_POSTALCODE;
       if data='invalid_security_user' then result:= INVALID_SECURITY_USER;
       if data='invalid_tax' then result:= INVALID_TAX;
       if data='invalid_tax_number' then result:= INVALID_TAX_NUMBER;
       if data='invalid_user_relation' then result:= INVALID_USER_RELATION;
       if data='invalid_vat_data' then result:= INVALID_VAT_DATA;
       if data='invoice_number_not_unique' then result:= INVOICE_NUMBER_NOT_UNIQUE;
       if data='kobak_processing' then result:= KOBAK_PROCESSING;
       if data='missing_document_item_name' then result:= MISSING_DOCUMENT_ITEM_NAME;
       if data='nav_warn' then result:= NAV_WARN;
       if data='no_online_szamla_settings' then result:= NO_ONLINE_SZAMLA_SETTINGS;
       if data='no_send_by_user' then result:= NO_SEND_BY_USER;
       if data='non_exist_tax_number' then result:= NON_EXIST_TAX_NUMBER;
       if data='not unique' then result:= NOT_UNIQUE;
       if data='not_checked' then result:= NOT_CHECKED;
       if data='not_registered_customer' then result:= NOT_REGISTERED_CUSTOMER;
       if data='processing' then result:= PROCESSING;
       if data='received' then result:= RECEIVED;
       if data='saved' then result:= SAVED;
       if data='send_failed' then result:= SEND_FAILED;
       if data='sent' then result:= SENT;
       if data='started' then result:= STARTED;
       if data='technical_error' then result:= TECHNICAL_ERROR;
       if data='under_tax_limit' then result:= UNDER_TAX_LIMIT;
       if data='user_has_invalid_kobak' then result:= USER_HAS_INVALID_KOBAK;
       if data='user_hasnot_kobak' then result:= USER_HASNOT_KOBAK;
       if data='validation_ok' then result:= VALIDATION_OK;
end;

function toString(data: tBOnlineSzamlaStatusEnum):string;
begin
  case data of
          ABORTED: result:= 'aborted';
          DONE: result:= 'done';
          EMPTY_ORGANIZATION_COUNTRY_CODE: result:= 'empty_organization_country_code';
          EMPTY_PARTNER_COUNTRY_CODE: result:= 'empty_partner_country_code';
          EMPTY_TAX: result:= 'empty_tax';
          FORBIDDEN: result:= 'forbidden';
          INVALID_ADDRESS: result:= 'invalid_address';
          INVALID_CLIENT: result:= 'invalid_client';
          INVALID_CONVERSION_RATE: result:= 'invalid_conversion_rate';
          INVALID_CUSTOMER: result:= 'invalid_customer';
          INVALID_INVOICE_REFERENCE: result:= 'invalid_invoice_reference';
          INVALID_POSTALCODE: result:= 'invalid_postalcode';
          INVALID_SECURITY_USER: result:= 'invalid_security_user';
          INVALID_TAX: result:= 'invalid_tax';
          INVALID_TAX_NUMBER: result:= 'invalid_tax_number';
          INVALID_USER_RELATION: result:= 'invalid_user_relation';
          INVALID_VAT_DATA: result:= 'invalid_vat_data';
          INVOICE_NUMBER_NOT_UNIQUE: result:= 'invoice_number_not_unique';
          KOBAK_PROCESSING: result:= 'kobak_processing';
          MISSING_DOCUMENT_ITEM_NAME: result:= 'missing_document_item_name';
          NAV_WARN: result:= 'nav_warn';
          NO_ONLINE_SZAMLA_SETTINGS: result:= 'no_online_szamla_settings';
          NO_SEND_BY_USER: result:= 'no_send_by_user';
          NON_EXIST_TAX_NUMBER: result:= 'non_exist_tax_number';
          NOT_UNIQUE: result:= 'not unique';
          NOT_CHECKED: result:= 'not_checked';
          NOT_REGISTERED_CUSTOMER: result:= 'not_registered_customer';
          PROCESSING: result:= 'processing';
          RECEIVED: result:= 'received';
          SAVED: result:= 'saved';
          SEND_FAILED: result:= 'send_failed';
          SENT: result:= 'sent';
          STARTED: result:= 'started';
          TECHNICAL_ERROR: result:= 'technical_error';
          UNDER_TAX_LIMIT: result:= 'under_tax_limit';
          USER_HAS_INVALID_KOBAK: result:= 'user_has_invalid_kobak';
          USER_HASNOT_KOBAK: result:= 'user_hasnot_kobak';
          VALIDATION_OK: result:= 'validation_ok';
  end;
end;
end.