unit uClienteRepository;

interface

uses
  uRepositoryBase, uCliente, uIClienteRepository, System.Generics.Collections,
  uDbSet;

type
  ClienteRepository = class(RepositoryBase<Cliente>, IClienteRepository)
  private
    function GetById(idCliente: Integer): Cliente;
    function GetAll(): IDbSet<Cliente>;
  end;

implementation

function ClienteRepository.GetAll: IDbSet<Cliente>;
begin
  Result := _contexto.Clientes;
end;

function ClienteRepository.GetById(idCliente: Integer): Cliente;
begin
  Result := _contexto.Clientes.Where(
      function(c: Cliente) : Boolean
      begin
        Result := c.IdCliente = idCliente;
      end
  ).FirstOrDefault();
end;

end.
