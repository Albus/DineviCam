unit Unit4;

interface

uses Vcl.Forms, JPEG, IdComponent, OTLParallel, Vcl.Controls, Vcl.StdCtrls,
  IdAntiFreezeBase,
  Vcl.IdAntiFreeze, IdBaseComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Vcl.ExtCtrls, System.Classes;

type
  TForm4 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    IdHTTP1: TIdHTTP;
    IdAntiFreeze1: TIdAntiFreeze;
    Button1: TButton;
    procedure IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    procedure Download;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  myMem: TMemoryStream;

implementation

{$R *.dfm}

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Timer1.Enabled := false;
  Application.ProcessMessages;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  myMem := TMemoryStream.Create;
end;

procedure TForm4.IdHTTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
var
  myJPEG: TJPEGImage;
begin;
  if myMem.Size > 0 then
  begin
    myJPEG := TJPEGImage.Create;
    myMem.Seek(0, soBeginning);
    myJPEG.LoadFromStream(myMem);
    myMem.Clear;
    if not myJPEG.Empty then
      Image1.Picture.Assign(myJPEG);
    myJPEG.Destroy;
  end;
  Timer1.Enabled := true;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  myMem.Clear;
  Async(Download).Await(
    procedure
    begin;
      Application.ProcessMessages;
    end);
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  Close();
end;

procedure TForm4.Download;
begin
  try
    IdHTTP1.Get
      ('http://vlas.com/cam/showsingle?cam=1&fr=0&t=1482190776583', myMem);
  except
    // on E: Exception do
  end;
end;

end.
