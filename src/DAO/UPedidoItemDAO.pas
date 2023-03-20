unit UPedidoItemDAO;

interface
uses
  FireDAC.Comp.Client, UDAO, UPedidoItemModel;
  type
    TPedidoItemDAO = class(TDAO)
      private

      public
        procedure Gravar(PedidoItModel : TPedidoItemModel);
        constructor Create;
        destructor  Destroy;
    end;

implementation

uses
  System.SysUtils;

{ TPedidoDAO }


{ TPedidoDAO }

constructor TPedidoItemDAO.Create;
begin
  Connection := TFDConnection.Create(nil);
end;

destructor TPedidoItemDAO.Destroy;
begin
  FreeAndNil(Connection);
end;

procedure TPedidoItemDAO.Gravar(PedidoItModel: TPedidoItemModel);
var
  Qry : TFDQuery;
begin
  Qry := PrepararQuery(Connection);
  try
    try
      Qry.SQL.Add(' INSERT INTO PEDIDOITVENDA( '+
                  '   NUMPEDIDO,               '+
                  '   FKPRODUTO,               '+
                  '   VLUNITARIO,              '+
                  '   QAUNTIDADE,              '+
                  '   VLTOTAL) VALUES (        '+
                  '   :NUMPEDIDO,              '+
                  '   :FKPRODUTO,              '+
                  '   :VLUNITARIO,             '+
                  '   :QAUNTIDADE,             '+
                  '   :VLTOTAL)                ');

      Qry.ParamByName('NUMPEDIDO').AsInteger    := PedidoItModel.NumPedido;
      Qry.ParamByName('FKPRODUTO').AsInteger    := PedidoItModel.FKProduto.Codigo;
      Qry.ParamByName('VLUNITARIO').AsCurrency  := PedidoItModel.VlUnitario;
      Qry.ParamByName('QAUNTIDADE').AsCurrency  := PedidoItModel.Quantidade;
      Qry.ParamByName('VLTOTAL').AsCurrency     := PedidoItModel.VlTotal;

      Qry.ExecSQL;

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
