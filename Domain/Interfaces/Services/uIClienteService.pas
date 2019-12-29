unit uIClienteService;

interface

uses
  uIServiceBase, uCliente, System.Generics.Collections, uDbSet;

type
  IClienteService = interface(IServiceBase<Cliente>)
    function GetById(idCliente: Integer): Cliente;
    function GetAll(): IDbSet<Cliente>;
  end;

implementation

end.
