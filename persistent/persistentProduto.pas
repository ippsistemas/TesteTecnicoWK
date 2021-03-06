unit persistentProduto;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, logicProduto;

type
  TdmProduto = class(TDataModule)
    qryProdutosPesquisar: TFDQuery;
  public
    procedure Pesquisar(Codigo: integer; var id_retorno: integer);
    procedure Carregar(oProduto: TProduto);
  end;

var
  dmProduto: TdmProduto;

implementation

uses persistentConexao;

{$R *.dfm}

procedure TdmProduto.Pesquisar(Codigo: integer; var id_retorno: integer);
begin
    if qryProdutosPesquisar.Active then
      qryProdutosPesquisar.Close;

    qryProdutosPesquisar.ParamByName('codigo').AsInteger := Codigo;
    qryProdutosPesquisar.Open;
    id_retorno := qryProdutosPesquisar.FieldByName('Codigo').AsInteger;

    qryProdutosPesquisar.Close;
end;

procedure TdmProduto.Carregar(oProduto: TProduto);
begin
    if qryProdutosPesquisar.Active then
      qryProdutosPesquisar.Close;

    qryProdutosPesquisar.ParamByName('codigo').AsInteger := oProduto.Codigo;
    qryProdutosPesquisar.Open;

    oProduto.Codigo := qryProdutosPesquisar.FieldByName('Codigo').AsInteger;
    oProduto.Descricao := qryProdutosPesquisar.FieldByName('Descricao').AsString;
    oProduto.Preco := qryProdutosPesquisar.FieldByName('PrecoVenda').AsFloat;

    qryProdutosPesquisar.Close;
end;

end.
