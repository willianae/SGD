inherited DtmDadosVeiculo: TDtmDadosVeiculo
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  inherited cdsPesquisa: TClientDataSet
    FieldDefs = <
      item
        Name = 'codigo'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'uf'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'numero'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'renavam'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'placa'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'chassi'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 17
      end
      item
        Name = 'ano_fabricacao'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'ano_modelo'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'motor'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'observacoes'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 250
      end
      item
        Name = 'numero_sinistro'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'cod_cliente'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'cod_tipo'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'cod_marca_modelo'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'cod_combustivel'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'cod_categoria'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'cod_cor'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'cod_processo'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'cod_usuario'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'data_emissao_crv'
        Attributes = [faReadonly]
        DataType = ftDate
      end
      item
        Name = 'data_recebimento'
        Attributes = [faReadonly]
        DataType = ftDate
      end
      item
        Name = 'flg_possui_sinistro'
        Attributes = [faReadonly, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'flg_recebeu_csv'
        Attributes = [faReadonly, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'nome_comprador'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 80
      end
      item
        Name = 'nome'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 80
      end
      item
        Name = 'cpf_cnpj'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 16
      end
      item
        Name = 'processo'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'CODIGO'
        Fields = 'CODIGO'
      end
      item
        Name = 'DESCRICAO'
        Fields = 'DESCRICAO'
      end>
    PacketRecords = 30
    StoreDefs = True
    object cdsPesquisacodigo: TLargeintField
      FieldName = 'codigo'
    end
    object cdsPesquisauf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object cdsPesquisanumero: TStringField
      FieldName = 'numero'
      Size = 30
    end
    object cdsPesquisarenavam: TStringField
      FieldName = 'renavam'
    end
    object cdsPesquisaplaca: TStringField
      FieldName = 'placa'
      Size = 15
    end
    object cdsPesquisachassi: TStringField
      FieldName = 'chassi'
      Size = 17
    end
    object cdsPesquisaano_fabricacao: TIntegerField
      FieldName = 'ano_fabricacao'
    end
    object cdsPesquisaano_modelo: TIntegerField
      FieldName = 'ano_modelo'
    end
    object cdsPesquisamotor: TStringField
      FieldName = 'motor'
      Size = 30
    end
    object cdsPesquisaobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 250
    end
    object cdsPesquisacod_cliente: TIntegerField
      FieldName = 'cod_cliente'
    end
    object cdsPesquisacod_tipo: TIntegerField
      FieldName = 'cod_tipo'
    end
    object cdsPesquisacod_marca_modelo: TIntegerField
      FieldName = 'cod_marca_modelo'
    end
    object cdsPesquisacod_combustivel: TIntegerField
      FieldName = 'cod_combustivel'
    end
    object cdsPesquisacod_categoria: TIntegerField
      FieldName = 'cod_categoria'
    end
    object cdsPesquisacod_cor: TIntegerField
      FieldName = 'cod_cor'
    end
    object cdsPesquisanome: TStringField
      FieldName = 'nome'
      ReadOnly = True
      Size = 80
    end
    object cdsPesquisacpf_cnpj: TStringField
      FieldName = 'cpf_cnpj'
      ReadOnly = True
      Size = 16
    end
    object cdsPesquisacod_processo: TIntegerField
      FieldName = 'cod_processo'
      ReadOnly = True
    end
    object cdsPesquisanumero_sinistro: TStringField
      FieldName = 'numero_sinistro'
      ReadOnly = True
      Size = 40
    end
    object cdsPesquisacod_usuario: TIntegerField
      FieldName = 'cod_usuario'
      ReadOnly = True
    end
    object cdsPesquisaprocesso: TStringField
      FieldName = 'processo'
      ReadOnly = True
      Size = 50
    end
    object cdsPesquisadata_emissao_crv: TDateField
      FieldName = 'data_emissao_crv'
      ReadOnly = True
    end
    object cdsPesquisadata_recebimento: TDateField
      FieldName = 'data_recebimento'
      ReadOnly = True
    end
    object cdsPesquisaflg_possui_sinistro: TStringField
      FieldName = 'flg_possui_sinistro'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsPesquisaflg_recebeu_csv: TStringField
      FieldName = 'flg_recebeu_csv'
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object cdsPesquisanome_comprador: TStringField
      FieldName = 'nome_comprador'
      ReadOnly = True
      Size = 80
    end
    object cdsPesquisacod_comprador: TIntegerField
      FieldName = 'cod_comprador'
    end
    object cdsPesquisacomprador: TStringField
      FieldName = 'comprador'
      Size = 80
    end
    object cdsPesquisaDOC_COMPRADOR: TStringField
      FieldName = 'DOC_COMPRADOR'
      Size = 14
    end
    object cdsPesquisaNUMERO_CONVOCACAO: TIntegerField
      FieldName = 'NUMERO_CONVOCACAO'
    end
    object cdsPesquisaDATA_CONVOCACAO: TDateField
      FieldName = 'DATA_CONVOCACAO'
    end
    object cdsPesquisaCOD_SEGURADORA: TIntegerField
      FieldName = 'COD_SEGURADORA'
    end
    object cdsPesquisaSEGURADORA: TStringField
      FieldName = 'SEGURADORA'
      Size = 60
    end
    object cdsPesquisaQTD_REGISTROS: TLargeintField
      FieldName = 'QTD_REGISTROS'
    end
  end
  inherited QryPesquisa: TADOQuery
    SQL.Strings = (
      
        'SELECT V.*, C.NOME, C.CPF_CNPJ, P.DESCRICAO PROCESSO FROM VEICUL' +
        'O V '
      'INNER JOIN CLIENTE C ON (V.COD_CLIENTE = C.CODIGO)         '
      'LEFT JOIN PROCESSO P ON (P.CODIGO = V.COD_PROCESSO)        '
      'WHERE 1 = 1                                                ')
  end
end
