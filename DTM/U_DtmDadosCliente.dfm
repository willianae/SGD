inherited DtmDadosCliente: TDtmDadosCliente
  OldCreateOrder = True
  inherited cdsPesquisa: TClientDataSet
    OnCalcFields = cdsPesquisaCalcFields
    object cdsPesquisacodigo: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
    end
    object cdsPesquisanome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 80
    end
    object cdsPesquisacpf_cnpj: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'cpf_cnpj'
      Size = 16
    end
    object cdsPesquisacnh: TStringField
      DisplayLabel = 'CNH'
      FieldName = 'cnh'
    end
    object cdsPesquisarg: TStringField
      DisplayLabel = 'RG'
      FieldName = 'rg'
    end
    object cdsPesquisalogradouro: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'logradouro'
      Size = 80
    end
    object cdsPesquisanumero: TStringField
      DisplayLabel = 'N'#186
      FieldName = 'numero'
      Size = 10
    end
    object cdsPesquisacidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 80
    end
    object cdsPesquisabairro: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 80
    end
    object cdsPesquisauf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      Size = 2
    end
    object cdsPesquisacep: TStringField
      DisplayLabel = 'Cep'
      FieldName = 'cep'
      Size = 10
    end
    object cdsPesquisatelefone_fixo: TStringField
      DisplayLabel = 'Telefone Fixo'
      FieldName = 'telefone_fixo'
      Size = 11
    end
    object cdsPesquisatelefone_celular: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'telefone_celular'
      Size = 11
    end
    object cdsPesquisaemail: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'email'
      Size = 80
    end
    object cdsPesquisacpf_cnpj_formatado: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldKind = fkCalculated
      FieldName = 'cpf_cnpj_formatado'
      Calculated = True
    end
    object cdsPesquisacod_tipo_cliente: TIntegerField
      FieldName = 'cod_tipo_cliente'
    end
  end
  inherited QryPesquisa: TADOQuery
    SQL.Strings = (
      'select * from cliente')
  end
end
