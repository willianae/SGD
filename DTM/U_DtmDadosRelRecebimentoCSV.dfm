inherited DtmDadosRelRecebimentoCSV: TDtmDadosRelRecebimentoCSV
  inherited cdsPesquisa: TClientDataSet
    object cdsPesquisaplaca: TStringField
      FieldName = 'placa'
      Size = 15
    end
    object cdsPesquisarenavam: TStringField
      FieldName = 'renavam'
    end
    object cdsPesquisauf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object cdsPesquisamotivo: TStringField
      FieldName = 'motivo'
      ReadOnly = True
      Size = 255
    end
  end
end
