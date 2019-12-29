unit uProjetoContext;

interface

uses
  uDbContext, uDbSet, uCliente;

type
  ProjetoContext = class(DbContext)
  public
    Clientes: IDbSet<Cliente>;
  end;

implementation

end.
