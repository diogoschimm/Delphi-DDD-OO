unit uEntidadeBase;

interface

uses
  uNotification, System.Generics.Collections;

type
  EntidadeBase = class
  private
    _notifications: TList<Notification>;
    function PossuiNotificacao: Boolean;
    function NaoPossuiNotificacao: Boolean;
  public
    constructor Create();
    destructor Destroy(); override;
    procedure AddNotification(notificacao: Notification);
    property Valid: Boolean read NaoPossuiNotificacao;
    property Invalid: Boolean read PossuiNotificacao;
    property Notifications: TList<Notification> read _notifications;
  end;

implementation

{ EntidadeBase }

procedure EntidadeBase.AddNotification(notificacao: Notification);
begin
   _notifications.Add(notificacao);
end;

constructor EntidadeBase.Create;
begin
  _notifications := TList<Notification>.Create();
end;

destructor EntidadeBase.Destroy;
begin
  while _notifications.Count > 0 do
  begin
    _notifications.Items[0].Free();
    _notifications.Delete(0);
  end;

  _notifications.Free();
  inherited;
end;

function EntidadeBase.NaoPossuiNotificacao: Boolean;
begin
  result := _notifications.Count = 0;
end;

function EntidadeBase.PossuiNotificacao: Boolean;
begin
  result := _notifications.Count > 0;
end;

end.
