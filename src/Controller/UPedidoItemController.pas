unit UPedidoItemController;

interface

uses
  FireDAC.Comp.Client, UPedidoItemModel;

type
  TPedidoItemController = class
  private
    procedure CarregarModel (const MemTab : TFDMemTable; var PedidoItModel : TPedidoItemModel);
    procedure EditarMemTab  (var MemTablePedidoIt, MemTableProduto: TFDMemTable; const Qtde, PrecoVenda: Currency; const Seq: Integer);
    procedure IncluirMemTab (var MemTablePedidoIt, MemTableProduto: TFDMemTable;const Qtde, PrecoVenda: Currency);

    function TratarInsercaoMemTabIt (var MemTab: TFDMemTable; const Qtde, PrecoVenda: Currency; const Seq: Integer = 0): Boolean;

  public
    procedure CriarCampos(var MemTable: TFDMemTable);
    procedure Gravar     (const MemTab : TFDMemTable; const NumPedido : Integer; Conexao : TFDConnection);

    function DeletarPedidoItMemTab (var MemTabPedidoIt: TFDMemTable) : Currency;
    function GravarMemTable        (var MemTablePedidoIt, MemTableProduto: TFDMemTable; const Qtde, PrecoVenda: Currency; const Seq: Integer): Currency;
    function RetornarTotalItens    (Var MemTab: TFDMemTable): Currency;

  end;

implementation

uses
  Data.DB, System.SysUtils, Vcl.Dialogs, Vcl.Controls, UPedidoItemDAO;

{ TPedidoItemController }

procedure TPedidoItemController.CarregarModel(const MemTab: TFDMemTable; var PedidoItModel: TPedidoItemModel);
begin
  PedidoItModel.VlUnitario       := MemTab.FieldByName('VLUNITARIO').AsCurrency;
  PedidoItModel.Quantidade       := MemTab.FieldByName('QUANTIDADE').AsCurrency;
  PedidoItModel.VlTotal          := MemTab.FieldByName('VLTOTAL').AsCurrency;
  PedidoItModel.FKProduto.Codigo := MemTab.FieldByName('FKPRODUTO').AsInteger
end;

procedure TPedidoItemController.CriarCampos(var MemTable: TFDMemTable);
begin
  try
    MemTable.FieldDefs.Add('SEQ', ftInteger, 0, false);
    MemTable.FieldDefs.Add('FKPRODUTO', ftInteger, 0, false);
    MemTable.FieldDefs.Add('DESCRICAOPRODUTO', ftString, 30, false);
    MemTable.FieldDefs.Add('QUANTIDADE', ftCurrency, 0, false);
    MemTable.FieldDefs.Add('VLUNITARIO', ftCurrency, 0, false);
    MemTable.FieldDefs.Add('VLTOTAL', ftCurrency, 0, false);

    MemTable.CreateDataSet;

    MemTable.Open;
  except
    on E: Exception do
    begin
      raise
    end;
  end;
end;

function TPedidoItemController.DeletarPedidoItMemTab(var MemTabPedidoIt : TFDMemTable) : Currency;
begin
  try
    if MemTabPedidoIt.IsEmpty then
      exit;

    if MessageDlg('Deseja Excluir esse item ' + MemTabPedidoIt.FieldByName
      ('DESCRICAOPRODUTO').AsString, mtConfirmation, [mbYes, mbNo], 0) = mrNo
    then
      exit;

    MemTabPedidoIt.Delete;

    Result := RetornarTotalItens(MemTabPedidoIt);
  except
    on E: Exception do
    begin
      raise
    end;
  end;
end;

procedure TPedidoItemController.EditarMemTab(var MemTablePedidoIt, MemTableProduto: TFDMemTable; const Qtde, PrecoVenda: Currency; const Seq: Integer);
begin
  try
    if TratarInsercaoMemTabIt(MemTableProduto, Qtde, PrecoVenda) then
      exit;

    if not MemTablePedidoIt.Locate('SEQ', Seq, []) then
      raise Exception.Create('Item não existe mais no grid para edição');

    MemTablePedidoIt.Edit;

    MemTablePedidoIt.FieldByName('QUANTIDADE').AsCurrency := Qtde;
    MemTablePedidoIt.FieldByName('VLUNITARIO').AsCurrency := PrecoVenda;
    MemTablePedidoIt.FieldByName('VLTOTAL').AsCurrency := Qtde * PrecoVenda;

    MemTablePedidoIt.Post;

  except
    on E: Exception do
    begin
      raise
    end;
  end;
end;

procedure TPedidoItemController.Gravar(const MemTab: TFDMemTable; const NumPedido: Integer; Conexao : TFDConnection);
var
  PedidoItDao : TPedidoItemDAO;
  PedidoModel : TPedidoItemModel;
begin
  PedidoItDao := TPedidoItemDAO.Create;
  PedidoModel := TPedidoItemModel.Create;
  try
    try
      PedidoItDao.Connection.Assign(Conexao);
      MemTab.First;
      while not MemTab.Eof do
      begin
        CarregarModel(MemTab, PedidoModel);
        PedidoModel.NumPedido := NumPedido;
        PedidoItDao.Gravar(PedidoModel);

        MemTab.Next
      end;
    except
      on E: Exception do
      begin
        raise;
      end;
    end;
  finally
    FreeAndNil(PedidoItDao);
    FreeAndNil(PedidoModel);
  end;

end;

function TPedidoItemController.GravarMemTable(var MemTablePedidoIt, MemTableProduto: TFDMemTable; const Qtde, PrecoVenda: Currency;
  const Seq: Integer): Currency;
begin
  if Seq <> 0 then
  begin
    EditarMemTab(MemTablePedidoIt, MemTableProduto, Qtde, PrecoVenda, Seq);
  end
  else
  begin
    IncluirMemTab(MemTablePedidoIt, MemTableProduto, Qtde, PrecoVenda);
  end;

  Result := RetornarTotalItens(MemTablePedidoIt);

end;

procedure TPedidoItemController.IncluirMemTab(var MemTablePedidoIt, MemTableProduto: TFDMemTable; const Qtde, PrecoVenda: Currency);
begin
  try
    if TratarInsercaoMemTabIt(MemTableProduto, Qtde, PrecoVenda) then
      exit;

    MemTablePedidoIt.AppendRecord([MemTablePedidoIt.RecordCount + 1,
                                   MemTableProduto.FieldByName('CODIGO').AsInteger,
                                   MemTableProduto.FieldByName('DESCRICAO').AsString, Qtde, PrecoVenda,
                                   PrecoVenda * Qtde]);
  except
    on E: Exception do
    begin
      raise;
    end;
  end;
end;

function TPedidoItemController.RetornarTotalItens(var MemTab: TFDMemTable)
  : Currency;
begin
  MemTab.Aggregates.Add;
  MemTab.Aggregates[0].Expression := 'SUM(VLTOTAL)';
  MemTab.Aggregates[0].Name := 'Total';
  MemTab.Aggregates[0].Active := True;
  MemTab.AggregatesActive := True;

  Result := MemTab.Aggregates[0].Value;

  MemTab.Aggregates.Clear;
end;

function TPedidoItemController.TratarInsercaoMemTabIt(var MemTab: TFDMemTable; const Qtde, PrecoVenda: Currency;
  const Seq: Integer = 0): Boolean;
var
  Msg: String;
begin
  Result := false;
  try
    if MemTab.IsEmpty then
      Msg := 'Não existem itens para inserção';

    if (Qtde <= 0) or (PrecoVenda <= 0) then
      Msg := 'O valor da quantidade ou do item não é valido';

    if not(Msg.IsEmpty) then
    begin
      Result := True;
      ShowMessage(Msg);
    end;
  except
    on E: Exception do
    begin
      raise
    end;
  end;
end;

end.
