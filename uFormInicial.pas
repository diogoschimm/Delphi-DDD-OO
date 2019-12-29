unit uFormInicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uFormClientes, Vcl.StdCtrls;

type
  TfrmCadastros = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Configuraes1: TMenuItem;
    Clientes1: TMenuItem;
    DadosdaEmpresa1: TMenuItem;
    Filiais1: TMenuItem;
    btnMostrarMensagem: TButton;
    edtNomeCompleto: TEdit;
    lblNcNome: TLabel;
    procedure Clientes1Click(Sender: TObject);
    procedure btnMostrarMensagemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastros: TfrmCadastros;
implementation

{$R *.dfm}

procedure TfrmCadastros.btnMostrarMensagemClick(Sender: TObject);
var
  seuNome: string;
begin
  // Atribuir o que o usuário digitou na váriavel seuNome
  seuNome := edtNomeCompleto.Text;

  // Mostrar uma Mensagem na tela com o Texto "Seu nome é: {variavel}"
  Application.MessageBox(PChar('Seu nome é: ' + seuNome), 'Título da Mensagem', MB_ICONEXCLAMATION + MB_YESNOCANCEL);
end;

procedure TfrmCadastros.Clientes1Click(Sender: TObject);
var
  // Criar uma váriavel fClientes do Tipo TfrmClientes ** Lembrar do uses da Unit lá em cima
  fClientes: TfrmClientes;
begin

  // Inicializa a Variavel
  fClientes := nil;

  try
    // Cria a instância do fClientes
    fClientes := TfrmClientes.Create(self);

    // Chama o metodo ShowModal
    fClientes.ShowModal();

  finally

    // Verificar se a variavel está preenchida
    if Assigned(fClientes) then

      // Remove o Formulário da Memória
      fClientes.Free();

  end;

end;

end.
