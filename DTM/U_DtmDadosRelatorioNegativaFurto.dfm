inherited DtmDadosRelatorioNegativaFurto: TDtmDadosRelatorioNegativaFurto
  OldCreateOrder = True
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisa'
    Left = 40
    Top = 168
  end
  object dsEmpresa: TDataSource
    DataSet = cdsEmpresa
    Left = 112
    Top = 168
  end
  object qryEmpresa: TADOQuery
    Connection = DtmConexao.AdoConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 184
    Top = 168
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qryEmpresa
    Left = 256
    Top = 168
  end
end
