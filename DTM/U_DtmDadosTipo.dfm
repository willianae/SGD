inherited DtmDadosTipo: TDtmDadosTipo
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  inherited cdsPesquisa: TClientDataSet
    IndexDefs = <
      item
        Name = 'CODIGO'
        Fields = 'CODIGO'
      end
      item
        Name = 'DESCRICAO'
        Fields = 'DESCRICAO'
      end>
    IndexFieldNames = 'CODIGO'
    StoreDefs = True
    object cdsPesquisacodigo: TLargeintField
      FieldName = 'codigo'
    end
    object cdsPesquisadescricao: TStringField
      FieldName = 'descricao'
      Size = 50
    end
  end
  inherited QryPesquisa: TADOQuery
    SQL.Strings = (
      'select * from Tipo')
  end
end
