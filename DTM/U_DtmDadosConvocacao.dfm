inherited DtmDadosConvocacao: TDtmDadosConvocacao
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 247
  object cdsConvocacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 75
    Top = 26
    object cdsConvocacaoVEICULO: TStringField
      DisplayLabel = 'Ve'#237'culo'
      FieldName = 'VEICULO'
      Size = 80
    end
    object cdsConvocacaoPLACA: TStringField
      DisplayLabel = 'Placa'
      FieldName = 'PLACA'
      Size = 8
    end
    object cdsConvocacaoUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsConvocacaoANO_MODELO: TStringField
      DisplayLabel = 'Ano/Modelo'
      FieldName = 'ANO_MODELO'
      Size = 9
    end
    object cdsConvocacaoIPVA: TStringField
      FieldName = 'IPVA'
      Size = 10
    end
    object cdsConvocacaoRESTRICAO: TStringField
      DisplayLabel = 'Restri'#231#227'o'
      FieldName = 'RESTRICAO'
      Size = 10
    end
    object cdsConvocacaoVALOR_SERVICO: TFloatField
      DisplayLabel = 'Custo Total'
      FieldName = 'VALOR_SERVICO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsConvocacaoCOD_VEICULO: TIntegerField
      FieldName = 'COD_VEICULO'
    end
    object cdsConvocacaoCOD_SEGURADORA: TIntegerField
      FieldName = 'COD_SEGURADORA'
    end
    object cdsConvocacaoNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object cdsConvocacaoSN_IPVA: TStringField
      FieldName = 'SN_IPVA'
      Size = 1
    end
    object cdsConvocacaoSN_RESTRICAO: TStringField
      FieldName = 'SN_RESTRICAO'
      Size = 1
    end
  end
end
