unit UClienteModel;

interface
  type
    TClienteModel = class
      private
        FNome    : String;
        FUF: String;
        FCodigo: Integer;
        FCidade: String;


      public
        property Codigo   : Integer  read FCodigo  write FCodigo;
        property Nome     : String   read FNome    write FNome;
        property Cidade   : String   read FCidade  write FCidade;
        property UF       : String   read FUF      write FUF;
    end;

implementation

end.
