unit UClienteDAO;

interface
 uses FireDAC.Comp.Client, UDAO;
  type
    TClienteDAO = class(TDAO)
      private

      public

        function BuscarLista : TFDQuery;

    end;

implementation

uses
  System.SysUtils;

{ TProdutoDAO }

function TClienteDAO.BuscarLista: TFDQuery;
var
  Query : TFDQuery;
begin
  try
    Query := PrepararQuery;

    Query.SQL.Add(' SELECT * FROM CLIENTE ');

    Query.Open;

    Result := Query;
  except
    on E: Exception do
    begin
      raise;
    end;
  end;
end;

end.
