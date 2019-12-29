unit uIDbContext;

interface

uses
  System.Generics.Collections;

type
  IDbContext = interface
    function Add<TEntity>(entidade: TEntity): TEntity;
    function Update<TEntity>(entidde: TEntity): TEntity;
    function Remove<TEntity>(entidade: TEntity): TEntity;
    function SaveChanges<TEntity>(): Boolean;
  end;

implementation

end.
