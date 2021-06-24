object PipeClientForm: TPipeClientForm
  Left = 0
  Top = 0
  Caption = 'Pipe Client'
  ClientHeight = 303
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 16
    Top = 12
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 12
    Top = 76
    Width = 407
    Height = 219
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 108
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
  object SendButton: TButton
    Left = 240
    Top = 12
    Width = 75
    Height = 25
    Caption = 'Send'
    TabOrder = 3
    OnClick = SendButtonClick
  end
  object PipeClient1: TPipeClient
    MemoryThrottle = 10240000
    PipeName = 'PipeServer'
    OnPipeDisconnect = PipeClient1PipeDisconnect
    OnPipeMessage = PipeClient1PipeMessage
    Left = 340
    Top = 24
  end
end
