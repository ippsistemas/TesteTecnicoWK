unit persistentConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait, FireDAC.Comp.Client, Data.DB,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.UI;

type
  TdmCon1 = class(TDataModule)
    conexao1: TFDConnection;
    transa1: TFDTransaction;
    waitCursor: TFDGUIxWaitCursor;
  public
    function LastID(const aName: string): Integer;
  end;

var
  dmCon1: TdmCon1;

implementation

{$R *.dfm}

{ TdmConexao }


function TdmCon1.LastID(const aName: string): Integer;
begin
  Result := conexao1.GetLastAutoGenValue(aName);
end;

end.
