unit uIRepositoryBase;

interface

type
  IRepositoryBase<TEntity> = interface
    function Save(entidade: TEntity): TEntity;
    function Update(entidade: TEntity): TEntity;
    function Delete(entidade: TEntity): TEntity;
  end;

implementation

end.
