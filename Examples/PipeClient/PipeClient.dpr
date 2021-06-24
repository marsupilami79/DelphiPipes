program PipeClient;

uses
  Forms,
  PipeClientMain in 'PipeClientMain.pas' {PipeClientForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPipeClientForm, PipeClientForm);
  Application.Run;
end.
