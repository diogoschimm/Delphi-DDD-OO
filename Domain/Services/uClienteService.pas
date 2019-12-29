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
