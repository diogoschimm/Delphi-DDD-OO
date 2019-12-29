program Cadastros;

uses
  Vcl.Forms,
  uFormInicial in 'uFormInicial.pas' {frmCadastros},
  uFormClientes in 'uFormClientes.pas' {frmClientes},
  uCliente in 'Domain\Entities\uCliente.pas',
  uEntidadeBase in 'Domain\Entities\Base\uEntidadeBase.pas',
  uNotification in 'Validations\uNotification.pas',
  uIClienteRepository in 'Domain\Interfaces\Repositories\uIClienteRepository.pas',
  uIRepositoryBase in 'Domain\Interfaces\Repositories\Base\uIRepositoryBase.pas',
  uRepositoryBase in 'Infra\Infra.Data\Repositories\Base\uRepositoryBase.pas',
  uClienteRepository in 'Infra\Infra.Data\Repositories\uClienteRepository.pas',
  uProjetoContext in 'Infra\Infra.Data\Context\uProjetoContext.pas',
  uDbContext in 'Orm\uDbContext.pas',
  uDbSet in 'Orm\uDbSet.pas',
  uAtributo in 'Orm\uAtributo.pas',
  uIServiceBase in 'Domain\Interfaces\Services\Base\uIServiceBase.pas',
  uIClienteService in 'Domain\Interfaces\Services\uIClienteService.pas',
  uClienteService in 'Domain\Services\uClienteService.pas',
  uMensagem in 'Common\uMensagem.pas',
  uListHelper in 'Common\uListHelper.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCadastros, frmCadastros);
  Application.Run;
end.
