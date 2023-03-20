unit UPedidoItemModel;

interface

uses UProdutoModel;
  type
    TPedidoItemModel = class
      private
        FFKProduto: TProdutoModel;
        FVlTotal: Currency;
        FQuantidade: Currency;
        FVlUnitario: Currency;
        FNumItPedido: Integer;
        FNumPedido: Integer;

      public
        property NumItPedido  : Integer       read FNumItPedido  write FNumItPedido;
        property NumPedido    : Integer       read FNumPedido    write FNumPedido;
        property FKProduto    : TProdutoModel read FFKProduto    write FFKProduto;
        property VlUnitario   : Currency      read FVlUnitario   write FVlUnitario;
        property Quantidade   : Currency      read FQuantidade   write FQuantidade;
        property VlTotal      : Currency      read FVlTotal      write FVlTotal;

        constructor Create;
        destructor Destroy; override;
    end;

implementation
uses
    System.SysUtils;
{ TPedidoItemModel }

constructor TPedidoItemModel.Create;
begin
  FFKProduto := TProdutoModel.Create;
end;

destructor TPedidoItemModel.Destroy;
begin
  FreeAndNil(FFKProduto);
  inherited;
end;

end.
