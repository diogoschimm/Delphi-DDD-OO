unit uDbContext;

interface


type
  DbContext = class
  public
    function Add<TEntity>(entidade: TEntity): TEntity;
    function Update<TEntity>(entidde: TEntity): TEntity;
    function Remove<TEntity>(entidade: TEntity): TEntity;
    function SaveChanges(): Boolean;
  end;

implementation



function DbContext.Add<TEntity>(entidade: TEntity): TEntity;
begin
   // Adicionar para ser salvo
end;

function DbContext.Remove<TEntity>(entidade: TEntity): TEntity;
begin
  // Adicionar para ser removido
end;

function DbContext.SaveChanges: Boolean;
begin
  // commitar no banco (ir no banco)
end;

function DbContext.Update<TEntity>(entidde: TEntity): TEntity;
begin
  // Adicionar para ser atualizado
end;

end.
