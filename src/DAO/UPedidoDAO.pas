unit UPedidoDAO;

interface
uses UClienteModel, System.Generics.Collections, UDAO, UPedidoModel;

  type
    TPedidoDAO = class(TDAO)
    private
      function RetornarUltimoPedido : Integer;
    public
      function Gravar (PedidoModel : TPedidoModel) : Integer;
      constructor create;
      destructor  Destroy; override;

    end;

implementation
uses
  FireDAC.Comp.Client, System.SysUtils;

{ TPedidoDAO }

constructor TPedidoDAO.create;
begin
  Connection := TFDConnection.Create(nil);
end;

destructor TPedidoDAO.Destroy;
begin
  FreeAndNil(Connection);
  inherited;
end;

function TPedidoDAO.Gravar(PedidoModel: TPedidoModel) : Integer;
var
  Qry : TFDQuery;
begin
  Qry := PrepararQuery(Connection);
  try
    try
      Qry.SQL.Add(' INSERT INTO PEDIDOVENDA( '+
                  '   DATAEMISSAO,           '+
                  '   FKCLIENTE,             '+
                  '   VALORTOTAL)            '+
                  ' VALUES (                 '+
                  '   :DATAEMISSAO,          '+
                  '   :FKCLIENTE,            '+
                  '   :VALORTOTAL)           ');

      Qry.ParamByName('DATAEMISSAO').AsDate    := Date;
      Qry.ParamByName('FKCLIENTE').AsInteger   := PedidoModel.FKCliente.Codigo;
      Qry.ParamByName('VALORTOTAL').AsCurrency := PedidoModel.ValorTotal;

      Qry.ExecSQL;

      Result := RetornarUltimoPedido;

    except
      on E: Exception do
      begin
        raise;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;

end;

function TPedidoDAO.RetornarUltimoPedido: Integer;
var
  Qry : TFDQuery;
begin
  Qry := PrepararQuery();
  try
    try
      Qry.SQL.Add(' SELECT MAX(NUMPEDIDO) FROM PEDIDOVENDA');
      Qry.Open;

      Result := Qry.Fields[0].AsInteger;

    except
      on E: Exception do
      begin
        raise;
      end;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

end.
