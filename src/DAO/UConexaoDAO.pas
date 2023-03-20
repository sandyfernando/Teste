unit UConexaoDAO;

interface
uses
  FireDAC.Comp.Client, System.Classes, FireDAC.Stan.Def, FireDAC.Phys.MySQL, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Comp.UI, FireDAC.Stan.Async, System.IniFiles;
  Type
    TConexaoDAO = Class

      public

        class function PrepararQuery(Connection: TFDConnection): TFDQuery;
        class function geTFDConnection: TFDConnection;
        class function IniciarTransacao(Connection: TFDConnection): TFDTransaction;
        class procedure FinalizarTransacao(Connection: TFDConnection; Transacao: TFDTransaction; Commit: Boolean);
        class function LerIni(Chave1, Chave2: String; ValorPadrao: String = ''): String;

    End;

implementation
uses
  Vcl.Forms, System.SysUtils, Vcl.Dialogs;

{ TCanexaoDAO }


class procedure TConexaoDAO.FinalizarTransacao(Connection: TFDConnection; Transacao: TFDTransaction; Commit: Boolean);
begin
  if assigned(Transacao) then
  begin
    if Commit then
      Transacao.Commit
    else
      Transacao.Rollback
  end
  else
  begin
    if Commit then
      Connection.Commit
    else
      Connection.Rollback
  end;
end;

class function TConexaoDAO.geTFDConnection: TFDConnection;
var
  CaminhoRede           : String;
  Connection            : TFDConnection;
  FDPhysMSSQLDriverLink : TFDPhysMySQLDriverLink;
begin
  Connection := nil;

  try
    try
      Connection := TFDConnection.Create(nil);
      FDPhysMSSQLDriverLink := TFDPhysMySQLDriverLink.Create(Connection);
      FDPhysMSSQLDriverLink.VendorLib := LerIni('MYSQL','VendorLib');
      Connection.Params.Values['DriverID']  :='Mysql';
      Connection.Params.Values['Server']    := LerIni('MYSQL','Server');
      Connection.Params.Values['Database']  := LerIni('MYSQL','Database');
      Connection.Params.Values['User_name'] := LerIni('MYSQL','User');
      Connection.Params.Values['Password']  := LerIni('MYSQL','Password');
      Connection.Params.Values['VendorLib'] := LerIni('MYSQL','VendorLib');

      Connection.Connected := True;
    except
      on Expt: Exception do
      begin
        if Trim(CaminhoRede) = '' then
        begin
          CaminhoRede := '(Não informado)';
        end;

        MessageDlg
          ('Ocorreu uma falha durante a tentativa de conectar com o banco de dados!'
          + #13 + 'Caminho de Rede: ' + CaminhoRede + #13 + #13 + 'Mensagem: ' +
          Expt.Message, mtError, [mbOK], 0);

        Application.Terminate;
      end;
    end;
  finally
    Result := Connection;
  end;

end;

class function TConexaoDAO.IniciarTransacao(Connection: TFDConnection): TFDTransaction;
begin
  if not assigned(Connection.Transaction) then
  begin
    Result := TFDTransaction.Create(Nil);
    Connection.Transaction := Result;
  end;
  Connection.Transaction.StartTransaction;
end;

class function TConexaoDAO.LerIni(Chave1, Chave2, ValorPadrao: String): String;
var
  Arquivo: String;
  FileIni: TIniFile;
begin
  Arquivo := ExtractFilePath(Application.ExeName) + Application.Title + '.ini';
  result := ValorPadrao;
  try
    FileIni := TIniFile.Create(Arquivo);
    if FileExists(Arquivo) then
      result := FileIni.ReadString(Chave1, Chave2, ValorPadrao);
  finally
    FreeAndNil(FileIni)
  end;
end;



class function TConexaoDAO.PrepararQuery(Connection: TFDConnection): TFDQuery;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := Connection;
  Result := Query;
end;

end.

