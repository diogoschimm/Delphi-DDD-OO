object frmClientes: TfrmClientes
  Left = 0
  Top = 0
  Caption = 'Clientes'
  ClientHeight = 292
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtIdCliente: TEdit
    Left = 48
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtIdCliente'
  end
  object edtNomeCliente: TEdit
    Left = 48
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edtNomeCliente'
  end
  object edtDataNascimento: TEdit
    Left = 48
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'edtDataNascimento'
  end
  object btnSalvar: TButton
    Left = 248
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btnSalvarClick
  end
end
