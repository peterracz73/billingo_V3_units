unit BStringArray;

interface
uses Classes;
type
tBStringArray = array of string;

  function toString(data: tBStringArray; deep: integer; after: string): string;
  function toArrayFromJson(data : string): tBStringArray;
  function toArrayFromStr(data : string): tBStringArray;
  function toList(data: tBStringArray; separator: string): string;
implementation
function toArrayFromStr(data : string): tBStringArray;
var
  indxNew : integer;
  indxOld : integer;
  str0  : string;
begin
  indxNew:=pos(',',data);
  indxOld:=1;
  while indxNew>0 do
  begin
    data[indxNew]:=';';
    setLength(result,length(result)+1);
    result[length(result)-1]:=copy(data,indxOld,indxNew-indxOld);
    indxOld:=indxNew+1;
    indxNew:=pos(',',data);
  end;
  if length(data)>indxOld then
  begin
    setLength(result,length(result)+1);
    result[length(result)-1]:=copy(data,indxOld,length(data)-indxOld+1);
  end;
end;

function toArrayFromJson(data : string): tBStringArray;
var
  indxNew : integer;
  indxOld : integer;
  str0  : string;
begin
  indxNew:=pos(',',data);
  indxOld:=3;
  while indxNew>0 do
  begin
    data[indxNew]:=';';
    setLength(result,length(result)+1);
    result[length(result)-1]:=copy(data,indxOld,indxNew-indxOld-1);
    indxOld:=indxNew+2;
    indxNew:=pos(',',data);
  end;
  if length(data)>indxOld then
  begin
    setLength(result,length(result)+1);
    result[length(result)-1]:=copy(data,indxOld,length(data)-indxOld-1);
  end;
end;

function toList(data: tBStringArray; separator: string): string;
var
  i0 : integer;
begin
  if separator='' then
    separator:=',';
  result:='';
  for i0 := 0 to length(data) - 1 do
  begin
    result:=result+data[i0];
    if i0< length(data) - 1then
      result:=result+separator;
  end;
end;

function toString(data: tBStringArray; deep: integer; after: string): string;
var
  lines : tStringList;
  i0    : integer;
  deepStr : string;
begin
  deepStr:='';
  for i0 := 1 to deep do
    deepStr:=deepStr+#9;

  lines:=tStringList.Create;

  lines.Add(deepStr+'[');
  for i0 := 0 to length(data) - 1 do
  begin
    if i0=length(data) - 1 then
      lines.Add(deepStr+#9+'"'+data[i0]+'"')
    else
      lines.Add(deepStr+#9+'"'+data[i0]+'",');
  end;
  lines.Add(deepStr+']'+after);

  result:=copy(lines.Text,0,length(lines.Text)-2);
  lines.Destroy;
end;
end.
