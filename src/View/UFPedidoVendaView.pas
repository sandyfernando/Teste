unit UFPedidoVendaView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFPedidoVendaView = class(TForm)
    Panel1: TPanel;
    GdPedidoItem: TDBGrid;
    GdPnlRodaPe: TGridPanel;
    GdPnlProduto: TGridPanel;
    DsPedidoItem: TDataSource;
    PnlCdCliente: TPanel;
    PnlDesCliente: TPanel;
    Panel8: TPanel;
    PnlUF: TPanel;
    PnlVazio: TPanel;
    PnlTotalPedido: TPanel;
    Label6: TLabel;
    GdPnl: TGridPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EdtCdCliente: TEdit;
    EdtDesCliente: TEdit;
    EdtCidade: TEdit;
    EdtUF: TEdit;
    EdtValorPedido: TEdit;
    PnlIncluirItem: TPanel;
    MemTabProduto: TFDMemTable;
    MemTabCliente: TFDMemTable;
    MemTabPedidoItem: TFDMemTable;
    Panel6: TPanel;
    BtnIncluir: TButton;
    Label4: TLabel;
    EdtValorProduto: TEdit;
    Label3: TLabel;
    EdtQtde: TEdit;
    Label2: TLabel;
    EdtDesProduto: TEdit;
    Label1: TLabel;
    EdtCdProduto: TEdit;
    Label10: TLabel;
    EdtSeq: TEdit;
    GdPnlSalvar: TGridPanel;
    Panel7: TPanel;
    Panel9: TPanel;
    BtnSalvar: TButton;
    procedure FormShow(Sender: TObject);
    procedure EdtCdClienteExit(Sender: TObject);
    procedure EdtCdProdutoExit(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure GdPedidoItemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnSalvarClick(Sender: TObject);
  private
    { Private declarations }


    procedure LocalizarCliente;
    procedure LocalizarProduto;

    procedure InserirItens;
    procedure DeletarItens;
    procedure IniciarTela;
    procedure EditarPedidoIt;

    procedure LimparCampos;

    procedure Gravar;

  public
    { Public declarations }
  end;

var
  FPedidoVendaView: TFPedidoVendaView;

implementation

uses
  UPedidoController, UPedidoItemController;

{$R *.dfm}

{ TFPedidoVendaView }

procedure TFPedidoVendaView.BtnIncluirClick(Sender: TObject);
begin
  InserirItens;
end;

procedure TFPedidoVendaView.IniciarTela;
var
  PedidoController : TPedidoController;
begin
  PedidoController := TPedidoController.Create;
  try
    try
      PedidoController.InciarPedido(MemTabCliente, MemTabProduto, MemTabPedidoItem);
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao Inciar a cagarda da Tela : '+ E.Message);
      end;
    end;
  finally
    FreeAndNil(PedidoController);
  end;
end;

procedure TFPedidoVendaView.BtnSalvarClick(Sender: TObject);
begin
  Gravar;
end;

procedure TFPedidoVendaView.DeletarItens;
var
  PedidoItController : TPedidoItemController;
begin
  PedidoItController := TPedidoItemController.Create;
  try
    try
       EdtValorPedido.Text := CurrToStr(PedidoItController.DeletarPedidoItMemTab(MemTabPedidoItem));
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao deletar item : ' + e.Message);
      end;
    end;
  finally
    FreeAndNil(PedidoItController);
  end;

end;

procedure TFPedidoVendaView.EditarPedidoIt;
begin
  EdtSeq.Text          := IntToStr(MemTabPedidoItem.FieldByName('SEQ').AsInteger);
  EdtCdProduto.Text    := MemTabPedidoItem.FieldByName('FKPRODUTO').AsString;
  EdtDesProduto.Text   := MemTabPedidoItem.FieldByName('DESCRICAOPRODUTO').AsString;
  EdtQtde.Text         := CurrToStr(MemTabPedidoItem.FieldByName('QUANTIDADE').AsCurrency);
  EdtValorProduto.Text := CurrToStr(MemTabPedidoItem.FieldByName('VLUNITARIO').AsCurrency);
  EdtCdProduto.Enabled := False;
  EdtQtde.SetFocus;
end;

procedure TFPedidoVendaView.EdtCdClienteExit(Sender: TObject);
begin
  LocalizarCliente;
end;

procedure TFPedidoVendaView.EdtCdProdutoExit(Sender: TObject);
begin
  LocalizarProduto;
end;

procedure TFPedidoVendaView.FormShow(Sender: TObject);
begin
  IniciarTela;
end;

procedure TFPedidoVendaView.GdPedidoItemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    DeletarItens;

  if Key = VK_RETURN then
    EditarPedidoIt;

end;

procedure TFPedidoVendaView.Gravar;
var
  PedidoController : TPedidoController;
begin
  PedidoController := TPedidoController.Create;
  try
    try
      PedidoController.Gravar(MemTabCliente, MemTabPedidoItem);
      ShowMessage('Gravação feita com sucesso!');
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    FreeAndNil(PedidoController);
  end;

end;

procedure TFPedidoVendaView.InserirItens;
var
  PedidoItController : TPedidoItemController;
begin  
  PedidoItController := TPedidoItemController.Create;
  try
    try
      EdtValorPedido.Text :=
        CurrToStr(PedidoItController.GravarMemTable(MemTabPedidoItem, MemTabProduto, StrToCurr(EdtQtde.Text), StrToCurr(EdtValorProduto.Text), StrToInt(EdtSeq.Text)));
      LimparCampos;
    except 
      on E: Exception do
      begin
        ShowMessage(e.Message);
      end;
    end;
  finally
    FreeAndNil(PedidoItController);
  end;
end;

procedure TFPedidoVendaView.LimparCampos;
begin
  EdtCdProduto.Clear;
  EdtDesProduto.Clear;
  EdtQtde.Clear;
  EdtValorProduto.Clear;
  EdtSeq.Text := '0';
  EdtCdProduto.Enabled := True;
end;

procedure TFPedidoVendaView.LocalizarCliente;
begin
  if (Trim(EdtCdCliente.Text) = '') then
    exit;

  if MemTabCliente.Locate('CODIGO', StrToIntDef(EdtCdCliente.Text, 0), []) then
  begin
    EdtDesCliente.Text := MemTabCliente.FieldByName('NOME').AsString;
    EdtCidade.Text     := MemTabCliente.FieldByName('CIDADE').AsString;
    EdtUF.Text         := MemTabCliente.FieldByName('UF').AsString;
  end;
end;

procedure TFPedidoVendaView.LocalizarProduto;
begin
  if (Trim(EdtCdProduto.Text) = '') then
    exit;

  if MemTabProduto.Locate('CODIGO', StrToIntDef(EdtCdProduto.Text, 0), []) then
  begin
    EdtDesProduto.Text   := MemTabProduto.FieldByName('DESCRICAO').AsString;
    EdtValorProduto.Text := CurrToStr(MemTabProduto.FieldByName('PRECOVENDA').AsCurrency);
    EdtQtde.Text         := '0,00';
  end;
end;
end.
