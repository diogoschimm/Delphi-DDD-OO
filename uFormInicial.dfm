object frmCadastros: TfrmCadastros
  Left = 0
  Top = 0
  Caption = 'M'#243'dulo Cadastros'
  ClientHeight = 354
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblNcNome: TLabel
    Left = 32
    Top = 37
    Width = 79
    Height = 13
    Caption = 'Nome Completo:'
  end
  object btnMostrarMensagem: TButton
    Left = 231
    Top = 91
    Width = 105
    Height = 25
    Caption = 'Exibir Mensagem'
    TabOrder = 0
    OnClick = btnMostrarMensagemClick
  end
  object edtNomeCompleto: TEdit
    Left = 32
    Top = 56
    Width = 304
    Height = 21
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 312
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
    end
    object Configuraes1: TMenuItem
      Caption = 'Configura'#231#245'es'
      object DadosdaEmpresa1: TMenuItem
        Caption = 'Dados da Empresa'
      end
      object Filiais1: TMenuItem
        Caption = 'Filiais'
      end
    end
  end
end
