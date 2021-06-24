{* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

Author:       François PIETTE @ OverByte
Creation:     Apr 04, 2013
Description:  Demo application for Russell Libby TPipeClient component
              See blog article at http://francois-piette.blogspot.be
Version:      1.00
History:


 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *}
unit PipeClientMain;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, StdCtrls,
    Controls, Forms, Dialogs, Pipes;

type
    TPipeClientForm = class(TForm)
        Button1: TButton;
        Memo1: TMemo;
        Edit1: TEdit;
        SendButton: TButton;
        PipeClient1: TPipeClient;
        procedure Button1Click(Sender: TObject);
        procedure SendButtonClick(Sender: TObject);
        procedure PipeClient1PipeMessage(Sender : TObject;
                                         Pipe   : HPIPE;
                                         Stream : TStream);
        procedure PipeClient1PipeDisconnect(Sender : TObject;
                                            Pipe   : HPIPE);
    private
        procedure ConnectPipe;
        procedure XMitMessage(const Msg: String);
    end;

var
    PipeClientForm: TPipeClientForm;

implementation

{$R *.dfm}

procedure TPipeClientForm.Button1Click(Sender: TObject);
begin
    ConnectPipe;
end;

procedure TPipeClientForm.ConnectPipe;
begin
    if not PipeClient1.Connect(2000, TRUE) then
        Memo1.Lines.Add('Pipe connect failed')
    else
        Memo1.Lines.Add('Pipe connected');
end;

procedure TPipeClientForm.PipeClient1PipeDisconnect(Sender: TObject; Pipe: HPIPE);
begin
    Memo1.Lines.Add('Disconnected');
end;

procedure TPipeClientForm.PipeClient1PipeMessage(
    Sender : TObject;
    Pipe   : HPIPE;
    Stream : TStream);
var
    Msg : String;
begin
    SetLength(Msg, Stream.Size div SizeOf(Char));
    Stream.Position := 0;
    Stream.Read(Msg[1], Stream.Size);
    Memo1.Lines.Add('Received: "' + Msg + '"');
end;

procedure TPipeClientForm.XMitMessage(const Msg : String);
begin
    if Length(Msg) <= 0 then
        Exit;
    if not PipeClient1.Connected then
        ConnectPipe;

    if not PipeClient1.Write(PChar(Msg)^, Length(Msg) * SizeOf(Char)) then
        Memo1.Lines.Add('Write failed')
    else
        Memo1.Lines.Add('Written');
end;

procedure TPipeClientForm.SendButtonClick(Sender: TObject);
begin
    XmitMessage(Edit1.Text);
end;

end.
