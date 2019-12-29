unit uMensagem;

interface

uses
  Vcl.Forms, Winapi.Windows;

procedure MsgSucesso(pMensagem: string);
procedure MsgErro(pMensagem: string);
procedure MsgInformacao(pMensagem: string);
procedure MsgExclamacao(pMensagem: string);

implementation

procedure MsgSucesso(pMensagem: string);
begin
   Application.MessageBox(PChar(pMensagem), 'Mensagem do Sistema', MB_ICONINFORMATION + MB_OK)
end;
procedure MsgErro(pMensagem: string);
begin
   Application.MessageBox(PChar(pMensagem), 'Mensagem do Sistema', MB_ICONERROR + MB_OK)

end;
procedure MsgInformacao(pMensagem: string);
begin
   Application.MessageBox(PChar(pMensagem), 'Mensagem do Sistema', MB_ICONINFORMATION + MB_OK)

end;
procedure MsgExclamacao(pMensagem: string);
begin
   Application.MessageBox(PChar(pMensagem), 'Mensagem do Sistema', MB_ICONEXCLAMATION + MB_OK)

end;

end.
