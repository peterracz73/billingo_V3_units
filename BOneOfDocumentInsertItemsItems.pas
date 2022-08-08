unit BOneOfDocumentInsertItemsItems;

interface
uses BDocumentItemData, BDocumentProductData, JsonUtils;

type

  tBOneOfDocumentInsertItemsItems = class
  private
    p_DocumentItemData: tBDocumentItemData;
    p_DocumentProductData: tBDocumentProductData;
  public
    constructor Create();virtual;
    destructor Destroy();override;
    function getDocumentProductData: tBDocumentProductData;
    procedure setDocumentProductData(product: tBDocumentProductData);
    function getDocumentItemData: tBDocumentItemData;

    procedure setDocumentItemData(item: tBDocumentItemData);
    property DocumentItemData : tBDocumentItemData read getDocumentItemData write setDocumentItemData;
    property DocumentProductData : tBDocumentProductData read getDocumentProductData write setDocumentProductData;

    function toJsonStr(deep: integer): string;
    function loadFromJson(workStr: string): tBOneOfDocumentInsertItemsItems;
  end;

implementation
constructor tBOneOfDocumentInsertItemsItems.Create;
begin
  p_DocumentItemData := tBDocumentItemData.Create;
  p_DocumentProductData := tBDocumentProductData.Create;
end;

destructor tBOneOfDocumentInsertItemsItems.Destroy;
begin
  p_DocumentItemData.Destroy;
  p_DocumentProductData.Destroy;
end;

function tBOneOfDocumentInsertItemsItems.loadFromJson(workStr: string): tBOneOfDocumentInsertItemsItems;
begin
  p_DocumentItemData.loadFromJson(workStr);
  p_DocumentProductData.loadFromJson(workStr);
end;

function tBOneOfDocumentInsertItemsItems.getDocumentItemData: tBDocumentItemData;
begin
  result:=p_DocumentItemData;
end;

procedure tBOneOfDocumentInsertItemsItems.setDocumentItemData(item: tBDocumentItemData);
begin
  p_DocumentItemData.product_id:=item.product_id;
  p_DocumentItemData.quantity:=item.quantity;
  p_DocumentItemData.comment:=item.comment;
end;

function tBOneOfDocumentInsertItemsItems.getDocumentProductData: tBDocumentProductData;
begin
  result:=p_DocumentProductData;
end;

procedure tBOneOfDocumentInsertItemsItems.setDocumentProductData(product: tBDocumentProductData);
begin
  p_DocumentProductData.name:=product.name;
  p_DocumentProductData.unit_price:=product.unit_price;
  p_DocumentProductData.unit_price_type:=product.unit_price_type;
  p_DocumentProductData.quantity:=product.quantity;
  p_DocumentProductData.unit_:=product.unit_;
  p_DocumentProductData.vat:=product.vat;
  p_DocumentProductData.comment:=product.comment;
  p_DocumentProductData.entitlement:=product.entitlement;
end;

function tBOneOfDocumentInsertItemsItems.toJsonStr(deep: integer): string;
begin
    if p_DocumentItemData.product_id <0 then
    begin
      result:=p_DocumentProductData.toJSonStr(deep);
    end
    else
    begin
      result:=p_DocumentItemData.toJsonStr(deep);
    end;
end;

end.
