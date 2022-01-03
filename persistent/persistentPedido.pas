unit persistentPedido;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, logicPedido, persistentConexao,
  logicProduto;

type
  TdmPedido = class(TDataModule)
    qryPedidosPesquisar: TFDQuery;
    qryPedidosGravar: TFDQuery;
    qryPedidosAlterar: TFDQuery;
    qryPedidosItensExcluir: TFDQuery;
    qryPedidosItensGravar: TFDQuery;
    qryPedidosItensPesquisar: TFDQuery;
  public
    procedure Carregar(oPedido: TPedido);
    procedure Gravar(oPedido: TPedido);
  end;

var
  dmPedido: TdmPedido;

implementation

{$R *.dfm}

procedure TdmPedido.Carregar(oPedido: TPedido);
var
  lProduto: TProduto;
begin
  qryPedidosPesquisar.Close;
  qryPedidosPesquisar.ParamByName('numero').AsInteger := oPedido.Id;
  qryPedidosPesquisar.Open;

  oPedido.Id := qryPedidosPesquisar.FieldByName('Numero').AsInteger;
  oPedido.Cliente.Id := qryPedidosPesquisar.FieldByName('cliente').AsInteger;
  oPedido.Cliente.Nome := qryPedidosPesquisar.FieldByName('nome').AsString;
  oPedido.Cliente.Cidade := qryPedidosPesquisar.FieldByName('cidade').AsString;
  oPedido.Cliente.UF := qryPedidosPesquisar.FieldByName('uf').AsString;
  oPedido.DataEmissao := qryPedidosPesquisar.FieldByName('emissao').AsDateTime;

  qryPedidosItensPesquisar.Close;
  qryPedidosItensPesquisar.ParamByName('numero').AsInteger := oPedido.Id;
  qryPedidosItensPesquisar.Open;

  while not qryPedidosItensPesquisar.Eof do
  begin

    lProduto := TProduto.Create;
    lProduto.Codigo := qryPedidosItensPesquisar.FieldByName('produto').AsInteger;
    lProduto.Descricao := qryPedidosItensPesquisar.FieldByName('descricao').AsString;
    lProduto.Quantidade := qryPedidosItensPesquisar.FieldByName('quantidade').AsInteger;
    lProduto.Preco := qryPedidosItensPesquisar.FieldByName('valorunitario').AsFloat;
    oPedido.Produtos.Add(lProduto);
    qryPedidosItensPesquisar.Next;

  end;

  qryPedidosItensPesquisar.Close;
  qryPedidosPesquisar.Close;
end;

procedure TdmPedido.Gravar(oPedido: TPedido);
var
  lProduto: TProduto;
  lEditando: Boolean;
begin
  persistentConexao.dmCon1.transa1.StartTransaction;
  try
    lEditando := oPedido.Id > 0;

    if lEditando then
    begin
      qryPedidosItensExcluir.ParamByName('numero').AsInteger := oPedido.Id;
      qryPedidosItensExcluir.ExecSQL;
    end
    else
    begin
      oPedido.DataEmissao := Now;
      qryPedidosGravar.ParamByName('cliente').AsInteger := oPedido.Cliente.Id;
      qryPedidosGravar.ParamByName('valortotal').AsFloat := oPedido.Total;
      qryPedidosGravar.ParamByName('emissao').AsDateTime := oPedido.DataEmissao;
      qryPedidosGravar.ExecSQL;
      oPedido.Id := dmCon1.LastID('id');
    end;

    for lProduto in oPedido.Produtos do
    begin
      qryPedidosItensGravar.ParamByName('numeropedido').AsInteger := oPedido.Id;
      qryPedidosItensGravar.ParamByName('produto').AsInteger := lProduto.Codigo;
      qryPedidosItensGravar.ParamByName('quantidade').AsInteger := lProduto.Quantidade;
      qryPedidosItensGravar.ParamByName('valorunitario').AsFloat := lProduto.Preco;
      qryPedidosItensGravar.ParamByName('valortotal').AsFloat := lProduto.Total;
      qryPedidosItensGravar.ExecSQL;
    end;
    persistentConexao.dmCon1.transa1.Commit;
  except
    persistentConexao.dmCon1.transa1.Rollback;
    raise;
  end;
end;

end.
