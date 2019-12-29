unit uNotification;

interface

type
  Notification = class
  private
    _propriedade: string;
    _mensagem: string;
  public
    constructor Create(propriedade: string; mensagem: string);
    property Propriedade: string read _propriedade write _propriedade;
    property Mensagem: string read _mensagem write _mensagem;
  end;

implementation

constructor Notification.Create(propriedade, mensagem: string);
begin
  _propriedade := propriedade;
  _mensagem := mensagem;
end;

end.
