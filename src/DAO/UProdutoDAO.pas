unit UProdutoDAO;

interface
 uses FireDAC.Comp.Client, UDAO;
  type
    TProdutoDAO = class(TDAO)
      private

      public

        function BuscarLista : TFDQuery;

    end;

implementation

uses
  System.SysUtils;

{ TProdutoDAO }

function TProdutoDAO.BuscarLista: TFDQuery;
var
  Query : TFDQuery;
begin
  try
    try
      Query := PrepararQuery;

      Query.SQL.Add(' SELECT * FROM PRODUTO ');

      Query.Open;

      Result := Query;
    except
      on E: Exception do
      begin
        raise;
      end;
    end;
  finally
//    FreeAndNil(Query);
  end;
end;

end.
