unit uRepositoryBase;

interface

uses
  uIRepositoryBase, uProjetoContext;

type
  RepositoryBase<TEntity> = class(TInterfacedObject, IRepositoryBase<TEntity>)
  private
    function Save(entidade: TEntity): TEntity;
    function Update(entidade: TEntity): TEntity;
    function Delete(entidade: TEntity): TEntity;
  protected
     _contexto: ProjetoContext;
  public
    constructor Create(contexto: ProjetoContext);
  end;

implementation

constructor RepositoryBase<TEntity>.Create(contexto: ProjetoContext);
begin
  _contexto := contexto;
end;

function RepositoryBase<TEntity>.Delete(entidade: TEntity): TEntity;
begin
  Result := _contexto.Remove<TEntity>(entidade);
end;

function RepositoryBase<TEntity>.Save(entidade: TEntity): TEntity;
begin
  Result := _contexto.Add<TEntity>(entidade);
end;

function RepositoryBase<TEntity>.Update(entidade: TEntity): TEntity;
begin
  Result := _contexto.Update<TEntity>(entidade);
end;

end.
