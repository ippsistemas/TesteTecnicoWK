object dmPedido: TdmPedido
  OldCreateOrder = False
  Height = 254
  Width = 526
  object qryPedidosPesquisar: TFDQuery
    AutoCalcFields = False
    Connection = dmCon1.conexao1
    SQL.Strings = (
      'SELECT p.numero, p.emissao, p.cliente, c.nome, c.cidade, c.uf '
      '  FROM pedidos p'
      '  LEFT JOIN clientes c ON c.id = p.cliente '
      'WHERE p.numero = :numero')
    Left = 63
    Top = 24
    ParamData = <
      item
        Name = 'NUMERO'
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryPedidosGravar: TFDQuery
    Connection = dmCon1.conexao1
    SQL.Strings = (
      
        'INSERT INTO pedidos (cliente, valortotal, emissao) VALUES (:clie' +
        'nte, :valortotal, :emissao)')
    Left = 207
    Top = 32
    ParamData = <
      item
        Name = 'CLIENTE'
        ParamType = ptInput
      end
      item
        Name = 'VALORTOTAL'
        ParamType = ptInput
      end
      item
        Name = 'EMISSAO'
        ParamType = ptInput
      end>
  end
  object qryPedidosAlterar: TFDQuery
    Connection = dmCon1.conexao1
    SQL.Strings = (
      'select * from clientes')
    Left = 351
    Top = 32
  end
  object qryPedidosItensExcluir: TFDQuery
    Connection = dmCon1.conexao1
    SQL.Strings = (
      'delete from pedidosprodutos where numeropedido = :numero')
    Left = 351
    Top = 104
    ParamData = <
      item
        Name = 'NUMERO'
        ParamType = ptInput
      end>
  end
  object qryPedidosItensGravar: TFDQuery
    Connection = dmCon1.conexao1
    SQL.Strings = (
      
        'INSERT INTO pedidosprodutos (numeropedido, produto, quantidade, ' +
        'valorunitario, valortotal) VALUES (:numeropedido, :produto, :qua' +
        'ntidade, :valorunitario, :valortotal)')
    Left = 207
    Top = 96
    ParamData = <
      item
        Name = 'NUMEROPEDIDO'
        ParamType = ptInput
      end
      item
        Name = 'PRODUTO'
        ParamType = ptInput
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALORUNITARIO'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'VALORTOTAL'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryPedidosItensPesquisar: TFDQuery
    Connection = dmCon1.conexao1
    SQL.Strings = (
      
        'SELECT pp.numeropedido, pp.produto, p.descricao, pp.quantidade, ' +
        'pp.valorunitario '
      '  FROM pedidosprodutos pp'
      '  LEFT JOIN produtos p ON p.codigo = pp.produto'
      ' WHERE pp.numeropedido = :numero')
    Left = 63
    Top = 88
    ParamData = <
      item
        Name = 'NUMERO'
        ParamType = ptInput
      end>
  end
end
