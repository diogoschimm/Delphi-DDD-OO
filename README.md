# Delphi-DDD-OO
Projeto com código em exemplo do Object Pascal (Delphi) Abordagem DDD

## Classe Entidade Base

```delphi

unit uEntidadeBase;

interface

uses
  uNotification, System.Generics.Collections;

type
  EntidadeBase = class
  private
    _notifications: TList<Notification>;
    function PossuiNotificacao: Boolean;
    function NaoPossuiNotificacao: Boolean;
  public
    constructor Create();
    destructor Destroy(); override;
    procedure AddNotification(notificacao: Notification);
    property Valid: Boolean read NaoPossuiNotificacao;
    property Invalid: Boolean read PossuiNotificacao;
    property Notifications: TList<Notification> read _notifications;
  end;

implementation

{ EntidadeBase }

procedure EntidadeBase.AddNotification(notificacao: Notification);
begin
   _notifications.Add(notificacao);
end;

constructor EntidadeBase.Create;
begin
  _notifications := TList<Notification>.Create();
end;

destructor EntidadeBase.Destroy;
begin
  while _notifications.Count > 0 do
  begin
    _notifications.Items[0].Free();
    _notifications.Delete(0);
  end;

  _notifications.Free();
  inherited;
end;

function EntidadeBase.NaoPossuiNotificacao: Boolean;
begin
  result := _notifications.Count = 0;
end;

function EntidadeBase.PossuiNotificacao: Boolean;
begin
  result := _notifications.Count > 0;
end;

end.

```
## Classe Cliente

```delphi

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

```

## Classe Service do Cliente

```delphi

unit uClienteService;

interface

uses
  uIClienteService,
  uCliente,
  System.Generics.Collections,
  uIClienteRepository, uDbSet;

type
  ClienteService = class(TInterfacedObject, IClienteService)
  private
    _clienteRepository: IClienteRepository;
    function Save(entidade: Cliente): Cliente;
    function Update(entidade: Cliente): Cliente;
    function Delete(entidade: Cliente): Cliente;
    function GetAll: IDbSet<Cliente>;
    function GetById(idCliente: Integer): Cliente;
  public
    constructor Create(clienteRepository: IClienteRepository);
  end;

implementation

uses
  uNotification, System.SysUtils;

constructor ClienteService.Create(clienteRepository: IClienteRepository);
begin
  _clienteRepository := clienteRepository;
end;

function ClienteService.Save(entidade: Cliente): Cliente;
var
  clienteResult: Cliente;
begin

  Result := entidade;
  if not entidade.Validar() then
    exit;

  clienteResult := _clienteRepository.GetAll().Where(
    function(c: Cliente): Boolean
    begin
      Result := c.NomeCliente = entidade.NomeCliente
    end).FirstOrDefault();

  if Assigned(clienteResult) then
  begin
    entidade.AddNotification(Notification.Create('Nome do Cliente', 'Já existe um cliente com esse nome'));
  end;

  if entidade.Valid then
    _clienteRepository.Save(entidade);

end;

function ClienteService.Update(entidade: Cliente): Cliente;
var
  clienteResult: Cliente;
begin
  Result := entidade;
  if not entidade.Validar() then
    exit;

  clienteResult := _clienteRepository.GetAll().Where(
    function(c: Cliente): Boolean
    begin
      Result := (c.NomeCliente = entidade.NomeCliente) And (c.idCliente <> entidade.idCliente)
    end).FirstOrDefault();


  if Assigned(clienteResult) then
  begin
    entidade.AddNotification(Notification.Create('Nome do Cliente', 'Já existe um cliente com esse nome'));
  end;

  if entidade.Valid then
    _clienteRepository.Update(entidade);

end;

function ClienteService.Delete(entidade: Cliente): Cliente;
begin
  Result := entidade;
  _clienteRepository.Delete(entidade);
end;

function ClienteService.GetAll: IDbSet<Cliente>;
begin
  Result := _clienteRepository.GetAll();
end;

function ClienteService.GetById(idCliente: Integer): Cliente;
begin
  Result := _clienteRepository.GetById(idCliente);
end;

end.

````
