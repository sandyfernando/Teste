unit UDAO;

interface
uses
  FireDAC.Comp.Client, UConexaoDAO;
  type
    TDAO = Class
    Connection : TFDConnection;
    FDTrans    : TFDTransaction;
      private
      public
        constructor Create; reintroduce;
      published
        function  PrepararQuery(Connection : TFDConnection = nil) : TFDQuery;
        procedure IniciarTrasacao;
        procedure Finalizar(Commit : Boolean = True);


    End;

    var

      DAO       : TDAO;
      Transacao : TFDTransaction;

implementation

{ TDAO }

constructor TDAO.Create;
begin
  if not Assigned(Connection) then
  begin
    Connection := TConexaoDAO.getfdConnection;
  end;
end;

procedure TDAO.Finalizar(Commit: Boolean);
begin

end;

procedure TDAO.IniciarTrasacao;
begin
  if not  Assigned(FDTrans) then
  begin
    FDTrans := TFDTransaction.Create(nil);
  end;

  FDTrans.Connection := DAO.Connection;
  FDTrans.StartTransaction;

end;

function TDAO.PrepararQuery(Connection: TFDConnection): TFDQuery;
var
  Query : TFDQuery;
begin
  Query := nil;

  if not Assigned(DAO) then
  begin
    DAO := TDAO.Create;
  end;

  Query := TFDQuery.Create(nil);
  if Assigned(Connection) then
    Query.Connection  := Connection
  else
    Query.Connection  := DAO.Connection;
  Result := Query;
end;

end.
