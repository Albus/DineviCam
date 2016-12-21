object Form4: TForm4
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form4'
  ClientHeight = 719
  ClientWidth = 981
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 981
    Height = 719
    Align = alClient
    AutoSize = True
    Center = True
    IncrementalDisplay = True
    Proportional = True
    Stretch = True
    ExplicitLeft = -96
    ExplicitTop = -24
    ExplicitWidth = 965
    ExplicitHeight = 680
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 33
    Height = 25
    Caption = 'Exit'
    TabOrder = 0
    TabStop = False
    OnClick = Button1Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 536
    Top = 8
  end
  object IdHTTP1: TIdHTTP
    OnWorkEnd = IdHTTP1WorkEnd
    AllowCookies = False
    RedirectMaximum = 0
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 608
    Top = 8
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 672
    Top = 8
  end
end
