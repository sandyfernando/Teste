unit UPedidoController;

interface
uses
  FireDAC.Comp.Client, UPedidoModel;
  type
    TPedidoController = class
      private
        procedure CarregarCliente      (MenTab : TFDMemTable);
        procedure CarregarPedidoModel  (var MemTabCliente, MemTabPedidoIt : TFDMemTable; var PedidoModel : TPedidoModel);
        procedure CarregarProduto      (MemTab : TFDMemTable);
        procedure CriarMemTabPedeidoIt (MemTab : TFDMemTable);
      public
        procedure Gravar      (var MemTabCliente, MemTabPedidoIt : TFDMemTable);
        procedure InciarPedido(var MemTabCliente, MemTableProduto, MemTabPedidoIt : TFDMemTable);


    end;

implementation

uses
  System.SysUtils, UClienteController, UProdutoController,
  UPedidoItemController, UPedidoDAO, UPedidoItemDAO, UConexaoDAO;

{ TPedidoController }

procedure TPedidoController.CarregarCliente(MenTab: TFDMemTable);
var
  ClienteController : TClienteController;
begin
  ClienteController := TClienteController.Create;
  try
    try
      ClienteController.BuscarLista(MenTab);
    except
      on E: Exception do
      begin
        raise
      end;
    end;
  finally
    FreeAndNil(ClienteController);
  end;
end;

procedure TPedidoController.CarregarPedidoModel(var MemTabCliente,  MemTabPedidoIt: TFDMemTable; var PedidoModel: TPedidoModel);
var
  PedidoItController : TPedidoItemController;
begin
  PedidoItController := TPedidoItemController.Create;
  try
    PedidoModel.FKCliente.Codigo := MemTabCliente.FieldByName('CODIGO').AsInteger;
    PedidoModel.ValorTotal       := PedidoItController.RetornarTotalItens(MemTabPedidoIt);
  finally
    FreeAndNil(PedidoItController);
  end;

end;

procedure TPedidoController.CarregarProduto(MemTab: TFDMemTable);
var
  ProdutoController : TProdutoController;
begin
  ProdutoController := TProdutoController.Create;
  try
    try
      ProdutoController.BuscarLista(MemTab);
    except
      on E: Exception do
      begin
        raise
      end;
    end;
  finally
    FreeAndNil(ProdutoController);
  end;

end;

procedure TPedidoController.CriarMemTabPedeidoIt(MemTab: TFDMemTable);
var
  PedidoItController : TPedidoItemController;
begin
  try
    try
      PedidoItController.CriarCampos(MemTab);
    except
      on E: Exception do
      begin
        raise
      end;
    end;
  finally
    FreeAndNil(PedidoItController);
  end;

end;

procedure TPedidoController.Gravar(var MemTabCliente, MemTabPedidoIt : TFDMemTable);
var
  PedidoDAO          : TPedidoDAO;
  PedidoItController : TPedidoItemController;
  PedidoModel        : TPedidoModel;
  NumPedido          : Integer;
begin
  PedidoDAO          := TPedidoDAO.create;
  PedidoModel        := TPedidoModel.create;
  PedidoItController := TPedidoItemController.Create;
  try
    try
      PedidoDAO.Connection.Assign(TConexaoDAO.geTFDConnection);
      TConexaoDAO.IniciarTransacao(PedidoDAO.Connection);

      CarregarPedidoModel(MemTabCliente, MemTabPedidoIt, PedidoModel);

      NumPedido :=  PedidoDAO.Gravar(PedidoModel);

      PedidoItController.Gravar(MemTabPedidoIt, NumPedido, PedidoDAO.Connection);

      TConexaoDAO.FinalizarTransacao(PedidoDAO.Connection, TFDTransaction(PedidoDAO.Connection.Transaction) ,True );
    except
      on E: Exception do
      begin
        TConexaoDAO.FinalizarTransacao(PedidoDAO.Connection, TFDTransaction(PedidoDAO.Connection.Transaction) ,False);
        raise
      end;
    end;
  finally
    System.SysUtils.FreeAndNil(PedidoDAO);
    System.SysUtils.FreeAndNil(PedidoModel);
    System.SysUtils.FreeAndNil(PedidoItController);
  end;

end;

procedure TPedidoController.InciarPedido(var MemTabCliente, MemTableProduto, MemTabPedidoIt: TFDMemTable);
begin
  try
    CarregarCliente(MemTabCliente);
    CarregarProduto(MemTableProduto);
    CriarMemTabPedeidoIt(MemTabPedidoIt);
  except
    on E: Exception do
    begin
      raise;
    end;
  end;

end;

end.
