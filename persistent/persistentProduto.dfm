object dmProduto: TdmProduto
  OldCreateOrder = False
  Height = 189
  Width = 294
  object qryProdutosPesquisar: TFDQuery
    Connection = dmCon1.conexao1
    SQL.Strings = (
      'select * from produtos where Codigo = :codigo')
    Left = 63
    Top = 32
    ParamData = <
      item
        Name = 'CODIGO'
        ParamType = ptInput
        Value = Null
      end>
  end
end
