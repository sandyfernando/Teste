object FPedidoVendaView: TFPedidoVendaView
  Left = 0
  Top = 0
  Caption = 'Pedido de Venda'
  ClientHeight = 366
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 54
    Width = 788
    Height = 262
    Align = alClient
    BevelKind = bkSoft
    BevelOuter = bvNone
    Caption = 'PnlClient'
    TabOrder = 0
    object GdPedidoItem: TDBGrid
      AlignWithMargins = True
      Left = 3
      Top = 54
      Width = 778
      Height = 150
      Align = alClient
      DataSource = DsPedidoItem
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = GdPedidoItemKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'SEQ'
          Title.Caption = 'Seq'
          Width = 26
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FKPRODUTO'
          Title.Caption = 'C'#243'digo Produto '
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAOPRODUTO'
          Title.Caption = 'Descri'#231#227'o Produto'
          Width = 423
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Caption = 'Qtde.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLUNITARIO'
          Title.Caption = 'Vlr. Unit'#225'rio'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLTOTAL'
          Title.Caption = 'Vlr Total'
          Width = 91
          Visible = True
        end>
    end
    object GdPnlRodaPe: TGridPanel
      AlignWithMargins = True
      Left = 3
      Top = 210
      Width = 778
      Height = 45
      Align = alBottom
      BevelKind = bkSoft
      BevelOuter = bvNone
      Caption = 'GdPnl'
      ColumnCollection = <
        item
          Value = 100.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 120.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = PnlVazio
          Row = 0
        end
        item
          Column = 1
          Control = PnlTotalPedido
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      ShowCaption = False
      TabOrder = 1
      object PnlVazio: TPanel
        Left = 0
        Top = 0
        Width = 654
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PnlVazio'
        ShowCaption = False
        TabOrder = 0
      end
      object PnlTotalPedido: TPanel
        Left = 654
        Top = 0
        Width = 120
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PnlTotalPedido'
        ShowCaption = False
        TabOrder = 1
        object Label6: TLabel
          Left = 0
          Top = 0
          Width = 120
          Height = 13
          Align = alTop
          Caption = 'Total Pedido'
          ExplicitWidth = 59
        end
        object EdtValorPedido: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 16
          Width = 114
          Height = 22
          Align = alClient
          TabOrder = 0
          ExplicitHeight = 21
        end
      end
    end
    object GdPnlProduto: TGridPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 778
      Height = 45
      Align = alTop
      BevelKind = bkSoft
      BevelOuter = bvNone
      Caption = 'GdPnl'
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 30.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 120.000000000000000000
        end
        item
          Value = 100.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 120.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 120.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 60.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = PnlCdCliente
          Row = 0
        end
        item
          Column = 1
          Control = PnlDesCliente
          Row = 0
        end
        item
          Column = 2
          Control = Panel8
          Row = 0
        end
        item
          Column = 3
          Control = PnlUF
          Row = 0
        end
        item
          Column = 4
          Control = PnlIncluirItem
          Row = 0
        end
        item
          Column = 5
          Control = Panel6
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      ShowCaption = False
      TabOrder = 2
      object PnlCdCliente: TPanel
        Left = 0
        Top = 0
        Width = 30
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PnlCdCliente'
        ShowCaption = False
        TabOrder = 0
        object Label10: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 24
          Height = 13
          Margins.Top = 0
          Margins.Bottom = 1
          Align = alTop
          Caption = 'Seq.'
          ExplicitWidth = 22
        end
        object EdtSeq: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 17
          Width = 24
          Height = 21
          Align = alClient
          Enabled = False
          TabOrder = 0
          Text = '0'
        end
      end
      object PnlDesCliente: TPanel
        Left = 30
        Top = 0
        Width = 120
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PnlDesCliente'
        ShowCaption = False
        TabOrder = 1
        object Label1: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 114
          Height = 13
          Margins.Top = 0
          Margins.Bottom = 1
          Align = alTop
          Caption = 'Porduto'
          ExplicitWidth = 38
        end
        object EdtCdProduto: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 17
          Width = 114
          Height = 21
          Align = alClient
          TabOrder = 0
          OnExit = EdtCdProdutoExit
        end
      end
      object Panel8: TPanel
        Left = 150
        Top = 0
        Width = 324
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel8'
        ShowCaption = False
        TabOrder = 2
        object Label2: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 318
          Height = 13
          Margins.Top = 0
          Margins.Bottom = 1
          Align = alTop
          ExplicitWidth = 3
        end
        object EdtDesProduto: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 17
          Width = 318
          Height = 21
          Align = alClient
          Enabled = False
          TabOrder = 0
        end
      end
      object PnlUF: TPanel
        Left = 474
        Top = 0
        Width = 120
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PnlUF'
        ShowCaption = False
        TabOrder = 3
        object Label3: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 114
          Height = 13
          Margins.Top = 0
          Margins.Bottom = 1
          Align = alTop
          Caption = 'Qtde.'
          ExplicitWidth = 28
        end
        object EdtQtde: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 17
          Width = 114
          Height = 21
          Align = alClient
          TabOrder = 0
        end
      end
      object PnlIncluirItem: TPanel
        Left = 594
        Top = 0
        Width = 120
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PnlIncluirItem'
        ShowCaption = False
        TabOrder = 4
        object Label4: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 114
          Height = 13
          Margins.Top = 0
          Margins.Bottom = 1
          Align = alTop
          Caption = 'Valor'
          ExplicitWidth = 24
        end
        object EdtValorProduto: TEdit
          AlignWithMargins = True
          Left = 3
          Top = 17
          Width = 114
          Height = 21
          Align = alClient
          TabOrder = 0
        end
      end
      object Panel6: TPanel
        Left = 714
        Top = 0
        Width = 60
        Height = 41
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel6'
        ShowCaption = False
        TabOrder = 5
        object BtnIncluir: TButton
          Left = 0
          Top = 0
          Width = 60
          Height = 41
          Align = alClient
          Caption = 'Incluir'
          TabOrder = 0
          OnClick = BtnIncluirClick
        end
      end
    end
  end
  object GdPnl: TGridPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 788
    Height = 45
    Align = alTop
    BevelKind = bkSoft
    BevelOuter = bvNone
    Caption = 'GdPnl'
    ColumnCollection = <
      item
        SizeStyle = ssAbsolute
        Value = 120.000000000000000000
      end
      item
        Value = 100.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 120.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 60.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = Panel2
        Row = 0
      end
      item
        Column = 1
        Control = Panel3
        Row = 0
      end
      item
        Column = 2
        Control = Panel4
        Row = 0
      end
      item
        Column = 3
        Control = Panel5
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    ShowCaption = False
    TabOrder = 1
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 120
      Height = 41
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel2'
      ShowCaption = False
      TabOrder = 0
      object Label5: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 114
        Height = 13
        Margins.Top = 0
        Margins.Bottom = 1
        Align = alTop
        Caption = 'Cliente'
        ExplicitWidth = 33
      end
      object EdtCdCliente: TEdit
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 114
        Height = 21
        Align = alClient
        TabOrder = 0
        OnExit = EdtCdClienteExit
      end
    end
    object Panel3: TPanel
      Left = 120
      Top = 0
      Width = 484
      Height = 41
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel3'
      ShowCaption = False
      TabOrder = 1
      object Label7: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 478
        Height = 13
        Margins.Top = 0
        Margins.Bottom = 1
        Align = alTop
        ExplicitWidth = 3
      end
      object EdtDesCliente: TEdit
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 478
        Height = 21
        Align = alClient
        Enabled = False
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 604
      Top = 0
      Width = 120
      Height = 41
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel4'
      ShowCaption = False
      TabOrder = 2
      object Label8: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 114
        Height = 13
        Margins.Top = 0
        Margins.Bottom = 1
        Align = alTop
        Caption = 'Cidade'
        ExplicitWidth = 33
      end
      object EdtCidade: TEdit
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 114
        Height = 21
        Align = alClient
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 724
      Top = 0
      Width = 60
      Height = 41
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel5'
      ShowCaption = False
      TabOrder = 3
      object Label9: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 54
        Height = 13
        Margins.Top = 0
        Margins.Bottom = 1
        Align = alTop
        Caption = 'UF'
        ExplicitWidth = 13
      end
      object EdtUF: TEdit
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 54
        Height = 21
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object GdPnlSalvar: TGridPanel
    AlignWithMargins = True
    Left = 3
    Top = 322
    Width = 788
    Height = 41
    Align = alBottom
    BevelKind = bkSoft
    BevelOuter = bvNone
    Caption = 'GdPnlSalvar'
    ColumnCollection = <
      item
        Value = 100.000000000000000000
      end
      item
        SizeStyle = ssAbsolute
        Value = 140.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = Panel7
        Row = 0
      end
      item
        Column = 1
        Control = Panel9
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    ShowCaption = False
    TabOrder = 2
    object Panel7: TPanel
      Left = 0
      Top = 0
      Width = 644
      Height = 37
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel7'
      ShowCaption = False
      TabOrder = 0
    end
    object Panel9: TPanel
      Left = 644
      Top = 0
      Width = 140
      Height = 37
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel9'
      ShowCaption = False
      TabOrder = 1
      object BtnSalvar: TButton
        Left = 0
        Top = 0
        Width = 140
        Height = 37
        Align = alClient
        Caption = 'Salvar'
        TabOrder = 0
        OnClick = BtnSalvarClick
      end
    end
  end
  object DsPedidoItem: TDataSource
    DataSet = MemTabPedidoItem
    Left = 203
    Top = 202
  end
  object MemTabProduto: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 539
    Top = 174
  end
  object MemTabCliente: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 563
    Top = 246
  end
  object MemTabPedidoItem: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 643
    Top = 174
  end
end
