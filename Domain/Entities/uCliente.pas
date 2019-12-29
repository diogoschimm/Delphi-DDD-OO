unit uCliente;

interface

uses
  uEntidadeBase, uNotification;

type
  Cliente = class(EntidadeBase)
  private
    _idCliente: Integer;
    _nomeCliente: String;
    _dataNascimento: TDateTime;
  public
    constructor Create();
    function Validar(): Boolean;

    property IdCliente: Integer read _idCliente write _idCliente;
    property NomeCliente: String read _nomeCliente write _nomeCliente;
    property DataNascimento: TDateTime read _dataNascimento write _dataNascimento;
  end;

implementation

constructor Cliente.Create;
begin
  _idCliente := 0;
  _nomeCliente := '';
  _dataNascimento := 0;
end;

function Cliente.Validar: Boolean;
begin
  if NomeCliente = '' then
    AddNotification(Notification.Create('Nome do Cliente', 'Nome do Cliente é obrigatório'));

  if DataNascimento = 0 then
    AddNotification(Notification.Create('Data de Nascimento', 'Data de Nascimento ínválida'));

  Result := Valid;
end;

end.
