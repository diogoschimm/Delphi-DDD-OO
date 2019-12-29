unit uFormClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmClientes = class(TForm)
    edtIdCliente: TEdit;
    edtNomeCliente: TEdit;
    edtDataNascimento: TEdit;
    btnSalvar: TButton;
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uIClienteService, uCliente, uNotification, uMensagem, uClienteService;

{$R *.dfm}

procedure TfrmClientes.btnSalvarClick(Sender: TObject);
var
  _clienteService: IClienteService;
  _cliente: Cliente;
  notificacao: uNotification.Notification;
begin

  _cliente := Cliente.Create();
  _cliente.NomeCliente := edtNomeCliente.Text;
  _cliente.DataNascimento := StrToDateTime(edtDataNascimento.Text);

  _clienteService := ClienteService.Create();
  _clienteService.Save(_cliente);

  if _cliente.Valid then
    MsgSucesso('Cliente salvo com sucesso')
  else
     for notificacao in _cliente.Notifications do
     begin
       MsgExclamacao(notificacao.Mensagem);
     end;

end;

end.
