unit UPedidoModel;

interface
uses UClienteModel, UPedidoItemModel, System.Generics.Collections;

  type
    TPedidoModel = class
    private
      FPedidoItemModel : TObjectList<TPedidoItemModel>;
      FDataEmissao     : TDateTime;
      FFKCliente       : TClienteModel;
      FValorTotal      : Currency;
      FNumPedido: Integer;


    public
      property NumPedido       : Integer                        read FNumPedido        write FNumPedido;
      property DataEmissao     : TDateTime                      read FDataEmissao     write FDataEmissao;
      property FKCliente       : TClienteModel                  read FFKCliente       write FFKCliente;
      property PedidoItemModel : TObjectList<TPedidoItemModel>  read FPedidoItemModel write FPedidoItemModel;
      property ValorTotal      : Currency                       read FValorTotal      write FValorTotal;

      constructor create;
      destructor  Destroy; override;

    end;

implementation
uses
  System.SysUtils;
{ TPedidoDAO }

constructor TPedidoModel.create;
begin
  FFKCliente       := TClienteModel.Create;
  FPedidoItemModel := TObjectList<TPedidoItemModel>.Create;
end;

destructor TPedidoModel.Destroy;
begin
  FreeAndNil(FFKCliente);
  FreeAndNil(FPedidoItemModel);
  inherited;
end;

end.
