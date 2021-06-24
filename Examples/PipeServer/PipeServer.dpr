program PipeServer;

uses
  Forms,
  PipeServerMain in 'PipeServerMain.pas' {PipeServerForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPipeServerForm, PipeServerForm);
  Application.Run;
end.
