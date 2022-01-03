program ipp;
uses
  System.StartUpCopy,
  FMX.Forms,
  formPrincipal in 'forms\formPrincipal.pas' {frmVendas},
  logicCliente in 'logic\logicCliente.pas',
  logicProduto in 'logic\logicProduto.pas',
  logicPedido in 'logic\logicPedido.pas',
  persistentCliente in 'persistent\persistentCliente.pas' {dmCliente: TDataModule},
  persistentConexao in 'persistent\persistentConexao.pas' {dmCon1: TDataModule},
  persistentPedido in 'persistent\persistentPedido.pas' {dmPedidos: TDataModule},
  persistentProduto in 'persistent\persistentProduto.pas' {dmProduto: TDataModule};

{$R *.res}
begin
  Application.Initialize;
  Application.CreateForm(TfrmVendas, frmVendas);
  Application.CreateForm(TdmCliente, dmCliente);
  Application.CreateForm(TdmCon1, dmCon1);
  Application.CreateForm(TdmPedido, dmPedido);
  Application.CreateForm(TdmProduto, dmProduto);
  application.Run;
end.
