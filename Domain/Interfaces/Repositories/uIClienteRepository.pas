unit uIClienteRepository;

interface

uses
  uIRepositoryBase, uCliente, System.Generics.Collections, uDbSet;

type
  IClienteRepository = interface(IRepositoryBase<Cliente>)
    function GetById(idCliente: Integer): Cliente;
    function GetAll(): IDbSet<Cliente>;
  end;

implementation

end.
