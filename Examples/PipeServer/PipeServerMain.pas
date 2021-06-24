{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

Author:       François PIETTE @ OverByte
Creation:     Apr 04, 2013
Description:  Demo application for Russell Libby TPipeServer component
              See blog article at http://francois-piette.blogspot.be
Version:      1.00
History:


 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
unit PipeServerMain;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, StdCtrls,
    Controls, Forms, Dialogs, Pipes;

type
    TPipeServerForm = class(TForm)
        Memo1: TMemo;
        Edit1: TEdit;
        BroadcastButton: TButton;
        PipeServer1: TPipeServer;
        procedure FormCreate(Sender: TObject);
        procedure BroadcastButtonClick(Sender: TObject);
        procedure PipeServer1PipeMessage(Sender : TObject;
                                         Pipe   : HPIPE;
                                         Stream : TStream);
        procedure PipeServer1PipeConnect(Sender: TObject; Pipe: HPIPE);
        procedure PipeServer1PipeDisconnect(Sender: TObject; Pipe: HPIPE);
    private
        procedure BroadcastMessage(const Msg: String);
    end;

var
    PipeServerForm: TPipeServerForm;

implementation

{$R *.dfm}

procedure TPipeServerForm.BroadcastMessage(const Msg : String);
begin
    if Length(Msg) <= 0 then
        Exit;
    if not PipeServer1.Broadcast(PChar(Msg)^, Length(Msg) * SizeOf(Char)) then
        Memo1.Lines.Add('Broadcast failed');
end;

procedure TPipeServerForm.BroadcastButtonClick(Sender: TObject);
begin
    BroadcastMessage(Edit1.Text);
end;

procedure TPipeServerForm.FormCreate(Sender: TObject);
begin
    PipeServer1.Active := TRUE;
    Memo1.Lines.Add('Pipe server started');
end;

procedure TPipeServerForm.PipeServer1PipeConnect(
    Sender : TObject;
    Pipe   : HPIPE);
begin
    Memo1.Lines.Add('Client connected ' + IntToStr(Pipe));
end;

procedure TPipeServerForm.PipeServer1PipeDisconnect(
    Sender : TObject;
    Pipe   : HPIPE);
begin
    Memo1.Lines.Add('Client disconnected ' + IntToStr(Pipe));
end;

procedure TPipeServerForm.PipeServer1PipeMessage(
    Sender : TObject;
    Pipe   : HPIPE;
    Stream : TStream);
var
    Msg : String;
begin
    SetLength(Msg, Stream.Size div SizeOf(Char));
    Stream.Position := 0;
    Stream.Read(Msg[1], Stream.Size);
    Memo1.Lines.Add('Rcvd: "' + Msg + '" ' + IntToStr(Pipe));
end;

end.
