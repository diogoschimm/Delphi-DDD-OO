unit uDbSet;

interface

uses
  System.Generics.Collections, System.SysUtils;

type

  IDbSet<T: Class> = interface
    procedure add(p: T);
    function Where(expressao: TPredicate<T>): IDbSet<T>;
    function FirstOrDefault(): T;
  end;

  DbSet<T: Class> = class(TInterfacedObject, IDbSet<T>)
  strict private
    _lista: TList<T>;
  private
    procedure add(p: T);
    function Where(expressao: TPredicate<T>): IDbSet<T>;
    function FirstOrDefault(): T;
  public
    constructor Create();
    destructor Destroy(); override;
    class function new(): IDbSet<T>;
  end;

implementation

class function DbSet<T>.new: IDbSet<T>;
begin
  Result := Self.Create();
end;

constructor DbSet<T>.Create;
begin
  _lista := TList<T>.Create();
end;

destructor DbSet<T>.Destroy;
var
  item: T;
begin

  while _lista.Count > 0 do
  begin
    item := _lista.Items[0];
    FreeAndNil(item);
    _lista.Delete(0);
  end;

  _lista.Free();

  inherited;
end;

procedure DbSet<T>.add(p: T);
begin
  _lista.add(p);
end;

function DbSet<T>.FirstOrDefault: T;
begin
  if _lista.Count > 0 then
    Result := _lista.Items[0];
end;

function DbSet<T>.Where(expressao: TPredicate<T>): IDbSet<T>;
var
  i: Integer;
begin
  Result := DbSet<T>.new();
  for i := 0 to Pred(_lista.Count) do
  begin
    if expressao(_lista.Items[i]) then
      Result.add(_lista.Items[i])
  end;
end;

end.
