unit BillingoUtils;

interface
uses Classes;

  function BoolToStr(data: boolean): string;
  function myStreamToString(aStream: TStream): string;
implementation
function myStreamToString(aStream: TStream): string;
var
  SS: TStringStream;
begin
  if aStream <> nil then
  begin
    SS := TStringStream.Create('');
    try
      SS.CopyFrom(aStream, 0); // Exception: TStream.Seek not implemented
      Result := SS.DataString;
    finally
      SS.Free;
    end;
  end else
  begin
    Result := '';
  end;
end;

function BoolToStr(data: boolean): string;
begin
  if data then
    result:='true'
  else
    result:='false';
end;

end.
