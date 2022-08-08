unit BItems;

interface
uses BOneOfDocumentInsertItemsItems;
type
  tBItems = array of tBOneOfDocumentInsertItemsItems;
  function loadFromJson(data: string): tBItems;

implementation

function loadFromJson(data: string): tBItems;
var
  startSignPos  : integer;
  endSignPos    : integer;
  workStr : string;
begin
  startSignPos:=pos('{',data);
  endSignPos:=pos('}',data);
  while startSignPos>0 do
  begin
    setLength(result,length(result)+1);
    result[length(result)-1]:= tBOneOfDocumentInsertItemsItems.Create;
    workStr:=copy(data,startSignPos,endSignPos-startSignPos+1);
    result[length(result)-1].loadFromJson(workStr);
    data[startSignPos]:='(';
    data[endSignPos]:=')';
    startSignPos:=pos('{',data);
    endSignPos:=pos('}',data);
  end;
end;

end.
