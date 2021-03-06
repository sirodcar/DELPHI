unit Formulario.CadastroProfissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Formulario.Base01, Vcl.StdCtrls, AeroButtons,
  W7Classes, W7Panels, AdvEdit, AdvEdBtn, Modelos.Profissional;

type
  TFrmCadastroProfissionais = class(TFrmTelaBase01)
    EdtCodigo: TAdvEditBtn;
    EdtDescricao: TAdvEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

    Profissional: TProfissional;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TFrmCadastroProfissionais.FormCreate(Sender: TObject);
begin
  inherited;

  Profissional:= TProfissional.Create;

  BtnExcluir.Enabled:= False;

end;



procedure TFrmCadastroProfissionais.FormDestroy(Sender: TObject);
begin
  inherited;

  if ( Assigned( Profissional ) ) then
    FreeAndNil( Profissional );
end;



end.
