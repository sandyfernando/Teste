program PedidoDeVenda;

uses
  Vcl.Forms,
  UFPedidoVendaView in 'src\View\UFPedidoVendaView.pas' {FPedidoVendaView},
  UPedidoModel in 'src\Model\UPedidoModel.pas',
  UPedidoController in 'src\Controller\UPedidoController.pas',
  UPedidoItemModel in 'src\Model\UPedidoItemModel.pas',
  UPedidoItemController in 'src\Controller\UPedidoItemController.pas',
  UClienteModel in 'src\Model\UClienteModel.pas',
  UClienteController in 'src\Controller\UClienteController.pas',
  UProdutoModel in 'src\Model\UProdutoModel.pas',
  UProdutoController in 'src\Controller\UProdutoController.pas',
  UPedidoDAO in 'src\DAO\UPedidoDAO.pas',
  UPedidoItemDAO in 'src\DAO\UPedidoItemDAO.pas',
  UConexaoDAO in 'src\DAO\UConexaoDAO.pas',
  UDAO in 'src\DAO\UDAO.pas',
  UProdutoDAO in 'src\DAO\UProdutoDAO.pas',
  UClienteDAO in 'src\DAO\UClienteDAO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPedidoVendaView, FPedidoVendaView);
  Application.Run;
end.
