unit BDocumentNotificationStatus;

interface
type
tBDocumentNotificationStatus = (
      CLOSED,// = 'closed';
      DOWNLOADED,// = 'downloaded';
      FAILED,// = 'failed';
      NONE,// = 'none';
      OPENED,// = 'opened';
      READED// = 'readed';
      );

  function toString(data: tBDocumentNotificationStatus): string;
  function toEnum(data: string): tBDocumentNotificationStatus;
implementation

function toEnum(data: string): tBDocumentNotificationStatus;
begin
      if data='closed' then result:= CLOSED;
      if data='downloaded' then result:= DOWNLOADED;
      if data='failed' then result:= FAILED;
      if data='none' then result:= NONE;
      if data='opened' then result:= OPENED;
      if data='readed' then result:= READED;
end;

function toString(data: tBDocumentNotificationStatus): string;
begin
  case data of
      CLOSED: result:= 'closed';
      DOWNLOADED: result:= 'downloaded';
      FAILED: result:= 'failed';
      NONE: result:= 'none';
      OPENED: result:= 'opened';
      READED: result:= 'readed';
  end;
end;
end.
