object PipeServerForm: TPipeServerForm
  Left = 0
  Top = 0
  Caption = 'Pipe Server'
  ClientHeight = 303
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 12
    Top = 76
    Width = 407
    Height = 219
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 12
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object BroadcastButton: TButton
    Left = 144
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Broadcast'
    TabOrder = 2
    OnClick = BroadcastButtonClick
  end
  object PipeServer1: TPipeServer
    Active = False
    OnPipeConnect = PipeServer1PipeConnect
    OnPipeDisconnect = PipeServer1PipeDisconnect
    OnPipeMessage = PipeServer1PipeMessage
    PipeName = 'PipeServer'
    Left = 340
    Top = 16
  end
end
