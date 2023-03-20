unit UProdutoController;

interface
uses
  FireDAC.Comp.Client, UProdutoDAO;
  type
    TProdutoController = class
      private

      public
        procedure BuscarLista (MemTable : TFDMemTable);

        constructor Create;
        Destructor  Destroy; override;
    end;

implementation

uses
  System.SysUtils;

{ TProdutoModel }

procedure TProdutoController.BuscarLista(MemTable: TFDMemTable);
var
  ProdutoDAO : TProdutoDAO;
begin
  ProdutoDAO := TProdutoDAO.Create;
  try
    try
      MemTable.Data := ProdutoDAO.BuscarLista.Data;
    except
      on E: Exception do
      begin
        raise
      end;
    end;
  finally
    FreeAndNil(ProdutoDAO)
  end;

end;

constructor TProdutoController.Create;
begin

end;

destructor TProdutoController.Destroy;
begin

  inherited;
end;

end.
