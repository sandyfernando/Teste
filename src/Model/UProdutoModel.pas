unit UProdutoModel;

interface
  type
    TProdutoModel = class
      private
        FDescricao: String;
        FCodigo: Integer;
        FPrecoVenda: Currency;

      public
        property Codigo     : Integer  read FCodigo     write FCodigo;
        property Descricao  : String   read FDescricao write FDescricao;
        property PrecoVenda : Currency read FPrecoVenda write FPrecoVenda;
    end;

implementation

end.
