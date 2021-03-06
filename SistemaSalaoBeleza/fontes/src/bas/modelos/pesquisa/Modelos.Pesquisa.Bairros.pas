unit Modelos.Pesquisa.Bairros;

interface

uses
  Modelos.Pesquisa.IInterface,
  Modelos.Pesquisa.Tela,

  Vcl.Controls,
  Vcl.StdCtrls,

  System.SysUtils,
  Lib.Funcoes;

type
  TPesquisaBairro = class( TInterfacedObject, IBuscaCampo )
  public
    function Buscar(AControle: TWinControl; out ARetorno: Integer): Boolean;

  end;

implementation

{ TPesquisaCliente }

function TPesquisaBairro.Buscar(AControle: TWinControl; out ARetorno: Integer): Boolean;
var
  FrmTelaPesquisa: TFrmTelaPesquisa;
begin
  Result:= False;
  FrmTelaPesquisa:= TFrmTelaPesquisa.Create( AControle.Owner );
  try
    FrmTelaPesquisa.Caption:= 'Pesquisa Bairros';
    FrmTelaPesquisa.AdvEdit1.LabelCaption:= 'Bairro';

    FrmTelaPesquisa.ComandoSQL:=
      ' select ' + TFuncoes.InserirAspasDuplas('id_bairro') + ', ' +
                   TFuncoes.InserirAspasDuplas('ds_bairro') +
      '   from ' + TFuncoes.InserirAspasDuplas('bairros') +
      '  where ' + TFuncoes.InserirAspasDuplas('dt_exclusao') + ' is null ';

    with FrmTelaPesquisa do
    begin
      AdicionaMapaCampos( 'id_bairro', 'C�digo', 70 );
      AdicionaMapaCampos( 'ds_bairro', 'Bairro', 350  );
    end;
    FrmTelaPesquisa.Preparar;

    FrmTelaPesquisa.DefinirTamanho( 375, 500  );

    FrmTelaPesquisa.CampoLocate:= 'ds_bairro';

    FrmTelaPesquisa.ShowModal;
    if (FrmTelaPesquisa.ModalResult = mrOk) then
    begin
      ARetorno:= FrmTelaPesquisa.ClientDataSet1.Fields[0].Value;

      Result:= True;
    end;
  finally
    FreeAndNil(FrmTelaPesquisa);
  end;
end;

end.
