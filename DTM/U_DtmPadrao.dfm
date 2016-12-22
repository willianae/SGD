object DtmPadrao: TDtmPadrao
  OldCreateOrder = False
  Height = 226
  Width = 331
  object QryAux: TADOQuery
    Connection = DtmConexao.AdoConn
    Parameters = <>
    Left = 208
    Top = 32
  end
  object cdsPesquisa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisa'
    Left = 40
    Top = 112
  end
  object dsPesquisa: TDataSource
    DataSet = cdsPesquisa
    Left = 112
    Top = 112
  end
  object QryPesquisa: TADOQuery
    Connection = DtmConexao.AdoConn
    CursorType = ctStatic
    Parameters = <>
    Left = 184
    Top = 112
  end
  object dspPesquisa: TDataSetProvider
    DataSet = QryPesquisa
    Left = 256
    Top = 112
  end
end
