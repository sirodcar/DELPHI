unit UAliquotaICMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, DB,
  WSEdit, WSDBEdit, WSInformacao, shellapi, Grids, DBGrids, DBClient,
  RXCtrls, RLReport, RLRichText;

type
  TFAliquotaICMS = class(TForm)
    lbltitulo: TLabel;
    ToolBarNavegacao: TToolBar;
    BtnPrimeiro: TToolButton;
    BtnAnterior: TToolButton;
    BtnProximo: TToolButton;
    BtnUltimo: TToolButton;
    ToolButton10: TToolButton;
    BtnIncluir: TToolButton;
    btnnovopadrao: TToolButton;
    BtnAlterar: TToolButton;
    BtnExcluir: TToolButton;
    ToolButton14: TToolButton;
    BtnImprimir: TToolButton;
    btnhtml: TToolButton;
    btnexcel: TToolButton;
    ToolButton19: TToolButton;
    btndesconectar: TToolButton;
    BtnFiltro: TToolButton;
    ToolButton22: TToolButton;
    btnexportar: TToolButton;
    btnimportar: TToolButton;
    ToolButton1: TToolButton;
    btnsair: TToolButton;
    PageControl: TPageControl;
    TabConsulta: TTabSheet;
    TabCadastro: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    DataSource: TDataSource;
    WSDBEdit1: TWSDBEdit;
    WSDBEdit2: TWSDBEdit;
    WSInformacao: TWSInformacao;
    BtnCancelar: TToolButton;
    BtnSalvar: TToolButton;
    ToolButton4: TToolButton;
    DBGrid: TDBGrid;
    PanPesquisa: TPanel;
    Label4: TLabel;
    txtpesquisa: TWSEdit;
    WSDBEdit3: TWSDBEdit;
    Label3: TLabel;
    txtcodcfop: TWSDBEdit;
    Label7: TLabel;
    txtcfop: TWSDBEdit;
    txtfiltrocfop: TWSEdit;
    Label9: TLabel;
    btncfop: TRxSpeedButton;
    btnfiltrocfop: TRxSpeedButton;
    RLReport: TRLReport;
    RLBand1: TRLBand;
    RLDBText6: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBImage1: TRLDBImage;
    RLDBText2: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLBand2: TRLBand;
    RLDBImage2: TRLDBImage;
    RLDBRichText1: TRLDBRichText;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLBand4: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLBand5: TRLBand;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    Label5: TLabel;
    WSDBEdit4: TWSDBEdit;
    WSDBEdit5: TWSDBEdit;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    WSDBEdit6: TWSDBEdit;
    WSDBEdit7: TWSDBEdit;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLLabel13: TRLLabel;
    RLDBText14: TRLDBText;
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure btnsairClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure btnnovopadraoClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure btndesconectarClick(Sender: TObject);
    procedure BtnFiltroClick(Sender: TObject);
    procedure btnexportarClick(Sender: TObject);
    procedure btnimportarClick(Sender: TObject);
    procedure btnhtmlClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure WSDBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtpesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnexcelClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure btncfopClick(Sender: TObject);
    procedure btnfiltrocfopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAliquotaICMS: TFAliquotaICMS;

implementation

uses UDM, UMenu, UCidade, UCliente, UCfop;

{$R *.dfm}

procedure TFAliquotaICMS.BtnPrimeiroClick(Sender: TObject);
begin
     if DataSource.DataSet.Active then
        DataSource.DataSet.first;
end;

procedure TFAliquotaICMS.BtnAnteriorClick(Sender: TObject);
begin
     if DataSource.DataSet.Active then
        DataSource.DataSet.prior;
end;

procedure TFAliquotaICMS.BtnProximoClick(Sender: TObject);
begin
     if DataSource.DataSet.Active then
        DataSource.DataSet.next;
end;

procedure TFAliquotaICMS.BtnUltimoClick(Sender: TObject);
begin
     if DataSource.DataSet.Active then
        DataSource.DataSet.last;
end;

procedure TFAliquotaICMS.btnsairClick(Sender: TObject);
begin
     close;
end;

procedure TFAliquotaICMS.BtnIncluirClick(Sender: TObject);
begin
     usuario((sender as TToolButton).name, wsinformacao.programa);
     
     if not datasource.dataset.active then
        btnfiltro.click;

     PageControl.ActivePage:=TabCadastro;
     Editar(Faliquotaicms, true);
     DataSource.DataSet.append;
end;

procedure TFAliquotaICMS.btnnovopadraoClick(Sender: TObject);
begin
     usuario((sender as TToolButton).name, wsinformacao.programa);

     if DataSource.DataSet.RecordCount > 0 then
     begin
          novo_padrao(DataSource, WSInformacao.Tabela);
          PageControl.ActivePage:=TabCadastro;
          Editar(Faliquotaicms, true);
     end;
end;

procedure TFAliquotaICMS.BtnAlterarClick(Sender: TObject);
begin
    usuario((sender as TToolButton).name, wsinformacao.programa);

   if DataSource.DataSet.Active then
   begin
     PageControl.ActivePage:=TabCadastro;
     DataSource.DataSet.Edit;
     Editar(Faliquotaicms, false);
     btncfop.enabled := false;     
   end;
end;

procedure TFAliquotaICMS.BtnExcluirClick(Sender: TObject);
begin
    usuario((sender as TToolButton).name, wsinformacao.programa);
   
    if (DataSource.DataSet.Active = true) then
      if (DataSource.DataSet.RecordCount > 0) then
        if application.messagebox ('Confirma Exclus�o?', 'Aten��o', mb_yesno +  MB_ICONQUESTION )= mryes  then
        begin
            try
                DataSource.DataSet.Delete;
                (DataSource.DataSet as TClientDataSet).ApplyUpdates(-1);                
            except
                ShowMessage('Imposs�vel Excluir. Viola��o de Integridade.');
            end;
        end;
end;

procedure TFAliquotaICMS.BtnSalvarClick(Sender: TObject);
begin
     ToolBarNavegacao.SetFocus;
     DataSource.DataSet.post;
     (DataSource.DataSet as TClientDataSet).ApplyUpdates(-1);
     navegar(Faliquotaicms);
end;

procedure TFAliquotaICMS.BtnCancelarClick(Sender: TObject);
begin
     DataSource.DataSet.Cancel;
     Navegar(Faliquotaicms);
end;

procedure TFAliquotaICMS.btndesconectarClick(Sender: TObject);
begin
     DataSource.DataSet.Close;
end;

procedure TFAliquotaICMS.BtnFiltroClick(Sender: TObject);
begin
    DataSource.DataSet.close;
    with dm.qaliquotaicms.sql do
    begin
         clear;
         add('SELECT ALISIGLA, ALICFOP, ALICODIGO, ALIICMSREVENDA, ALIICMSCONSUMIDOR, ALIBASECALC, ALISITTRIB, ALIOBS');
         add('FROM TALIQUOTAICMS');
         add('WHERE ALICODIGO <> 0 ');         
         if trim(txtpesquisa.text) <> '' then
            add('AND UPPER(ALICODIGO) LIKE UPPER(' + quotedstr('%' + txtpesquisa.text+ '%') + ')');
         if trim(txtfiltrocfop.text) <> '' then
            add('AND ALICFOP = ' + quotedstr(txtfiltrocfop.text));
         add('ORDER BY ALICODIGO');
    end;
    DataSource.DataSet.open;
end;

procedure TFAliquotaICMS.btnexportarClick(Sender: TObject);
begin
     usuario((sender as TToolButton).name, wsinformacao.programa);

     if not datasource.dataset.active then
        btnfiltro.click;
     exportar(Datasource, nil);
end;

procedure TFAliquotaICMS.btnimportarClick(Sender: TObject);
begin
     usuario((sender as TToolButton).name, wsinformacao.programa);

     if not datasource.dataset.active then
        btnfiltro.click; 
     importar(DataSource, Wsinformacao.Tabela);
end;                                                

procedure TFAliquotaICMS.btnhtmlClick(Sender: TObject);
begin
     usuario((sender as TToolButton).name, wsinformacao.programa);
     if not datasource.dataset.active then
        btnfiltro.click;
     html(lbltitulo.caption, dbgrid , DataSource );
     ShellExecute(Handle, nil, pchar(dm.savedialoghtml.FileName), nil, nil, SW_SHOW);
end;

procedure TFAliquotaICMS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if (datasource.DataSet.State = dsinsert) or
        (datasource.DataSet.State = dsedit) then
     begin
          showmessage('Imposs�vel sair, voc� esta em modo de edi��o!');
          action := canone;
          exit;
     end;
     action := cafree;
end;

procedure TFAliquotaICMS.FormShow(Sender: TObject);
begin
     navegar(sender as tform);
     pagecontrol.activepageindex := 0;     
end;

procedure TFAliquotaICMS.WSDBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   passar : boolean;
begin
    if (key = 27) and (btncancelar.enabled = true) then
        btncancelar.click;
    if (Key = VK_F12) and (btnSalvar.enabled = true) then
        btnsalvar.Click;

    if key = vk_f3 then
    begin
         if (sender = txtcodcfop) or (sender = txtcfop) then
            btncfop.click;
    end;

    if (key = 40) and (not (sender is tdblookupcombobox)) then
    begin
        if sender is TWSEDit then
        begin
            with sender as TWSEdit do
            begin
                if EnterClicar then
                begin
                     if btnProximo.enabled then
                        btnProximo.Click;
                     passar := false;
                end
                else
                begin
                     passar := true;
                end;
            end;
        end
        else
            passar := true;
        if passar then
            Perform (WM_nextDlgCtl,0,0);
    end;
    if (key = 13) then
    begin
        passar := true;
        if sender is TWSDBEDit then
        begin
            with sender as TWSDBEdit do
            begin
                if EnterClicar then
                begin
                   btnsalvar.click;
                   passar := false;
                end
                else
                begin
                   passar := true;
                end;
            end;
        end;
        if sender is TWSEDit then
        begin
            with sender as TWSEdit do
            begin
                if EnterClicar then
                begin
                   btnfiltro.click;
                end;
                passar := true;
            end;
        end;
        if passar then
           Perform (WM_nextDlgCtl,0,0);
    end;
    if (key = 38) and (not (sender is tdblookupcombobox)) then
    begin
        if sender is TWSEDit then
        begin
            with sender as TWSEdit do
            begin
                if EnterClicar then
                begin
                     if BtnAnterior.enabled then
                        BtnAnterior.Click;
                     passar := false;
                end
                else
                begin
                     passar := true;
                end;
            end;
        end
        else
            passar := true;
        if passar then
            Perform (WM_nextDlgCtl,1,0);
    end;
end;

procedure TFAliquotaICMS.txtpesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = 38) then
    begin
         if (sender = txtpesquisa) and (btnanterior.enabled = true) and (datasource.dataset.active) then
         begin
             btnanterior.Click;
             key := 0;
         end
         else
             Perform (WM_nextDlgCtl,1,0);
    end;
    if key = vk_f3 then
    begin
       if sender = txtfiltrocfop then
          btnfiltrocfop.click;
    end;
    if (key = 40) then
    begin
         if (sender = txtpesquisa) and (btnproximo.enabled = true) and (datasource.dataset.active) then
         begin
            btnproximo.Click;
            key := 0;
         end
         else
            Perform (WM_nextDlgCtl,0,0);
    end;
    if key = (13) then
    begin
        if (sender as twsedit).enterclicar then
            btnfiltro.click
        else
            Perform (WM_nextDlgCtl,0,0);
    end;
    if (key=vk_insert) and (btnIncluir.Enabled = True) then
        btnIncluir.Click;
    if (key=vk_f11) and (btnnovopadrao.Enabled = True) then
        btnnovopadrao.Click;
    if (key=vk_f10) and (btnAlterar.Enabled = True) then
        btnAlterar.Click;
    if tbKeyIsDown(VK_CONTROL) then
       if (key=vk_delete) and (BtnExcluir.Enabled = True) then
           BtnExcluir.Click;
    if (Key = VK_F12) and (btnSalvar.enabled = true) then
        btnsalvar.Click;
    if (key=27) and (btnSair.Enabled = True) then
        btnSair.Click;
    if (key=27) and (btncancelar.enabled = true) then
        btncancelar.click;
    if (key=vk_f8) and (btnImprimir.Enabled = True) then
        btnImprimir.Click;
    if (key=VK_F7) and (btndesconectar.Enabled = True) then
        btndesconectar.Click;
    if (key=VK_F9) and (btnFiltro.Enabled = True) then
        btnFiltro.Click;
    if (key=vk_f4) then
        btnexportar.click;
    if (key=vk_f2) then
        btnimportar.click;
    if (key=vk_f5) then
        PageControl.ActivePage := tabconsulta;
    if (key=vk_f6) then
        PageControl.ActivePage := TabCadastro;
end;

procedure TFAliquotaICMS.btnexcelClick(Sender: TObject);
begin
     usuario((sender as TToolButton).name, wsinformacao.programa);
       
     if not datasource.dataset.active then
        btnfiltro.click;
     excel(lbltitulo.caption, dbgrid);  
end;

procedure TFAliquotaICMS.BtnImprimirClick(Sender: TObject);
begin
     usuario((sender as TToolButton).name, wsinformacao.programa);
     RLReport.PreviewModal;
end;

procedure TFAliquotaICMS.btncfopClick(Sender: TObject);
begin
     try
         fcfop := tfcfop.create(self);
         usuario('btnconsultar',fcfop.wsinformacao.programa);
         fcfop.txtpesquisa.text := txtcfop.text;
         fcfop.BtnFiltro.click;
         fcfop.showmodal;
         dm.cdsaliquotaicmsalicfop.asinteger := dm.cdscfopcfopcod.asinteger;
     finally
         fcfop.release;
         fcfop:= nil;
         fcfop.free;
     end;
end;

procedure TFAliquotaICMS.btnfiltrocfopClick(Sender: TObject);
begin
     try
         fcfop := tfcfop.create(self);
         usuario('btnconsultar',fcfop.wsinformacao.programa);
         dm.cdscfop.open;
         fcfop.showmodal;
         txtfiltrocfop.text := dm.cdscfopcfopcod.asstring;
     finally
         fcfop.release;
         fcfop := nil;
         fcfop.free;
     end;
end;

end.
