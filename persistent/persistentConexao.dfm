object dmCon1: TdmCon1
  OldCreateOrder = False
  Height = 196
  Width = 390
  object conexao1: TFDConnection
    Params.Strings = (
      'Database=wkvendas'
      'User_Name=root'
      'CharacterSet=utf8'
      'DriverID=MySQL')
    LoginPrompt = False
    Transaction = transa1
    Left = 48
    Top = 16
  end
  object transa1: TFDTransaction
    Connection = conexao1
    Left = 144
    Top = 16
  end
  object waitCursor: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 232
    Top = 16
  end
end
