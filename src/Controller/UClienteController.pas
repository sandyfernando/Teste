unit UClienteController;

interface
uses
  FireDAC.Comp.Client, UClienteDAO;
  type
    TClienteController = class
      private

      public
        procedure BuscarLista(MemTable : TFDMemTable);
    end;

implementation

uses
  System.SysUtils;

{ TClienteController }

procedure TClienteController.BuscarLista(MemTable: TFDMemTable);
var
  ClienteDAO : TClienteDAO;
begin
  ClienteDAO := TClienteDAO.Create;
  try
    try
      MemTable.Data := ClienteDAO.BuscarLista.Data;
    except
      on E: Exception do
      begin
        raise
      end;
    end;
  finally
    FreeAndNil(ClienteDAO)
  end;
end;

end.
