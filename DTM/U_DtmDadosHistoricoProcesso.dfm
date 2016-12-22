inherited DtmDadosHistoricoProcesso: TDtmDadosHistoricoProcesso
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  inherited cdsPesquisa: TClientDataSet
    object cdsPesquisaplaca: TStringField
      FieldName = 'placa'
      ReadOnly = True
      Size = 15
    end
    object cdsPesquisacliente: TStringField
      FieldName = 'cliente'
      ReadOnly = True
      Size = 80
    end
    object cdsPesquisaprocesso_antigo: TStringField
      FieldName = 'processo_antigo'
      ReadOnly = True
      Size = 50
    end
    object cdsPesquisaprocesso_atual: TStringField
      FieldName = 'processo_atual'
      ReadOnly = True
      Size = 50
    end
    object cdsPesquisausuario: TStringField
      FieldName = 'usuario'
      ReadOnly = True
      Size = 60
    end
    object cdsPesquisadata_mudanca: TStringField
      FieldName = 'data_mudanca'
      ReadOnly = True
      Size = 8190
    end
  end
end
