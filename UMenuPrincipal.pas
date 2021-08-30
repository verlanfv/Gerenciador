unit UMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Menus, Vcl.ComCtrls, Vcl.Buttons, ShellApi,
  System.ImageList, Vcl.ImgList, Vcl.CategoryButtons, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, TlHelp32, MidasLib, Midas;

type
  TfrmMenuPrincipal = class(TForm)
    Panel1: TPanel;
    Panel22: TPanel;
    imgBackground: TImage;
    Image1: TImage;
    Image6: TImage;
    stbMenu: TStatusBar;
    Timer1: TTimer;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Image4: TImage;
    Panel9: TPanel;
    Panel6: TPanel;
    Panel10: TPanel;
    Label1: TLabel;
    lblUsuario: TLabel;
    Panel11: TPanel;
    Image5: TImage;
    Panel12: TPanel;
    lblHora: TLabel;
    lblData: TLabel;
    tmrRelogio: TTimer;
    lblSite: TLabel;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    Backgroud1: TMenuItem;
    Backgroud2: TMenuItem;
    Backgroud3: TMenuItem;
    ctbMenu: TCategoryButtons;
    Panel2: TPanel;
    Panel3: TPanel;
    mnuGerenciador: TMainMenu;
    GER010000000000000000: TMenuItem;
    GER010100000000000000: TMenuItem;
    GER010200000000000000: TMenuItem;
    N1: TMenuItem;
    GER010300000000000000: TMenuItem;
    GER020000000000000000: TMenuItem;
    GER020100000000000000: TMenuItem;
    GER020200000000000000: TMenuItem;
    GER020300000000000000: TMenuItem;
    GER020400000000000000: TMenuItem;
    GER020500000000000000: TMenuItem;
    GER020600000000000000: TMenuItem;
    GER020700000000000000: TMenuItem;
    GER020800000000000000: TMenuItem;
    GER020900000000000000: TMenuItem;
    GER021000000000000000: TMenuItem;
    GER021100000000000000: TMenuItem;
    GER021200000000000000: TMenuItem;
    GER021300000000000000: TMenuItem;
    GER021400000000000000: TMenuItem;
    GER021500000000000000: TMenuItem;
    GER030000000000000000: TMenuItem;
    GER030100000000000000: TMenuItem;
    GER030400000000000000: TMenuItem;
    actCadastros: TAction;
    actCompras: TAction;
    actEstoque: TAction;
    actFinanceiro: TAction;
    actFaturamento: TAction;
    actFiscal: TAction;
    actVendas: TAction;
    actCupom: TAction;
    actLogistica: TAction;
    actForca_Vendas: TAction;
    actConfiguradores: TAction;
    actImportacao: TAction;
    actECD_Sped: TAction;
    actEtiquetas: TAction;
    actAdministrativo: TAction;
    Label2: TLabel;
    Image2: TImage;
    Image3: TImage;
    GER021600000000000000: TMenuItem;
    actMDFe: TAction;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure actConfiguradoresExecute(Sender: TObject);
    procedure ctbMenuCategories0Items6Click(Sender: TObject);
    procedure actCadastrosExecute(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure ctbMenuCategories0Items11Click(Sender: TObject);
    procedure tmrRelogioTimer(Sender: TObject);
    procedure lblSiteMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblSiteMouseLeave(Sender: TObject);
    procedure lblSiteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Backgroud1Click(Sender: TObject);
    procedure Backgroud2Click(Sender: TObject);
    procedure Backgroud3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actComprasExecute(Sender: TObject);
    procedure actEstoqueExecute(Sender: TObject);
    procedure actFinanceiroExecute(Sender: TObject);
    procedure actFaturamentoExecute(Sender: TObject);
    procedure actFiscalExecute(Sender: TObject);
    procedure actVendasExecute(Sender: TObject);
    procedure actCupomExecute(Sender: TObject);
    procedure actLogisticaExecute(Sender: TObject);
    procedure actForca_VendasExecute(Sender: TObject);
    procedure actImportacaoExecute(Sender: TObject);
    procedure actECD_SpedExecute(Sender: TObject);
    procedure actEtiquetasExecute(Sender: TObject);
    procedure actAdministrativoExecute(Sender: TObject);
    procedure GER010300000000000000Click(Sender: TObject);
    procedure GER030100000000000000Click(Sender: TObject);
    procedure GER030400000000000000Click(Sender: TObject);
    procedure GER010200000000000000Click(Sender: TObject);
    procedure GER010100000000000000Click(Sender: TObject);
    procedure GER021100000000000000Click(Sender: TObject);
    procedure GER020100000000000000Click(Sender: TObject);
    procedure GER020200000000000000Click(Sender: TObject);
    procedure GER020300000000000000Click(Sender: TObject);
    procedure GER020400000000000000Click(Sender: TObject);
    procedure GER020500000000000000Click(Sender: TObject);
    procedure GER020600000000000000Click(Sender: TObject);
    procedure GER020700000000000000Click(Sender: TObject);
    procedure GER020800000000000000Click(Sender: TObject);
    procedure GER020900000000000000Click(Sender: TObject);
    procedure GER021000000000000000Click(Sender: TObject);
    procedure GER021200000000000000Click(Sender: TObject);
    procedure GER021300000000000000Click(Sender: TObject);
    procedure GER021400000000000000Click(Sender: TObject);
    procedure GER021500000000000000Click(Sender: TObject);
    procedure actMDFeExecute(Sender: TObject);
    procedure GER021600000000000000Click(Sender: TObject);
  private
    sAuxValor, sVersaoGerenciador : String;
    procedure Pega_Usuario(var pFuncCodigo,pSenhaSenha,pEmpresa : String; out pRetorno : String);
    procedure Menus(out pRetorno: String);
    procedure Relatorio_Analise_Devedor;
    function Avalia_Situacao_Credito(var pImprimeRel: String): Double;
    procedure Grava_Analise_Devedor;
  public
    { Public declarations }
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;
  iContaParametros, iApresentaUmVez : Integer;
  sSistemaExecutavel : String;
  iDiasBloqueio, iClientesDevedores : Integer;
  dValorAtrasado : Double;

implementation

uses
    Login, Sleep, uFuncoes, uDtmSisGestao;

{$R *.dfm}

procedure TfrmMenuPrincipal.actAdministrativoExecute(Sender: TObject);
begin
    GER021500000000000000Click(Sender);
end;

procedure TfrmMenuPrincipal.actCadastrosExecute(Sender: TObject);
begin
    GER020100000000000000Click(Sender);
end;

procedure TfrmMenuPrincipal.actComprasExecute(Sender: TObject);
begin
    GER020700000000000000Click(Sender);
end;

procedure TfrmMenuPrincipal.actConfiguradoresExecute(Sender: TObject);
begin
    GER021100000000000000Click(Sender);
end;

procedure TfrmMenuPrincipal.actCupomExecute(Sender: TObject);
begin
    GER020800000000000000Click(Sender);
end;

procedure TfrmMenuPrincipal.actECD_SpedExecute(Sender: TObject);
begin
    GER021300000000000000Click(Sender);
end;

procedure TfrmMenuPrincipal.actEstoqueExecute(Sender: TObject);
begin
    GER020200000000000000Click(Sender);
end;

procedure TfrmMenuPrincipal.actEtiquetasExecute(Sender: TObject);
begin
    GER021400000000000000Click(Sender);
end;

procedure TfrmMenuPrincipal.actFaturamentoExecute(Sender: TObject);
begin
    GER020400000000000000Click(Sender);
end;

procedure TfrmMenuPrincipal.actFinanceiroExecute(Sender: TObject);
begin
    GER020300000000000000Click(Sender);
end;

procedure TfrmMenuPrincipal.actFiscalExecute(Sender: TObject);
begin
    GER020500000000000000Click(Sender);
end;

procedure TfrmMenuPrincipal.actForca_VendasExecute(Sender: TObject);
begin
    GER021000000000000000Click(Sender);
end;

procedure TfrmMenuPrincipal.actImportacaoExecute(Sender: TObject);
begin
    GER021200000000000000Click(Sender);
end;

procedure TfrmMenuPrincipal.actLogisticaExecute(Sender: TObject);
begin
    GER020900000000000000Click(Sender);
end;

procedure TfrmMenuPrincipal.actMDFeExecute(Sender: TObject);
begin
    GER021600000000000000Click(Sender);
end;

procedure TfrmMenuPrincipal.actVendasExecute(Sender: TObject);
begin
    GER020600000000000000Click(Sender);
end;

procedure TfrmMenuPrincipal.ctbMenuCategories0Items11Click(Sender: TObject);
begin
    ShellExecute(Handle, 'open', PChar( 'C:\SisIndustria_firedac\Win32\Debug\pSisIndustria' + '.exe'), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmMenuPrincipal.ctbMenuCategories0Items6Click(Sender: TObject);
begin
    ShellExecute(Handle, 'open', PChar( 'C:\BACKGROUND\fontes\Faturamento\Win32\Debug\pNotaFiscal' + '.exe'), nil, nil, SW_SHOWNORMAL);

end;

procedure TfrmMenuPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if Pergunta('Sair do Sistema?','Aviso...') then
   begin
       FechaPrograma('pConfiguradores.exe');
       FechaPrograma('pCadastros.exe');
       FechaPrograma('pCompra.exe');
       FechaPrograma('pEstoque.exe');
       FechaPrograma('pVendas.exe');
       FechaPrograma('pEstoque.exe');
       FechaPrograma('pFinanceiro.exe');
       FechaPrograma('pFiscais.exe');
       FechaPrograma('pEtiquetas.exe');
       FechaPrograma('pFaturamento.exe');
       FechaPrograma('pNFe.exe');
       FechaPrograma('pSped.exe');
       FechaPrograma('pTablet.exe');
       FechaPrograma('pControleAdm.exe');
       FechaPrograma('pMdfe.exe');
       FechaPrograma('pNotaFiscal.exe');
       Action := caFree;
       ExitProcess(0);//força a finalização do processo
   end
   else
      Action := caNone;

end;

procedure TfrmMenuPrincipal.FormCreate(Sender: TObject);
var
   iNivel01,iNivel02,iNivel03,iNivel04,iNivel05 : Integer;
   sFuncCodigo, sSenhaSenha,sSarava : String;
   Rgn : HRGN;
begin
    frmLogin := TfrmLogin.Create(Self);
    try
        frmLogin.ShowModal;
    finally
        FreeAndNil(frmLogin);
    end;

    frmSleep := TfrmSleep.Create(Self);
    try
        frmSleep.ShowModal;
    finally
        FreeAndNil(frmSleep);
    end;
    //frmSleep.Visible := False;

    if dtmSisGestao.FdConnection.InTransaction then
       dtmSisGestao.FdConnection.Commit;
    dtmSisGestao.FdConnection.StartTransaction;

    dtmSisGestao.FdQryGeralDados.Active  := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Text := 'insert into geral_menu(menu_codigo,menu_descricao,menu_acesso,menu_modulo) '+
                                                'values (:menucodigo,:menudescricao,:menuacesso,:menumodulo) '+
                                                'on duplicate key update  menu_codigo    = :menucodigo,'+
                                                '                         menu_descricao = :menudescricao,'+
                                                '                         menu_acesso    = :menuacesso,'+
                                                '                         menu_modulo    = :menumodulo';

     //dtmSisGestao.FdQryGeralDados.Params.ParamByName('MENUTIPO').AsString := '';
    for iNivel01 := 0 to mnuGerenciador.Items.Count - 1 do
    begin
        Application.ProcessMessages;
          // Se o caption for um traço ('-'), é provavelmente uma linha de baixo relevo...
        if mnuGerenciador.Items.Items[iNivel01].Caption = '-' then
            Continue;
        dtmSisGestao.FdQryGeralDados.active := false;
        dtmSisGestao.FdQryGeralDados.params.parambyname('menucodigo').asstring := uppercase(mnugerenciador.items.items[iNivel01].name);
        dtmSisGestao.FdQryGeralDados.params.parambyname('menudescricao').asstring := Trim(mnugerenciador.items.items[iNivel01].hint);
        dtmSisGestao.FdQryGeralDados.params.parambyname('menuacesso').asstring := 'x';
        dtmSisGestao.FdQryGeralDados.params.parambyname('menumodulo').asstring := PadLeft(IntToStr(mnuGerenciador.Items.Items[iNivel01].ImageIndex), 2, '0');
        try
            dtmSisGestao.FdQryGeralDados.Execute;
        except
        end;
        for iNivel02 := 0 to mnuGerenciador.Items[iNivel01].Count - 1 do
        begin
               // Se o caption for um traço ('-'), é provavelmente uma linha de baixo relevo...
            if mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Caption = '-' then
                Continue;
            dtmSisGestao.FdQryGeralDados.active := false;
            dtmSisGestao.FdQryGeralDados.params.parambyname('menucodigo').asstring := uppercase(mnugerenciador.items.items[iNivel01].items[iNivel02].name);
            dtmSisGestao.FdQryGeralDados.params.parambyname('menudescricao').asstring := Trim(mnugerenciador.items.items[iNivel01].items[iNivel02].hint);
            dtmSisGestao.FdQryGeralDados.params.parambyname('menuacesso').asstring := 'x';
            dtmSisGestao.FdQryGeralDados.params.parambyname('menumodulo').asstring := padleft(inttostr(mnugerenciador.items.items[iNivel01].items[iNivel02].imageindex), 2, '0');
            try
                dtmSisGestao.FdQryGeralDados.Execute;
            except
            end;
            if mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Count > 0 then
                for iNivel03 := 0 to mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Count - 1 do
                begin
                       // Se o caption for um traço ('-'), é provavelmente uma linha de baixo relevo...
                    if mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Caption = '-' then
                        Continue;
                    dtmSisGestao.FdQryGeralDados.Active := False;
                    dtmSisGestao.FdQryGeralDados.params.parambyname('menucodigo').asstring := uppercase(mnugerenciador.items.items[iNivel01].items[iNivel02].items[iNivel03].name);
                    dtmSisGestao.FdQryGeralDados.params.parambyname('menudescricao').asstring := Trim(mnugerenciador.items.items[iNivel01].items[iNivel02].items[iNivel03].hint);
                    dtmSisGestao.FdQryGeralDados.params.parambyname('menuacesso').asstring := 'x';
                    dtmSisGestao.FdQryGeralDados.params.parambyname('menumodulo').asstring := padleft(inttostr(mnugerenciador.items.items[iNivel01].items[iNivel02].items[iNivel03].imageindex), 2, '0');
                    try
                        dtmSisGestao.FdQryGeralDados.Execute;
                    except
                    end;
                    if mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Count > 0 then
                        for iNivel04 := 0 to mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Count - 1 do
                        begin
                            Application.ProcessMessages;
                               // Se o caption for um traço ('-'), é provavelmente uma linha de baixo relevo...
                            if mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Caption = '-' then
                                Continue;
                            Application.ProcessMessages;
                            dtmSisGestao.FdQryGeralDados.Active := False;
                            dtmSisGestao.FdQryGeralDados.params.parambyname('menucodigo').asstring := uppercase(mnugerenciador.items.items[iNivel01].items[iNivel02].items[iNivel03].items[iNivel04].name);
                            dtmSisGestao.FdQryGeralDados.params.parambyname('menudescricao').asstring := Trim(mnugerenciador.items.items[iNivel01].items[iNivel02].items[iNivel03].items[iNivel04].hint);
                            dtmSisGestao.FdQryGeralDados.params.parambyname('menuacesso').asstring := 'x';
                            dtmSisGestao.FdQryGeralDados.params.parambyname('menumodulo').asstring := padleft(inttostr(mnugerenciador.items.items[iNivel01].items[iNivel02].items[iNivel03].items[iNivel04].imageindex), 2, '0');
                            try
                                dtmSisGestao.FdQryGeralDados.Execute;
                            except
                            end;
                            if mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Count > 0 then
                                for iNivel05 := 0 to mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Count - 1 do
                                begin
                                       // Se o caption for um traço ('-'), é provavelmente uma linha de baixo relevo...
                                    if mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Items[iNivel05].Caption = '-' then
                                        Continue;
                                    dtmSisGestao.FdQryGeralDados.Active := False;
                                    dtmSisGestao.FdQryGeralDados.params.parambyname('menucodigo').asstring := uppercase(mnugerenciador.items.items[iNivel01].items[iNivel02].items[iNivel03].items[iNivel04].items[iNivel05].name);
                                    dtmSisGestao.FdQryGeralDados.params.parambyname('menudescricao').asstring := Trim(mnugerenciador.items.items[iNivel01].items[iNivel02].items[iNivel03].items[iNivel04].items[iNivel05].hint);
                                    dtmSisGestao.FdQryGeralDados.params.parambyname('menuacesso').asstring := 'x';
                                    dtmSisGestao.FdQryGeralDados.params.parambyname('menumodulo').asstring := padleft(inttostr(mnugerenciador.items.items[iNivel01].items[iNivel02].items[iNivel03].items[iNivel04].items[iNivel05].imageindex), 2, '0');
                                    try
                                        dtmSisGestao.FdQryGeralDados.Execute;
                                    except
                                    end;
                                end;
                        end;
                end;
        end;
    end;

    dtmSisGestao.FdQryGeralDados.Active := False;
    dtmSisGestao.FdConnection.Commit;

    if dtmSisGestao.FdConnection.InTransaction then
       dtmSisGestao.FdConnection.Commit;
    dtmSisGestao.FdConnection.StartTransaction;
    dtmSisGestao.FdQryGeralDados.Active := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Text := LowerCase('select * from geral_empresa,geral_funcionario '+
                                           'where (geral_empresa.empre_codigo = 0) and (geral_funcionario.func_codigo = 0)');
    dtmSisGestao.FdQryGeralDados.Active := True;
    if (dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_CODIGO').IsNull) then // Se não tem empresa cadastrada, cadastra a empresa
    begin
        dtmSisGestao.Grava_Dados_Iniciais;
        //GravaMenus(Sender);
    end;
     // Verificação dos parâmetros...
    iApresentaUmVez := 0;
    if (iApresentaUmVez = 0) then
    begin
        iApresentaUmVez := 1;
        iContaParametros := 0;
          // Verifica os parametros externos...
        //iContaParametros := ParamCount;
        //if (iContaParametros <> 0) and (iContaParametros = 3) then
        //begin
            sEmpresa := IntToStr(FUNCIONARIO.EMPRE_CODIGO); //ParamStr(1);
            sFuncCodigo := FUNCIONARIO.FUNC_CODIGO; //ParamStr(2); // Codigo do funcionário...
            sSenhaSenha := FUNCIONARIO.SENHA_SENHA; //ParamStr(3); // Senha do funcionário...
            Pega_Usuario(sFuncCodigo, sSenhaSenha, sEmpresa, sRet);
            if (sRet = 'FALHA') then
            begin
                iContaParametros := 0;
                Informacao('Usuário não encontrado... PARAMETROS...', 'Aviso...');
                Application.Terminate;
                Exit;
            end;
            Menus(sRet);
            if (sRet = 'FALHA') then
            begin
                iContaParametros := 0;
                Informacao('Menus com falha... PARAMETROS...', 'Aviso...');
                Application.Terminate;
                Exit;
            end;
            iContaParametros := 3;
            stbMenu.Panels[0].Text := '' ;
            stbMenu.Panels[1].Text := 'Empresa: '+
                                       IntToStr(Funcionario.EMPRE_CODIGO)+'-'+
                                       Trim(Funcionario.EMPRE_RAZAOSOCIAL);
            lblUsuario.Caption := Funcionario.FUNC_CODIGO +' - '+ Funcionario.FUNC_NOME;

        //end;
    end;
    GER010100000000000000.Enabled := not ((iContaParametros <> 0) and (iContaParametros = 3)); //LogIn....
    GER010200000000000000.Enabled := ((iContaParametros <> 0) and (iContaParametros = 3)); // LogOut...
end;

procedure TfrmMenuPrincipal.FormShow(Sender: TObject);
begin
    sVersaoGerenciador := ' v1.0.1 - 29072021';
    frmMenuPrincipal.Caption := '  Gestão Comercial '+sVersaoGerenciador;
    imgBackground.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'BACKGROUND\background3.jpg');
    //Panel10.Color := $008C5A08;
    Panel10.Color := $00402802;

    lblData.Caption := FormatDateTime('dd/mm/yyyy', Now);
    lblHora.Caption := FormatDateTime('hh:mm:ss', Now);

    Relatorio_Analise_Devedor;

end;

procedure TfrmMenuPrincipal.GER010100000000000000Click(Sender: TObject);
begin
    frmLogin := TfrmLogin.Create(Self);
    try
        frmLogin.ShowModal;
    finally
        FreeAndNil(frmLogin);
    end;

    if FUNCIONARIO.FUNC_RETORNOSENHA = 'OK' then
    begin
        sEmpresa := IntToStr(FUNCIONARIO.EMPRE_CODIGO);
        sFuncCodigo := FUNCIONARIO.FUNC_CODIGO;
        sSenhaSenha := FUNCIONARIO.SENHA_SENHA;
        Pega_Usuario(sFuncCodigo, sSenhaSenha, sEmpresa, sRet);

        Menus(sRet);
        if (sRet = 'FALHA') then
        begin
            Exit;
        end;

        stbMenu.Panels[0].Text := '' ;
        stbMenu.Panels[1].Text := 'Empresa: '+
                                   IntToStr(Funcionario.EMPRE_CODIGO)+'-'+
                                   Trim(Funcionario.EMPRE_RAZAOSOCIAL);
        lblUsuario.Caption := Funcionario.FUNC_CODIGO +' - '+ Funcionario.FUNC_NOME;

        dtmSisGestao.Le_Dados_Configuracao;
    end;
end;

procedure TfrmMenuPrincipal.GER010200000000000000Click(Sender: TObject);
var
 bRetorno:boolean;
 sCaminhoSessao : String;
begin
     FUNCIONARIO.FUNC_RETORNOSENHA := '';
     lblUsuario.Caption := '';
     stbMenu.Panels[1].Text := '';
     sFuncCodigo := '';
     sSenhaSenha := '';
     sEmpresa    := '';

     Limpa_variavel(sErro);

     ctbMenu.Visible := False;

     GER010100000000000000.Visible := True;
     GER010100000000000000.Enabled := True;
     GER010200000000000000.Enabled := False;
     GER020000000000000000.Visible := False;
     GER020100000000000000.Visible := False;
     GER020200000000000000.Visible := False;
     GER020300000000000000.Visible := False;
     GER020400000000000000.Visible := False;
     GER020500000000000000.Visible := False;
     GER020600000000000000.Visible := False;
     GER020700000000000000.Visible := False;
     GER020800000000000000.Visible := False;
     GER020900000000000000.Visible := False;

     GER021100000000000000.Visible := False;
     GER021200000000000000.Visible := False;
     GER021300000000000000.Visible := False;
     GER021400000000000000.Visible := False;
     GER021500000000000000.Visible := False;
     GER021600000000000000.Visible := False;
     GER021000000000000000.Visible := False;
     GER030000000000000000.Visible := true;
     GER030100000000000000.Visible := true;


     FechaPrograma('pConfiguradores.exe');
     FechaPrograma('pCadastros.exe');
     FechaPrograma('pCompra.exe');
     FechaPrograma('pEstoque.exe');
     FechaPrograma('pVendas.exe');
     FechaPrograma('pEstoque.exe');
     FechaPrograma('pFinanceiro.exe');
     FechaPrograma('pFiscais.exe');
     FechaPrograma('pEtiquetas.exe');
     FechaPrograma('pFaturamento.exe');
     FechaPrograma('pNFe.exe');
     FechaPrograma('pSped.exe');
     FechaPrograma('pTablet.exe');

     Application.ProcessMessages;

end;

procedure TfrmMenuPrincipal.GER010300000000000000Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmMenuPrincipal.GER020100000000000000Click(Sender: TObject);
begin
    if (FUNCIONARIO.EMPRE_CODIGO >= 0) and (Trim(FUNCIONARIO.FUNC_CODIGO) <> '') and
       (FUNCIONARIO.FUNC_RETORNOSENHA <> 'CANCELA') then
    begin
         if VerificaCadastroMenu(FUNCIONARIO.FUNC_CODIGO,'GER020100000000000000',
                                 FUNCIONARIO.EMPRE_CODIGO,
                                 FUNCIONARIO.SENHA_NIVEL) then
         begin
              FUNCIONARIO.MENU_ATUAL := 'GER020100000000000000';
              sSistemaExecutavel := sCaminhoExe+'\pCadastros.exe';
              if FileExists(sSistemaExecutavel) then
                  ShellExecute(frmMenuPrincipal.Handle,'open',
                               PChar(sSistemaExecutavel),
                               PChar(IntToStr(FUNCIONARIO.EMPRE_CODIGO)+' '+
                                     FUNCIONARIO.FUNC_CODIGO+' '+
                                     (FUNCIONARIO.SENHA_SENHA)),
                               '',SW_SHOWNORMAL)
              else
                  Informacao('Execução do Sistema não foi possível...'+#13+
                             'Arquivo executável não encontrado...','Aviso...');
         end;
    end
    else
        Informacao('Execução do Sistema não foi possível...'+#13+
                   'Favor executar LOGIN ...','Aviso...');
end;

procedure TfrmMenuPrincipal.GER020200000000000000Click(Sender: TObject);
begin
    if (FUNCIONARIO.EMPRE_CODIGO >= 0) and (Trim(FUNCIONARIO.FUNC_CODIGO) <> '') and
       (FUNCIONARIO.FUNC_RETORNOSENHA <> 'CANCELA') then
    begin
         if VerificaCadastroMenu(FUNCIONARIO.FUNC_CODIGO,'GER020200000000000000',
                                 FUNCIONARIO.EMPRE_CODIGO,
                                 FUNCIONARIO.SENHA_NIVEL) then
         begin
              FUNCIONARIO.MENU_ATUAL := 'GER020200000000000000';
              sSistemaExecutavel := sCaminhoExe+'\pEstoque.exe';
              if FileExists(sSistemaExecutavel) then
                  ShellExecute(frmMenuPrincipal.Handle,'open',
                               PChar(sSistemaExecutavel),
                               PChar(IntToStr(FUNCIONARIO.EMPRE_CODIGO)+' '+
                                     FUNCIONARIO.FUNC_CODIGO+' '+
                                     (FUNCIONARIO.SENHA_SENHA)),
                               '',SW_SHOWNORMAL)
              else
                  Informacao('Execução do Sistema não foi possível...'+#13+
                             'Arquivo executável não encontrado...','Aviso...');
         end;
    end
    else
        Informacao('Execução do Sistema não foi possível...'+#13+
                   'Favor executar LOGIN ...','Aviso...');
end;

procedure TfrmMenuPrincipal.GER020300000000000000Click(Sender: TObject);
begin
    if (FUNCIONARIO.EMPRE_CODIGO >= 0) and (Trim(FUNCIONARIO.FUNC_CODIGO) <> '') and
       (FUNCIONARIO.FUNC_RETORNOSENHA <> 'CANCELA') then
    begin
         if VerificaCadastroMenu(FUNCIONARIO.FUNC_CODIGO,'GER020300000000000000',
                                 FUNCIONARIO.EMPRE_CODIGO,
                                 FUNCIONARIO.SENHA_NIVEL) then
         begin
              FUNCIONARIO.MENU_ATUAL := 'GER020300000000000000';
              sSistemaExecutavel := sCaminhoExe+'\pFinanceiro.exe';
              if FileExists(sSistemaExecutavel) then
                  ShellExecute(frmMenuPrincipal.Handle,'open',
                               PChar(sSistemaExecutavel),
                               PChar(IntToStr(FUNCIONARIO.EMPRE_CODIGO)+' '+
                                     FUNCIONARIO.FUNC_CODIGO+' '+
                                     (FUNCIONARIO.SENHA_SENHA)),
                               '',SW_SHOWNORMAL)
              else
                  Informacao('Execução do Sistema não foi possível...'+#13+
                             'Arquivo executável não encontrado...','Aviso...');
         end;
    end
    else
        Informacao('Execução do Sistema não foi possível...'+#13+
                   'Favor executar LOGIN ...','Aviso...');
end;

procedure TfrmMenuPrincipal.GER020400000000000000Click(Sender: TObject);
begin
    if (FUNCIONARIO.EMPRE_CODIGO >= 0) and (Trim(FUNCIONARIO.FUNC_CODIGO) <> '') and
       (FUNCIONARIO.FUNC_RETORNOSENHA <> 'CANCELA') then
    begin
         if VerificaCadastroMenu(FUNCIONARIO.FUNC_CODIGO,'GER020400000000000000',
                                 FUNCIONARIO.EMPRE_CODIGO,
                                 FUNCIONARIO.SENHA_NIVEL) then
         begin
              FUNCIONARIO.MENU_ATUAL := 'GER020400000000000000';
              sSistemaExecutavel := sCaminhoExe+'\pFaturamento.exe';
              if FileExists(sSistemaExecutavel) then
                  ShellExecute(frmMenuPrincipal.Handle,'open',
                               PChar(sSistemaExecutavel),
                               PChar(IntToStr(FUNCIONARIO.EMPRE_CODIGO)+' '+
                                     FUNCIONARIO.FUNC_CODIGO+' '+
                                     (FUNCIONARIO.SENHA_SENHA)),
                               '',SW_SHOWNORMAL)
              else
                  Informacao('Execução do Sistema não foi possível...'+#13+
                             'Arquivo executável não encontrado...','Aviso...');
         end;
    end
    else
        Informacao('Execução do Sistema não foi possível...'+#13+
                   'Favor executar LOGIN ...','Aviso...');
end;

procedure TfrmMenuPrincipal.GER020500000000000000Click(Sender: TObject);
begin
    if (FUNCIONARIO.EMPRE_CODIGO >= 0) and (Trim(FUNCIONARIO.FUNC_CODIGO) <> '') and
       (FUNCIONARIO.FUNC_RETORNOSENHA <> 'CANCELA') then
    begin
         if VerificaCadastroMenu(FUNCIONARIO.FUNC_CODIGO,'GER020500000000000000',
                                 FUNCIONARIO.EMPRE_CODIGO,
                                 FUNCIONARIO.SENHA_NIVEL) then
         begin
              FUNCIONARIO.MENU_ATUAL := 'GER020500000000000000';
              sSistemaExecutavel := sCaminhoExe+'\pFiscais.exe';
              if FileExists(sSistemaExecutavel) then
                  ShellExecute(frmMenuPrincipal.Handle,'open',
                               PChar(sSistemaExecutavel),
                               PChar(IntToStr(FUNCIONARIO.EMPRE_CODIGO)+' '+
                                     FUNCIONARIO.FUNC_CODIGO+' '+
                                     (FUNCIONARIO.SENHA_SENHA)),
                               '',SW_SHOWNORMAL)
              else
                  Informacao('Execução do Sistema não foi possível...'+#13+
                             'Arquivo executável não encontrado...','Aviso...');
         end;
    end
    else
        Informacao('Execução do Sistema não foi possível...'+#13+
                   'Favor executar LOGIN ...','Aviso...');
end;

procedure TfrmMenuPrincipal.GER020600000000000000Click(Sender: TObject);
begin
    if (FUNCIONARIO.EMPRE_CODIGO >= 0) and (Trim(FUNCIONARIO.FUNC_CODIGO) <> '') and
       (FUNCIONARIO.FUNC_RETORNOSENHA <> 'CANCELA') then
    begin
         if VerificaCadastroMenu(FUNCIONARIO.FUNC_CODIGO,'GER020600000000000000',
                                 FUNCIONARIO.EMPRE_CODIGO,
                                 FUNCIONARIO.SENHA_NIVEL) then
         begin
              FUNCIONARIO.MENU_ATUAL := 'GER020600000000000000';
              sSistemaExecutavel := sCaminhoExe+'\pVendas.exe';
              if FileExists(sSistemaExecutavel) then
                  ShellExecute(frmMenuPrincipal.Handle,'open',
                               PChar(sSistemaExecutavel),
                               PChar(IntToStr(FUNCIONARIO.EMPRE_CODIGO)+' '+
                                     FUNCIONARIO.FUNC_CODIGO+' '+
                                     (FUNCIONARIO.SENHA_SENHA)),
                               '',SW_SHOWNORMAL)
              else
                  Informacao('Execução do Sistema não foi possível...'+#13+
                             'Arquivo executável não encontrado...','Aviso...');
         end;
    end
    else
        Informacao('Execução do Sistema não foi possível...'+#13+
                   'Favor executar LOGIN ...','Aviso...');
end;

procedure TfrmMenuPrincipal.GER020700000000000000Click(Sender: TObject);
begin
    if (FUNCIONARIO.EMPRE_CODIGO >= 0) and (Trim(FUNCIONARIO.FUNC_CODIGO) <> '') and
       (FUNCIONARIO.FUNC_RETORNOSENHA <> 'CANCELA') then
    begin
         if VerificaCadastroMenu(FUNCIONARIO.FUNC_CODIGO,'GER020700000000000000',
                                 FUNCIONARIO.EMPRE_CODIGO,
                                 FUNCIONARIO.SENHA_NIVEL) then
         begin
              FUNCIONARIO.MENU_ATUAL := 'GER020700000000000000';
              sSistemaExecutavel := sCaminhoExe+'\pCompras.exe';
              if FileExists(sSistemaExecutavel) then
                  ShellExecute(frmMenuPrincipal.Handle,'open',
                               PChar(sSistemaExecutavel),
                               PChar(IntToStr(FUNCIONARIO.EMPRE_CODIGO)+' '+
                                     FUNCIONARIO.FUNC_CODIGO+' '+
                                     (FUNCIONARIO.SENHA_SENHA)),
                               '',SW_SHOWNORMAL)
              else
                  Informacao('Execução do Sistema não foi possível...'+#13+
                             'Arquivo executável não encontrado...','Aviso...');
         end;
    end
    else
        Informacao('Execução do Sistema não foi possível...'+#13+
                   'Favor executar LOGIN ...','Aviso...');
end;

procedure TfrmMenuPrincipal.GER020800000000000000Click(Sender: TObject);
begin
    if (FUNCIONARIO.EMPRE_CODIGO >= 0) and (Trim(FUNCIONARIO.FUNC_CODIGO) <> '') and
       (FUNCIONARIO.FUNC_RETORNOSENHA <> 'CANCELA') then
    begin
         if VerificaCadastroMenu(FUNCIONARIO.FUNC_CODIGO,'GER020800000000000000',
                                 FUNCIONARIO.EMPRE_CODIGO,
                                 FUNCIONARIO.SENHA_NIVEL) then
         begin
              FUNCIONARIO.MENU_ATUAL := 'GER020800000000000000';
              sSistemaExecutavel := sCaminhoExe+'\pCupom.exe';
              if FileExists(sSistemaExecutavel) then
                  ShellExecute(frmMenuPrincipal.Handle,'open',
                               PChar(sSistemaExecutavel),
                               PChar(IntToStr(FUNCIONARIO.EMPRE_CODIGO)+' '+
                                     FUNCIONARIO.FUNC_CODIGO+' '+
                                     (FUNCIONARIO.SENHA_SENHA)),
                               '',SW_SHOWNORMAL)
              else
                  Informacao('Execução do Sistema não foi possível...'+#13+
                             'Arquivo executável não encontrado...','Aviso...');
         end;
    end
    else
        Informacao('Execução do Sistema não foi possível...'+#13+
                   'Favor executar LOGIN ...','Aviso...');
end;

procedure TfrmMenuPrincipal.GER020900000000000000Click(Sender: TObject);
begin
    if (FUNCIONARIO.EMPRE_CODIGO >= 0) and (Trim(FUNCIONARIO.FUNC_CODIGO) <> '') and
       (FUNCIONARIO.FUNC_RETORNOSENHA <> 'CANCELA') then
    begin
         if VerificaCadastroMenu(FUNCIONARIO.FUNC_CODIGO,'GER020900000000000000',
                                 FUNCIONARIO.EMPRE_CODIGO,
                                 FUNCIONARIO.SENHA_NIVEL) then
         begin
              FUNCIONARIO.MENU_ATUAL := 'GER020900000000000000';
              sSistemaExecutavel := sCaminhoExe+'\pLogistica.exe';
              if FileExists(sSistemaExecutavel) then
                  ShellExecute(frmMenuPrincipal.Handle,'open',
                               PChar(sSistemaExecutavel),
                               PChar(IntToStr(FUNCIONARIO.EMPRE_CODIGO)+' '+
                                     FUNCIONARIO.FUNC_CODIGO+' '+
                                     (FUNCIONARIO.SENHA_SENHA)),
                               '',SW_SHOWNORMAL)
              else
                  Informacao('Execução do Sistema não foi possível...'+#13+
                             'Arquivo executável não encontrado...','Aviso...');
         end;
    end
    else
        Informacao('Execução do Sistema não foi possível...'+#13+
                   'Favor executar LOGIN ...','Aviso...');
end;

procedure TfrmMenuPrincipal.GER021100000000000000Click(Sender: TObject);
begin
    if (FUNCIONARIO.EMPRE_CODIGO >= 0) and (Trim(FUNCIONARIO.FUNC_CODIGO) <> '') and
       (FUNCIONARIO.FUNC_RETORNOSENHA <> 'CANCELA') then
    begin
         if VerificaCadastroMenu(FUNCIONARIO.FUNC_CODIGO,'GER021100000000000000',
                                 FUNCIONARIO.EMPRE_CODIGO,
                                 FUNCIONARIO.SENHA_NIVEL) then
         begin
              FUNCIONARIO.MENU_ATUAL := 'GER021100000000000000';
              sSistemaExecutavel := sCaminhoExe+'\pConfiguradores.exe';
              if FileExists(sSistemaExecutavel) then
                  ShellExecute(frmMenuPrincipal.Handle,'open',
                               PChar(sSistemaExecutavel),
                               PChar(IntToStr(FUNCIONARIO.EMPRE_CODIGO)+' '+
                                     FUNCIONARIO.FUNC_CODIGO+' '+
                                     (FUNCIONARIO.SENHA_SENHA)),
                               '',SW_SHOWNORMAL)
              else
                  Informacao('Execução do Sistema não foi possível...'+#13+
                             'Arquivo executável não encontrado...','Aviso...');
         end;
    end
    else
        Informacao('Execução do Sistema não foi possível...'+#13+
                   'Favor executar LOGIN ...','Aviso...');
end;

procedure TfrmMenuPrincipal.GER021200000000000000Click(Sender: TObject);
begin
    if (FUNCIONARIO.EMPRE_CODIGO >= 0) and (Trim(FUNCIONARIO.FUNC_CODIGO) <> '') and
       (FUNCIONARIO.FUNC_RETORNOSENHA <> 'CANCELA') then
    begin
         if VerificaCadastroMenu(FUNCIONARIO.FUNC_CODIGO,'GER021200000000000000',
                                 FUNCIONARIO.EMPRE_CODIGO,
                                 FUNCIONARIO.SENHA_NIVEL) then
         begin
              FUNCIONARIO.MENU_ATUAL := 'GER021200000000000000';
              sSistemaExecutavel := sCaminhoExe+'\pImportacao.exe';
              if FileExists(sSistemaExecutavel) then
                  ShellExecute(frmMenuPrincipal.Handle,'open',
                               PChar(sSistemaExecutavel),
                               PChar(IntToStr(FUNCIONARIO.EMPRE_CODIGO)+' '+
                                     FUNCIONARIO.FUNC_CODIGO+' '+
                                     (FUNCIONARIO.SENHA_SENHA)),
                               '',SW_SHOWNORMAL)
              else
                  Informacao('Execução do Sistema não foi possível...'+#13+
                             'Arquivo executável não encontrado...','Aviso...');
         end;
    end
    else
        Informacao('Execução do Sistema não foi possível...'+#13+
                   'Favor executar LOGIN ...','Aviso...');
end;

procedure TfrmMenuPrincipal.GER021300000000000000Click(Sender: TObject);
begin
    if (FUNCIONARIO.EMPRE_CODIGO >= 0) and (Trim(FUNCIONARIO.FUNC_CODIGO) <> '') and
       (FUNCIONARIO.FUNC_RETORNOSENHA <> 'CANCELA') then
    begin
         if VerificaCadastroMenu(FUNCIONARIO.FUNC_CODIGO,'GER021300000000000000',
                                 FUNCIONARIO.EMPRE_CODIGO,
                                 FUNCIONARIO.SENHA_NIVEL) then
         begin
              FUNCIONARIO.MENU_ATUAL := 'GER021300000000000000';
              sSistemaExecutavel := sCaminhoExe+'\pSped.exe';
              if FileExists(sSistemaExecutavel) then
                  ShellExecute(frmMenuPrincipal.Handle,'open',
                               PChar(sSistemaExecutavel),
                               PChar(IntToStr(FUNCIONARIO.EMPRE_CODIGO)+' '+
                                     FUNCIONARIO.FUNC_CODIGO+' '+
                                     (FUNCIONARIO.SENHA_SENHA)),
                               '',SW_SHOWNORMAL)
              else
                  Informacao('Execução do Sistema não foi possível...'+#13+
                             'Arquivo executável não encontrado...','Aviso...');
         end;
    end
    else
        Informacao('Execução do Sistema não foi possível...'+#13+
                   'Favor executar LOGIN ...','Aviso...');
end;

procedure TfrmMenuPrincipal.GER021400000000000000Click(Sender: TObject);
begin
    if (FUNCIONARIO.EMPRE_CODIGO >= 0) and (Trim(FUNCIONARIO.FUNC_CODIGO) <> '') and
       (FUNCIONARIO.FUNC_RETORNOSENHA <> 'CANCELA') then
    begin
         if VerificaCadastroMenu(FUNCIONARIO.FUNC_CODIGO,'GER021400000000000000',
                                 FUNCIONARIO.EMPRE_CODIGO,
                                 FUNCIONARIO.SENHA_NIVEL) then
         begin
              FUNCIONARIO.MENU_ATUAL := 'GER021400000000000000';
              sSistemaExecutavel := sCaminhoExe+'\pEtiquetas.exe';
              if FileExists(sSistemaExecutavel) then
                  ShellExecute(frmMenuPrincipal.Handle,'open',
                               PChar(sSistemaExecutavel),
                               PChar(IntToStr(FUNCIONARIO.EMPRE_CODIGO)+' '+
                                     FUNCIONARIO.FUNC_CODIGO+' '+
                                     (FUNCIONARIO.SENHA_SENHA)),
                               '',SW_SHOWNORMAL)
              else
                  Informacao('Execução do Sistema não foi possível...'+#13+
                             'Arquivo executável não encontrado...','Aviso...');
         end;
    end
    else
        Informacao('Execução do Sistema não foi possível...'+#13+
                   'Favor executar LOGIN ...','Aviso...');
end;

procedure TfrmMenuPrincipal.GER021500000000000000Click(Sender: TObject);
begin
    if (FUNCIONARIO.EMPRE_CODIGO >= 0) and (Trim(FUNCIONARIO.FUNC_CODIGO) <> '') and
       (FUNCIONARIO.FUNC_RETORNOSENHA <> 'CANCELA') then
    begin
         if VerificaCadastroMenu(FUNCIONARIO.FUNC_CODIGO,'GER021500000000000000',
                                 FUNCIONARIO.EMPRE_CODIGO,
                                 FUNCIONARIO.SENHA_NIVEL) then
         begin
              FUNCIONARIO.MENU_ATUAL := 'GER021500000000000000';
              sSistemaExecutavel := sCaminhoExe+'\pControleAdm.exe';
              if FileExists(sSistemaExecutavel) then
                  ShellExecute(frmMenuPrincipal.Handle,'open',
                               PChar(sSistemaExecutavel),
                               PChar(IntToStr(FUNCIONARIO.EMPRE_CODIGO)+' '+
                                     FUNCIONARIO.FUNC_CODIGO+' '+
                                     (FUNCIONARIO.SENHA_SENHA)),
                               '',SW_SHOWNORMAL)
              else
                  Informacao('Execução do Sistema não foi possível...'+#13+
                             'Arquivo executável não encontrado...','Aviso...');
         end;
    end
    else
        Informacao('Execução do Sistema não foi possível...'+#13+
                   'Favor executar LOGIN ...','Aviso...');
end;

procedure TfrmMenuPrincipal.GER021600000000000000Click(Sender: TObject);
begin
    if (FUNCIONARIO.EMPRE_CODIGO >= 0) and (Trim(FUNCIONARIO.FUNC_CODIGO) <> '') and
       (FUNCIONARIO.FUNC_RETORNOSENHA <> 'CANCELA') then
    begin
         if VerificaCadastroMenu(FUNCIONARIO.FUNC_CODIGO,'GER021600000000000000',
                                 FUNCIONARIO.EMPRE_CODIGO,
                                 FUNCIONARIO.SENHA_NIVEL) then
         begin
              FUNCIONARIO.MENU_ATUAL := 'GER021600000000000000';
              sSistemaExecutavel := sCaminhoExe+'\pMdfe.exe';
              if FileExists(sSistemaExecutavel) then
                  ShellExecute(frmMenuPrincipal.Handle,'open',
                               PChar(sSistemaExecutavel),
                               PChar(IntToStr(FUNCIONARIO.EMPRE_CODIGO)+' '+
                                     FUNCIONARIO.FUNC_CODIGO+' '+
                                     (FUNCIONARIO.SENHA_SENHA)),
                               '',SW_SHOWNORMAL)
              else
                  Informacao('Execução do Sistema não foi possível...'+#13+
                             'Arquivo executável não encontrado...','Aviso...');
         end;
    end
    else
        Informacao('Execução do Sistema não foi possível...'+#13+
                   'Favor executar LOGIN ...','Aviso...');
end;

procedure TfrmMenuPrincipal.GER021000000000000000Click(Sender: TObject);
begin
    if (FUNCIONARIO.EMPRE_CODIGO >= 0) and (Trim(FUNCIONARIO.FUNC_CODIGO) <> '') and
       (FUNCIONARIO.FUNC_RETORNOSENHA <> 'CANCELA') then
    begin
         if VerificaCadastroMenu(FUNCIONARIO.FUNC_CODIGO,'GER021000000000000000',
                                 FUNCIONARIO.EMPRE_CODIGO,
                                 FUNCIONARIO.SENHA_NIVEL) then
         begin
              FUNCIONARIO.MENU_ATUAL := 'GER021000000000000000';
              sSistemaExecutavel := sCaminhoExe+'\pTablet.exe';
              if FileExists(sSistemaExecutavel) then
                  ShellExecute(frmMenuPrincipal.Handle,'open',
                               PChar(sSistemaExecutavel),
                               PChar(IntToStr(FUNCIONARIO.EMPRE_CODIGO)+' '+
                                     FUNCIONARIO.FUNC_CODIGO+' '+
                                     (FUNCIONARIO.SENHA_SENHA)),
                               '',SW_SHOWNORMAL)
              else
                  Informacao('Execução do Sistema não foi possível...'+#13+
                             'Arquivo executável não encontrado...','Aviso...');
         end;
    end
    else
        Informacao('Execução do Sistema não foi possível...'+#13+
                   'Favor executar LOGIN ...','Aviso...');
end;

procedure TfrmMenuPrincipal.GER030100000000000000Click(Sender: TObject);
begin
    ShellExecute(Application.Handle, 'open', PChar('https://www.teamviewer.com/pt-br/download/windows/'), nil, nil, 0);
end;

procedure TfrmMenuPrincipal.GER030400000000000000Click(Sender: TObject);
begin
    ShellExecute(Application.Handle, 'open', PChar('https://anydesk.com/pt/downloads/windows'), nil, nil, 0);
end;

procedure TfrmMenuPrincipal.Image4Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmMenuPrincipal.lblSiteClick(Sender: TObject);
begin
    ShellExecute(Application.Handle, 'open', PChar(lblSite.Caption), nil, nil, 0);
end;

procedure TfrmMenuPrincipal.lblSiteMouseLeave(Sender: TObject);
begin
    TLabel(Sender).Font.Color := clWindow;
    TLabel(Sender).Font.Style := [];
end;

procedure TfrmMenuPrincipal.lblSiteMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    TLabel(Sender).Font.Color := $00FE8E67;
    TLabel(Sender).Font.Style := [fsUnderline];
end;

procedure TfrmMenuPrincipal.Backgroud1Click(Sender: TObject);
begin
    imgBackground.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'BACKGROUND\background1.jpg');
    //Panel10.Color := $0083671D;
    Panel10.Color := $00BFAC54;

end;

procedure TfrmMenuPrincipal.Backgroud2Click(Sender: TObject);
begin
    imgBackground.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'BACKGROUND\background2.jpg');
    Panel10.Color := $00260B0E;
end;

procedure TfrmMenuPrincipal.Backgroud3Click(Sender: TObject);
begin
    imgBackground.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'BACKGROUND\background3.jpg');
    //Panel10.Color := $008C5A08;
    Panel10.Color := $00402802;
end;

procedure TfrmMenuPrincipal.Panel9Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmMenuPrincipal.Timer1Timer(Sender: TObject);
begin
    //stbMenu.Panels[2].Text := FormatDateTime('dd/mm/yyyy',Now);
    //stbMenu.Panels[3].Text := FormatDateTime('hh:mm:ss',Now);
end;

procedure TfrmMenuPrincipal.tmrRelogioTimer(Sender: TObject);
begin
    lblHora.Caption := FormatDateTime('hh:mm:ss', Now);
end;

procedure TfrmMenuPrincipal.Pega_Usuario(var pFuncCodigo,pSenhaSenha,pEmpresa : String; out pRetorno : String);
var bAuxConfigura : Boolean;

begin
     pRetorno := 'OK';
     // Pega dados do usuario...
     if dtmSisGestao.FdConnection.InTransaction then
       dtmSisGestao.FdConnection.Commit;
    dtmSisGestao.FdConnection.StartTransaction;
     dtmSisGestao.FdQryGeralDados.Active := False;
     dtmSisGestao.FdQryGeralDados.SQL.Clear;
     dtmSisGestao.FdQryGeralDados.SQL.Text := sSQLSelecionaUsuario;
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('FUNCCODIGO').AsString := pFuncCodigo;
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('EMPRECODIGO').AsInteger := StrToInt(pEmpresa);
     // Seleciona dados do funcionario...
     dtmSisGestao.FdQryGeralDados.Active := True;
     if dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CODIGO').IsNull then
        pRetorno := 'FALHA';
     // Verifica a senha...
     if (pSenhaSenha <> Trim(Decripta_Email(dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SENHA').AsString))) then
     begin
          pRetorno := 'FALHA';
          dtmSisGestao.FdConnection.Rollback;
     end;
     // Verifica se o usuário tem acesso ao sistema....
     if (dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SISTEMA').IsNull) or
        (dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SISTEMA').AsInteger = 1) then
     begin
          Informacao('Usuário sem acesso ao SISTEMA...','Aviso...');
          Application.Terminate;
          Exit;
     end;
     // Passagem de dados para a estrutura de usuarios...
     FUNCIONARIO.EMPRE_CODIGO               := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_CODIGO').AsInteger;
     FUNCIONARIO.FUNC_CODIGO                := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CODIGO').AsString;
     FUNCIONARIO.FUNC_NOME                  := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NOME').AsString;
     FUNCIONARIO.FUNC_ENDERECO              := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_ENDERECO').AsString;
     FUNCIONARIO.FUNC_NUMERO                := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NUMERO').AsString;
     FUNCIONARIO.FUNC_COMPLEMENTO           := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_COMPLEMENTO').AsString;
     FUNCIONARIO.FUNC_BAIRRO                := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_BAIRRO').AsString;
     FUNCIONARIO.FUNC_CEP                   := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CEP').AsString;
     FUNCIONARIO.CIDADE_CODDNE              := dtmSisGestao.FdQryGeralDados.FieldByName('CIDADE_CODDNE').AsInteger;
     FUNCIONARIO.FUNC_TELFIXO               := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TELFIXO').AsString;
     FUNCIONARIO.FUNC_TELCELULAR            := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TELCELULAR').AsString;
     FUNCIONARIO.FUNC_SEXO                  := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SEXO').AsString;
     FUNCIONARIO.FUNC_EMAIL                 := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_EMAIL').AsString;
     FUNCIONARIO.FUNC_CTPSNUMERO            := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CTPSNUMERO').AsString;
     FUNCIONARIO.FUNC_CPF                   := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CPF').AsString;
     FUNCIONARIO.FUNC_TITELEITORALNUMERO    := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TITELEITORALNUMERO').AsString;
     FUNCIONARIO.FUNC_TITELEITORALZONA      := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TITELEITORALZONA').AsString;
     FUNCIONARIO.FUNC_TITELEITORALNUMERO    := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TITELEITORALSECAO').AsString;
     FUNCIONARIO.FUNC_IDENTIDADE            := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_IDENTIDADE').AsString;
     FUNCIONARIO.FUNC_ORGAOEMISSOR          := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_ORGAOEMISSOR').AsString;
     FUNCIONARIO.FUNC_DATAADMISSAO          := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_DATAADMISSAO').AsDateTime;
     FUNCIONARIO.FUNC_DATADEMISSAO          := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_DATADEMISSAO').AsDateTime;
     FUNCIONARIO.CARGO_CODIGO               := dtmSisGestao.FdQryGeralDados.FieldByName('CARGO_CODIGO').AsInteger;
     FUNCIONARIO.FUNC_NASCIMENTO            := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NASCIMENTO').AsDateTime;
     FUNCIONARIO.FUNC_NACIONALIDADE         := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NACIONALIDADE').AsString;
     FUNCIONARIO.FUNC_GRAUINSTRUCAO         := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_GRAUINSTRUCAO').AsString;
     FUNCIONARIO.FUNC_ESTADOCIVIL           := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_ESTADOCIVIL').AsString;
     FUNCIONARIO.FUNC_NOMECONJUGE           := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NOMECONJUGE').AsString;
     FUNCIONARIO.FUNC_HABILITACAO           := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_HABILITACAO').AsString;
     FUNCIONARIO.FUNC_CATEGORIA             := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CATEGORIA').AsString;
     FUNCIONARIO.FUNC_VALIDADE              := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_VALIDADE').AsDateTime;
     FUNCIONARIO.FUNC_PRIMHABILITACAO       := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_PRIMHABILITACAO').AsDateTime;
     FUNCIONARIO.FUNC_SISTEMA               := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SISTEMA').AsString;
     FUNCIONARIO.FUNC_CERTMILITAR_SERIE     := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CERTMILITAR_SERIE').AsString;
     FUNCIONARIO.FUNC_CERTMILITAR_CATEGORIA := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CERTMILITAR_CATEGORIA').AsString;
     FUNCIONARIO.FUNC_FILIACAO_MAE          := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FILIACAO_MAE').AsString;
     FUNCIONARIO.FUNC_FILIACAO_PAI          := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FILIACAO_PAI').AsString;
     FUNCIONARIO.FUNC_FGTS_OPTANTE          := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FGTS_OPTANTE').AsString;
     FUNCIONARIO.FUNC_FGTS_DATAOPCAO        := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FGTS_DATAOPCAO').AsDateTime;
     FUNCIONARIO.FUNC_FGTS_DATARETRATACAO   := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FGTS_DATARETRATACAO').AsDateTime;
     FUNCIONARIO.FUNC_FGTS_BANCODEPOSITARIO := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_FGTS_BANCODEPOSITARIO').AsInteger;
     FUNCIONARIO.FUNC_PIS_DATACADASTRO      := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NASCIMENTO').AsDateTime;
     FUNCIONARIO.FUNC_PIS_NUMERO            := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_PIS_NUMERO').AsString;
     FUNCIONARIO.BANCO_CODIGO               := dtmSisGestao.FdQryGeralDados.FieldByName('BANCO_CODIGO').AsInteger;
     FUNCIONARIO.FUNC_BANCOAGENCIA          := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_BANCOAGENCIA').AsInteger;
     FUNCIONARIO.FUNC_BANCOCONTA            := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_BANCOCONTA').AsString;
     FUNCIONARIO.SENHA_SENHA                := Decripta_Email(dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SENHA').AsString);
     FUNCIONARIO.SENHA_NIVEL                := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NIVEL').AsString;
     FUNCIONARIO.FUNC_BOTOES                := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_BOTOES').AsString;
     FUNCIONARIO.FUNC_TIPO_USU              := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TIPO_USU').AsString;
     if dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CORCAMPOS').IsNull then
        FUNCIONARIO.SENHA_CORCAMPOS := clSkyBlue
     else
         FUNCIONARIO.SENHA_CORCAMPOS := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CORCAMPOS').AsInteger;
     FUNCIONARIO.SENHA_SKIN := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SKIN').AsString;
     if dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SKIN').IsNull then
        FUNCIONARIO.SENHA_SKIN := 'macos.skn';
     // Seleciona os dados da empresa ...
     // Seleciona o usuario escolhido....
     dtmSisGestao.FdQryGeralDados.Active := False;
     dtmSisGestao.FdQryGeralDados.SQL.Clear;
     dtmSisGestao.FdQryGeralDados.SQL.Text :=
          'select * from geral_funcionario,geral_empresa,geral_cidade '+
          'where ((geral_funcionario.empre_codigo = geral_empresa.empre_codigo) and '+
          '       (geral_empresa.cidade_coddne = geral_cidade.cidade_coddne) and '+
          '       (geral_funcionario.func_codigo = :funccodigo) and '+
          '       (geral_funcionario.empre_codigo = :emprecodigo))';
     dtmSisGestao.FdQryGeralDados.params.parambyname('funccodigo').asstring := FUNCIONARIO.func_codigo;
     dtmSisGestao.FdQryGeralDados.params.parambyname('emprecodigo').asinteger := FUNCIONARIO.empre_codigo;
     dtmSisGestao.FdQryGeralDados.Active := True;
     if (dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NOME').IsNull) then
        pRetorno := 'FALHA';
     // Passagem de dados para a estrutura de usuarios...
     FUNCIONARIO.EMPRE_RAZAOSOCIAL  := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_RAZAOSOCIAL').AsString;
     FUNCIONARIO.EMPRE_CNPJ         := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_CNPJ').AsString;
     FUNCIONARIO.EMPRE_INSCESTADUAL := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_INSCESTADUAL').AsString;
     FUNCIONARIO.EMPRE_UF           := dtmSisGestao.FdQryGeralDados.FieldByName('CIDADE_UF').AsString;
     FUNCIONARIO.EMPRE_LOGOTIPO     := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_LOGOTIPO').AsString;
     try
        FUNCIONARIO.EMPRE_ESPECIFICA  := StrToInt(Trim(dtmSisGestao.FdQryGeralDados.fieldbyname('empre_especifica').asstring));
     except
        FUNCIONARIO.EMPRE_ESPECIFICA  := 0;
     end;
     FUNCIONARIO.FUNC_RETORNOSENHA  := pRetorno;

     dtmSisGestao.FdQryGeralDados.Active := False;
     // ler configurador geral
     bAuxConfigura := dtmSisGestao.Carrega_Config_Geral;
end;
procedure TfrmMenuPrincipal.Menus(out pRetorno : String);
var
   iNivel01,iNivel02,iNivel03,iNivel04,iNivel05,iProgresso,iMaximo : Integer;
   Item : TButtonItem;
   IndexItem : Integer;
begin

     pRetorno := 'OK';
     // Se for o caso, cadastra os menus no acesso para o usuario selecionado...
     if dtmSisGestao.FdConnection.InTransaction then
       dtmSisGestao.FdConnection.Commit;
    dtmSisGestao.FdConnection.StartTransaction;
     // Seleciona os menus que não estão cadastrados para o usuário logado...
     dtmSisGestao.FdQryGeralDados.Active := False;
     dtmSisGestao.FdQryGeralDados.SQL.Clear;
     dtmSisGestao.FdQryGeralDados.SQL.Text := 'select geral_menu.menu_codigo from geral_menu '+
                                               '         left outer join geral_acesso '+
                                               '              on (geral_menu.menu_codigo = geral_acesso.menu_codigo and '+
                                               '                  geral_acesso.empre_codigo = :emprecodigo and '+
                                               '                  geral_acesso.func_codigo = :funccodigo) and'+
                                               '                   geral_menu.MENU_MODULO = 00 '+
                                               'order by geral_menu.menu_codigo';
     dtmSisGestao.FdQryGeralDados.params.parambyname('funccodigo').asstring    := FUNCIONARIO.func_codigo;
     dtmSisGestao.FdQryGeralDados.params.parambyname('emprecodigo').asinteger  := FUNCIONARIO.empre_codigo;
     dtmSisGestao.FdQryGeralDados.Active := True;
     // SQL para inserir os menus que o funcionario não tenha...
     while not dtmSisGestao.FdQryGeralDados.Eof do
     begin
          Application.ProcessMessages;
          dtmSisGestao.FdQryConsulta.Active := False;
          dtmSisGestao.FdQryConsulta.SQL.Clear;
          dtmSisGestao.FdQryConsulta.SQL.Text :=
               'insert into geral_acesso(func_codigo,empre_codigo,menu_codigo,acesso_nivel) '+
               'values(:func_codigo,:empre_codigo,:menu_codigo,:acesso_nivel) '+
                   'on duplicate key update func_codigo = :funccodigo, '+
                   '                        empre_codigo = :emprecodigo';
          dtmSisGestao.FdQryConsulta.params.parambyname('func_codigo').asstring    := FUNCIONARIO.func_codigo;
          dtmSisGestao.FdQryConsulta.params.parambyname('empre_codigo').asinteger  := FUNCIONARIO.empre_codigo;
          dtmSisGestao.FdQryConsulta.params.parambyname('menu_codigo').asstring    := dtmSisGestao.FdQryGeralDados.fieldbyname('menu_codigo').asstring;
          dtmSisGestao.FdQryConsulta.params.parambyname('acesso_nivel').asstring   := (FUNCIONARIO.senha_nivel);
          dtmSisGestao.FdQryConsulta.params.parambyname('funccodigo').asstring     := FUNCIONARIO.func_codigo;
          dtmSisGestao.FdQryConsulta.params.parambyname('emprecodigo').asinteger   := FUNCIONARIO.empre_codigo;
          try
             dtmSisGestao.FdQryConsulta.Execute;
          except
          end;
          dtmSisGestao.FdQryGeralDados.Next;
     end;
     dtmSisGestao.FdConnection.Commit;
     dtmSisGestao.FdConnection.StartTransaction;
     dtmSisGestao.FdQryGeralDados.Active := False;
     dtmSisGestao.FdQryGeralDados.SQL.Clear;
     dtmSisGestao.FdQryGeralDados.SQL.Text := sSQLSelecionaMenus + ' AND geral_menu.MENU_MODULO = 00 order by geral_menu.menu_codigo';
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('FUNCCODIGO').AsString := FUNCIONARIO.FUNC_CODIGO;
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('EMPRECODIGO').AsFloat := FUNCIONARIO.EMPRE_CODIGO;
     dtmSisGestao.FdQryGeralDados.Active := True;
     if dtmSisGestao.FdQryGeralDados.FieldByName('MENU_CODIGO').IsNull then
     begin
          pRetorno := 'FALHA';
       //   Informacao('Menus não cadastrados...','Aviso...'); Exit;
     end;

     ctbMenu.Visible := True;
     ctbMenu.Categories[0].Items.Clear;
     IndexItem := 0;

     iMaximo:= dtmSisGestao.FdQryGeralDados.RecordCount;
     dtmSisGestao.FdQryGeralDados.First;
     // Lê os acessos para o funcionário logado....
     while not dtmSisGestao.FdQryGeralDados.Eof do
     begin
         Application.ProcessMessages;
          for iNivel01 := 0 to mnuGerenciador.Items.Count-1 do
          begin
             Inc(iProgresso);
             Application.ProcessMessages;
               // Mostra / oculta menu de acordo com o acesso do funcionario...
               if UpperCase(mnuGerenciador.Items.Items[iNivel01].Name) =
                  dtmSisGestao.FdQryGeralDados.FieldByName('MENU_CODIGO').AsString then
               begin
                  IF dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S' THEN
                  begin
                        mnuGerenciador.Items.Items[iNivel01].Visible :=
                                 (dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S');

                        //cadastros
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020100000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actCadastros;
                                end;
                                //estoque
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020200000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actEstoque;
                                end;
                                //financeiro
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020300000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actFinanceiro;
                                end;
                                // compras
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020700000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actCompras;
                                end;
                                //Faturamento
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020400000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actFaturamento;
                                end;
                                //fiscal
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020500000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actFiscal;
                                end;
                                //vendas
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020600000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actVendas;
                                end;
                                //cupom
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020800000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actCupom;
                                end;
                                //logistica
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020900000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actLogistica;
                                end;
                                //palm
                                {if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021000000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actForca_Vendas;
                                end;}
                                //configuradores
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021100000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actConfiguradores;
                                end;
                                //importação
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021200000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actImportacao;
                                end;
                                //ecd
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021300000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actECD_Sped;
                                end;
                                //etiquetas
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021400000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actEtiquetas;
                                end;

                                //Administrativo
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021500000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actAdministrativo;
                                end;
                                //força de vendas
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021000000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actForca_Vendas;
                                end;
                                //MDF-e
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021600000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actMDFe;
                                end;

                  end;
                    Continue;
               end;
               for iNivel02 := 0 to mnuGerenciador.Items[iNivel01].Count-1 do
               begin
                     Application.ProcessMessages;
                    // Se o caption for um traço ('-'), é provavelmente uma linha de baixo relevo...
                    if mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Caption = '-' then
                       Continue;
                    // Mostra / oculta menu de acordo com o aceso do funcionario...
                    if UpperCase(mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Name) =
                       dtmSisGestao.FdQryGeralDados.FieldByName('MENU_CODIGO').AsString then
                    begin
                         IF dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S' THEN
                         begin
                               mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Visible :=
                                            (dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S');

                                //cadastros
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020100000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actCadastros;
                                end;
                                //estoque
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020200000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actEstoque;
                                end;
                                //financeiro
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020300000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actFinanceiro;
                                end;
                                // compras
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020700000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actCompras;
                                end;
                                //Faturamento
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020400000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actFaturamento;
                                end;
                                //fiscal
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020500000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actFiscal;
                                end;
                                //vendas
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020600000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actVendas;
                                end;
                                //cupom
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020800000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actCupom;
                                end;
                                //logistica
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020900000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actLogistica;
                                end;
                                //palm
                                {if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021000000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actForca_Vendas;
                                end;}
                                //configuradores
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021100000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actConfiguradores;
                                end;
                                //importação
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021200000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actImportacao;
                                end;
                                //ecd
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021300000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actECD_Sped;
                                end;
                                //etiquetas
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021400000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actEtiquetas;
                                end;

                                //Administrativo
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021500000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actAdministrativo;
                                end;
                                //força de vendas
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021000000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actForca_Vendas;
                                end;
                                 //MDF-e
                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021600000000000000' then
                                begin
                                    Inc(IndexItem);
                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actMDFe;
                                end;

                         end;
                         Break;
                    end;

                    if mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Count > 0 then
                       for iNivel03 := 0 to mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Count-1 do
                       begin
                           Application.ProcessMessages;
                            // Se o caption for um traço ('-'), é provavelmente uma linha de baixo relevo...
                            if mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Caption = '-' then
                               Continue;
                            // Mostra / oculta menu de acordo com o aceso do funcionario...
                            if UpperCase(mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Name) =
                               dtmSisGestao.FdQryGeralDados.FieldByName('MENU_CODIGO').AsString then
                            begin
                               IF dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S' THEN

                                 mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Visible :=
                                              (dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S');
                                                       IF dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S' THEN
                               begin
                                   mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Visible :=
                                             (dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S');


                                    //cadastros
                                    if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020100000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actCadastros;
                                    end;
                                    //estoque
                                    if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020200000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actEstoque;
                                    end;
                                    //financeiro
                                    if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020300000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actFinanceiro;
                                    end;
                                    // compras
                                    if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020700000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actCompras;
                                    end;
                                    //Faturamento
                                    if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020400000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actFaturamento;
                                    end;
                                    //fiscal
                                    if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020500000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actFiscal;
                                    end;
                                    //vendas
                                    if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020600000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actVendas;
                                    end;
                                    //cupom
                                    if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020800000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actCupom;
                                    end;
                                    //logistica
                                    if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020900000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actLogistica;
                                    end;
                                    //palm
                                    {if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021000000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actForca_Vendas;
                                    end;}
                                    //configuradores
                                    if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021100000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actConfiguradores;
                                    end;
                                    //importação
                                    if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021200000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actImportacao;
                                    end;
                                    //ecd
                                    if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021300000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actECD_Sped;
                                    end;
                                    //etiquetas
                                    if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021400000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actEtiquetas;
                                    end;

                                    //Administrativo
                                    if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021500000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actAdministrativo;
                                    end;
                                    //força de vendas
                                    if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021000000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actForca_Vendas;
                                    end;
                                     //MDF-e
                                    if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021600000000000000' then
                                    begin
                                        Inc(IndexItem);
                                        ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                        ctbMenu.Categories[0].Items[IndexItem -1].Action := actMDFe;
                                    end;


                               end;
                                 Break;
                            end;
                            if mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Count > 0 then
                               for iNivel04 := 0 to mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Count-1 do
                               begin
                                      Application.ProcessMessages;
                                    // Se o caption for um traço ('-'), é provavelmente um alinha de baixo relevo...
                                    if mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Caption = '-' then
                                       Continue;
                                    // Mostra / oculta menu de acordo com o aceso do funcionario...
                                    if UpperCase(mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Name) =
                                       dtmSisGestao.FdQryGeralDados.FieldByName('MENU_CODIGO').AsString then
                                    begin
                                        IF dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S' THEN
                                            mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Visible :=
                                                      (dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S');


                                        IF dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S' THEN
                                        begin
                                              mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Visible :=
                                              (dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S');

                                                //cadastros
                                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020100000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actCadastros;
                                                end;
                                                //estoque
                                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020200000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actEstoque;
                                                end;
                                                //financeiro
                                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020300000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actFinanceiro;
                                                end;
                                                // compras
                                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020700000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actCompras;
                                                end;
                                                //Faturamento
                                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020400000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actFaturamento;
                                                end;
                                                //fiscal
                                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020500000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actFiscal;
                                                end;
                                                //vendas
                                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020600000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actVendas;
                                                end;
                                                //cupom
                                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020800000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actCupom;
                                                end;
                                                //logistica
                                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020900000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actLogistica;
                                                end;
                                                //PALM
                                                {if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021000000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actForca_Vendas;
                                                end;}
                                                //configuradores
                                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021100000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actConfiguradores;
                                                end;
                                                //importação
                                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021200000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actImportacao;
                                                end;
                                                //ecd
                                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021300000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actECD_Sped;
                                                end;
                                                //etiquetas
                                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021400000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actEtiquetas;
                                                end;

                                                //administrativo
                                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021500000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actAdministrativo;
                                                end;
                                                //força de vendas
                                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021000000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actForca_Vendas;
                                                end;
                                                 //MDF-e
                                                if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021600000000000000' then
                                                begin
                                                    Inc(IndexItem);
                                                    ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                    ctbMenu.Categories[0].Items[IndexItem -1].Action := actMDFe;
                                                end;

                                        end;
                                         Break;
                                    end;
                                    if mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Count > 0 then
                                       for iNivel05 := 0 to mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Count-1 do
                                       begin
                                         Application.ProcessMessages;
                                            // Se o caption for um traço ('-'), é provavelmente um alinha de baixo relevo...
                                            if mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Items[iNivel05].Caption = '-' then
                                               Continue;
                                            // Mostra  oculta menu de acordo com o aceso do funcionario...
                                            if UpperCase(mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Items[iNivel05].Name) =
                                               dtmSisGestao.FdQryGeralDados.FieldByName('MENU_CODIGO').AsString then
                                            begin
                                                IF dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S' THEN
                                                begin
                                                     mnuGerenciador.Items.Items[iNivel01].Items[iNivel02].Items[iNivel03].Items[iNivel04].Items[iNivel05].Visible :=
                                                              (dtmSisGestao.FdQryGeralDados.FieldByName('ACESSO_NIVEL').AsString = 'S');


                                                        //cadastros
                                                        if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020100000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actCadastros;
                                                        end;
                                                        //estoque
                                                        if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020200000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actEstoque;
                                                        end;
                                                        //financeiro
                                                        if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020300000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actFinanceiro;
                                                        end;
                                                        // compras
                                                        if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020700000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actCompras;
                                                        end;
                                                        //Faturamento
                                                        if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020400000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actFaturamento;
                                                        end;
                                                        //fiscal
                                                        if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020500000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actFiscal;
                                                        end;
                                                        //vendas
                                                        if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020600000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actVendas;
                                                        end;
                                                        //cupom
                                                        if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020800000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actCupom;
                                                        end;
                                                        //logistica
                                                        if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER020900000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actLogistica;
                                                        end;
                                                        //palm
                                                        {if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021000000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actForca_Vendas;
                                                        end;}
                                                        //configuradores
                                                        if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021100000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actConfiguradores;
                                                        end;
                                                        //importação
                                                        if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021200000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actImportacao;
                                                        end;
                                                        //ecd
                                                        if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021300000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actECD_Sped;
                                                        end;
                                                        //etiquetas
                                                        if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021400000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actEtiquetas;
                                                        end;

                                                        //Administrativo
                                                        if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021500000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actAdministrativo;
                                                        end;

                                                        //força de vendas
                                                        if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021000000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actForca_Vendas;
                                                        end;
                                                         //MDF-e
                                                        if  dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').AsString  = 'GER021600000000000000' then
                                                        begin
                                                            Inc(IndexItem);
                                                            ctbMenu.Categories[0].Items.AddItem(Item, IndexItem -1);
                                                            ctbMenu.Categories[0].Items[IndexItem -1].Action := actMDFe;
                                                        end;

                                                     Continue;
                                               end;

                                                 Break;
                                            end;
                                       end;
                               end;
                       end;
               end;
          end;
          Application.ProcessMessages;
          dtmSisGestao.FdQryGeralDados.Next;
     end;
  //   ProgCarrega.Position:= 0;
     dtmSisGestao.FdQryGeralDados.Active := False;
     dtmSisGestao.FdConnection.Commit;
     GER010100000000000000.Enabled := False; // LogIn...
     GER010200000000000000.Enabled := True; // LogOut...
end;
procedure TfrmMenuPrincipal.Relatorio_Analise_Devedor;
var bSegueAnalise   : Boolean;
    sAuxRelatorio   : String;
    dTotalDevedores : Double;
begin
   bSegueAnalise := False;
   // AVALIA SE É O PRIMEIRO LOGIN DO DIA
   dtmSisGestao.FdQryGeralDados.Active := False;
   dtmSisGestao.FdQryGeralDados.SQL.Clear;
   dtmSisGestao.FdQryGeralDados.SQL.Text := LowerCase('SELECT * FROM ANALISE_DEVEDOR '+
                                                       'WHERE (EMPRE_CODIGO = :EMPRECODIGO) AND (ADEV_DATA = :HOJE) ');
   dtmSisGestao.FdQryGeralDados.Params.ParamByName('EMPRECODIGO').AsInteger := FUNCIONARIO.EMPRE_CODIGO;
   dtmSisGestao.FdQryGeralDados.Params.ParamByName('HOJE').AsDate           := Date;
   dtmSisGestao.FdQryGeralDados.Active := True;
   if (dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_CODIGO').IsNull) then
      bSegueAnalise := True;
   // CASO AINDA NÃO TENHA SIDO FEITA A ANÁLISE DE DEVEDOR DO CLIENTE - FEITA NO PRIMEIRO LOGIN DO SISTEMA
   if bSegueAnalise then
   begin
      sAuxRelatorio := 'S';
      // Verificar EMPRESA ESPECÍFICA - cód 3 = SUPERPLAC PRODUTOS PARA MOVEIS LTDA
      // Mostrar relatório somente no login da SUPERPLAC POA emp código 4 e usuario administrador
      if (FUNCIONARIO.EMPRE_ESPECIFICA = 3) then
      begin
         if (FUNCIONARIO.EMPRE_CODIGO = 4) and (FUNCIONARIO.FUNC_TIPO_USU = 'A') then
            dTotalDevedores := Avalia_Situacao_Credito(sAuxRelatorio);
      end
      else
      // AVALIA SITUAÇÃO DE CRÉDITO - PARA ANÁLISE CLIENTE DEVEDOR
      begin
         if FUNCIONARIO.FUNC_TIPO_USU = 'A' then
            dTotalDevedores := Avalia_Situacao_Credito(sAuxRelatorio);
      end;
   end;
end;
function TfrmMenuPrincipal.Avalia_Situacao_Credito(var pImprimeRel : String) : Double;
var sCaminhoRel : String;
begin
   Result := 0;
   // Verificar EMPRESA ESPECÍFICA
   // showmessage(IntToStr(FUNCIONARIO.EMPRE_ESPECIFICA));
   //
   // QUANDO VAI MOSTRAR O RELATORIO DEVE GRAVAR NO CDS
   if pImprimeRel = 'S' then
   begin
      // Fecha a tabela temporária da memória.
      try
         dtmSisGestao.FDQryDevedor.Close;
      except
      end;
      try
         // Cria tabela temporária na memória.
         dtmSisGestao.FDQryDevedor.CreateDataSet;
      except
      end;
      try
         // Abre a tabela depois de criada.
         dtmSisGestao.FDQryDevedor.Open;
      except
      end;
   end;

   // GRAVAR LOGIN ATUALIZACAO
   iDiasBloqueio      := 0;
   iClientesDevedores := 0;
   dValorAtrasado     := 0;

   // LIMPAR SITUAÇÃO CRÉDITO TODOS OS CLIENTES, MOVENDO '0' PARA LIMPAR TODOS EXCETO SITUAÇÃO "B"LOQUEADO OU "E"SPECIAL OU "I"GNORAR OU "A"VISTA
   if dtmSisGestao.FdConnection.InTransaction then
      dtmSisGestao.FdConnection.Rollback;
   dtmSisGestao.FdConnection.StartTransaction;
   dtmSisGestao.FdQryGeralDados.Active := False;
   dtmSisGestao.FdQryGeralDados.SQL.Clear;
   dtmSisGestao.FdQryGeralDados.SQL.Text := Lowercase('UPDATE GERAL_CLIENTE SET SITUACAO_CODIGO2 = :LIMPASITUACAO  '+
                                                       'WHERE '+
                                                       '(SITUACAO_CODIGO2 <> :BLOQUEADO) AND (SITUACAO_CODIGO2 <> :ESPECIAL) AND '+
                                                       '(SITUACAO_CODIGO2 <> :IGNORADO) AND (SITUACAO_CODIGO2 <> :AVISTA) ');
   dtmSisGestao.FdQryGeralDados.Params.ParamByName('LIMPASITUACAO').AsString := '0';
   dtmSisGestao.FdQryGeralDados.Params.ParamByName('BLOQUEADO').AsString     := 'B';
   dtmSisGestao.FdQryGeralDados.Params.ParamByName('ESPECIAL').AsString      := 'E';
   dtmSisGestao.FdQryGeralDados.Params.ParamByName('IGNORADO').AsString      := 'I';
   dtmSisGestao.FdQryGeralDados.Params.ParamByName('AVISTA').AsString        := 'A';
   try
      dtmSisGestao.FdQryGeralDados.Execute;
      dtmSisGestao.FdConnection.Commit;
      // Limpou Situação de Crédito "0" - exceto "B" ou "E"
   except
      dtmSisGestao.FdConnection.Rollback;
   end;

  // RECONHECER CLIENTES DEVEDORES E GRAVAR SITUAÇÃO CLIENTE DEVEDOR
  // AVALIANDO FINANCEIRO DE TODAS AS EMPRESAS QUE EXISTEM NO BANCO DE ACORDO COM O NÚMERO DE DIAS INFORMADO NO CONFIGURADOR GERAL
  try
     iDiasBloqueio := StrToInt(GERAL_CONFIGURADOR.GER_DIASBLOQUEIO);
  except
     iDiasBloqueio := 0;
  end;

  dtmSisGestao.FdQryConsulta.Active      := False;
  dtmSisGestao.FdQryConsulta.SQL.Clear;
  dtmSisGestao.FdQryConsulta.SQL.Text := LowerCase('SELECT DATEDIFF(CURDATE(),CONTREC_DT_VENCTO) AS DIASVCTO, FCR.EMPRE_CODIGO, '+
                                                    'GC.CLI_CODIGO, CLI_NOME, SITUACAO_CODIGO2, CLI_RESTELEFONE, '+
                                                    'FCR.CLI_CODIGO, FCR.EMPRE_CODIGO, CONTREC_SIT_TITULO, '+
                                                    'CONTREC_FOR_PGTO,CONTREC_DT_VENCTO, '+
                                                    'CONTREC_VALOR_DOCUMENTO, CONTREC_VLR_PGTO, '+
                                                    'SUM((CONTREC_VALOR_DOCUMENTO - CONTREC_VLR_PGTO)) AS SALDODEVEDOR, '+
                                                    'CONTREC_DT_PGTO, CONTREC_DT_VENCTO, '+
                                                    // PARA CONTROLE DE CHEQUE SEM FUNDO
                                                    'CONTREC_TIPO_DOCUMENTO '+

                                                    'FROM GERAL_CLIENTE GC, FINANC_CONTAS_RECEBER FCR '+
                                                    'WHERE (GC.CLI_CODIGO = FCR.CLI_CODIGO) '+

                                               // AVALIANDO FINANCEIRO DE TODAS AS EMPRESAS QUE EXISTEM NO BANCO
                                               //      ' AND (FCR.EMPRE_CODIGO = :EMPRECODIGO) '+

                                                    // Pega somente títulos em Aberto
                                                    'AND (CONTREC_SIT_TITULO <> ''P'') '+
                                                    'AND (DATEDIFF(CURDATE(),CONTREC_DT_VENCTO) > :DIASDEVEDOR) '+

                                                    // Controlar situação em que o CONTREC_VLR_PGTO esteja maior que o CONTREC_VALOR_DOCUMENTO
                                                   // 'AND ((CONTREC_VALOR_DOCUMENTO - CONTREC_VLR_PGTO) > 0) '+

                                                    'GROUP BY FCR.EMPRE_CODIGO, FCR.CLI_CODIGO '+
                                                    'ORDER BY CLI_NOME');

  // AVALIANDO FINANCEIRO DE TODAS AS EMPRESAS QUE EXISTEM NO BANCO
  // dtmSisGestao.FdQryConsulta.Params.ParamByName('EMPRECODIGO').AsInteger := FUNCIONARIO.EMPRE_CODIGO;

  dtmSisGestao.FdQryConsulta.Params.ParamByName('DIASDEVEDOR').AsInteger := iDiasBloqueio;    // DIAS INFORMADOS NO CONFIGURADOR GERAL

  dtmSisGestao.FdQryConsulta.Active := True;
  dtmSisGestao.FdQryConsulta.First;
  iClientesDevedores := 0;

  while not dtmSisGestao.FdQryConsulta.Eof do
  begin
     // GRAVAR CLIENTE DEVEDOR
     if dtmSisGestao.FdConnection.InTransaction then
       dtmSisGestao.FdConnection.Commit;
    dtmSisGestao.FdConnection.StartTransaction;
     dtmSisGestao.FdQryGeralDados.Active := False;
     dtmSisGestao.FdQryGeralDados.SQL.Clear;
     dtmSisGestao.FdQryGeralDados.SQL.Text := Lowercase('UPDATE GERAL_CLIENTE SET SITUACAO_CODIGO2 = :DEVEDOR  '+
                                                         'WHERE (CLI_CODIGO = :CLICODIGO) AND '+
                                                         '(SITUACAO_CODIGO2 <> :BLOQUEADO) AND (SITUACAO_CODIGO2 <> :ESPECIAL) AND '+
                                                         '(SITUACAO_CODIGO2 <> :IGNORADO) AND (SITUACAO_CODIGO2 <> :AVISTA) ');
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('DEVEDOR').AsString    := 'D';
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('CLICODIGO').AsInteger := dtmSisGestao.FdQryConsulta.FieldByName('CLI_CODIGO').AsInteger;
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('ESPECIAL').AsString   := 'E';
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('BLOQUEADO').AsString  := 'B';
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('IGNORADO').AsString   := 'I';
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('AVISTA').AsString     := 'A';
     // COLOCAR AQUI UM NOVO TESTE PARA BLOQUEAR CLIENTES COM CHEQUE SEM FUNDO
     if dtmSisGestao.FdQryConsulta.FieldByName('CONTREC_TIPO_DOCUMENTO').AsString = 'CS' then
        dtmSisGestao.FdQryGeralDados.Params.ParamByName('DEVEDOR').AsString := 'B';
     try
        dtmSisGestao.FdQryGeralDados.Execute;
        dtmSisGestao.FdConnection.Commit;
        // 'Grava Cliente Devedor ';
     except
        on e : Exception do
        begin
            Informacao(e.Message + ' Erro: Avalia_Situacao_Credito D - Funcao Calculos','Aviso');
            dtmSisGestao.FdConnection.Rollback;
        end;

     end;
     dValorAtrasado := dValorAtrasado + dtmSisGestao.FdQryConsulta.FieldByName('SALDODEVEDOR').AsFloat;
     inc(iClientesDevedores);
     // QUANDO VAI MOSTRAR O RELATORIO DEVE GRAVAR NO CDS
     if pImprimeRel = 'S' then
     begin
       // Manipula Registros - prepara para inserção
       dtmSisGestao.FdQryDevedor.Insert;
       // Manipula Registros - Insere um Novo Registro na Tabela
       dtmSisGestao.FdQryDevedor.Append;
       // Gerar Registro
       dtmSisGestao.FdQryDevedorDiasDevedor.Value  := dtmSisGestao.FdQryConsulta.FieldByName('DIASVCTO').AsInteger;
       dtmSisGestao.FdQryDevedorEmpresa.Value      := dtmSisGestao.FdQryConsulta.FieldByName('EMPRE_CODIGO').AsInteger;
       dtmSisGestao.FdQryDevedorCodigo.Value       := dtmSisGestao.FdQryConsulta.FieldByName('CLI_CODIGO').AsInteger;
       dtmSisGestao.FdQryDevedorNome.Value         := dtmSisGestao.FdQryConsulta.FieldByName('CLI_NOME').AsString;
       dtmSisGestao.FdQryDevedorSaldoDevedor.Value := dtmSisGestao.FdQryConsulta.FieldByName('SALDODEVEDOR').AsFloat;
       dtmSisGestao.FdQryDevedorTelefone.Value     := Format_TelefoneDDD(Trim(dtmSisGestao.FdQryConsulta.FieldByName('CLI_RESTELEFONE').AsString));
       //
     end;
     dtmSisGestao.FdQryConsulta.Next;
  end;
  // GRAVAR LOGIN ATUALIZACAO
  Grava_Analise_Devedor;
  Result := dValorAtrasado;
  // QUANDO VAI MOSTRAR O RELATORIO DEVE GRAVAR NO CDS
  if pImprimeRel = 'S' then
  begin
     // Gerar pdf na pasta sessao - com informações do devedor
     sCaminhoRel := Trim(CONFSISGESTAO.config_sessaologin);
     if not DirectoryExists(sCaminhoRel) then
        sCaminhoRel := 'C:\SISGESTAO\';
     sCaminhoRel := sCaminhoRel+'RelDevedores.pdf';
     if FileExists(sCaminhoRel) then
        DeleteFile(sCaminhoRel);
     dtmSisGestao.lblNomeouRazaoRelatorio.Caption := Trim(FUNCIONARIO.EMPRE_RAZAOSOCIAL);
     try
        //dtmSisGestao.imgLogoRel.Picture.LoadFromFile(Trim(FUNCIONARIO.EMPRE_LOGOTIPO));
     except
     end;
     dtmSisGestao.lblFiltro.Caption := 'ANÁLISE DE CRÉDITO CONSIDERA CLIENTE DEVEDOR '+
                                       'A PARTIR DE '+IntToStr(iDiasBloqueio)+' DIAS EM ATRASO - '+
                                       'ATUALIZADO ATRAVÉS DO LOGIN FUNC. '+Trim(FUNCIONARIO.FUNC_CODIGO);
     // Gera PDF Devedores
     dtmSisGestao.FdQryDevedor.First;
     dtmSisGestao.pprRelDevedor.DeviceType              := 'PDF';
     dtmSisGestao.pprRelDevedor.AllowPrintToFile        := True;
     dtmSisGestao.pprRelDevedor.ShowPrintDialog         := False;
     dtmSisGestao.pprRelDevedor.PDFSettings.OpenPDFFile := False;
     dtmSisGestao.pprRelDevedor.TextFileName            := Trim(sCaminhoRel);
     dtmSisGestao.pprRelDevedor.Print;
     dtmSisGestao.pprRelDevedor.Reset;
     // Mostra Devedores
     dtmSisGestao.FdQryDevedor.First;
     dtmSisGestao.pprRelDevedor.DeviceType              := 'Screen';
     dtmSisGestao.pprRelDevedor.AllowPrintToFile        := False;
     dtmSisGestao.pprRelDevedor.ShowPrintDialog         := True;
     dtmSisGestao.pprRelDevedor.PDFSettings.OpenPDFFile := False;
     dtmSisGestao.pprRelDevedor.PrintReport;
     // Fecha a tabela temporária da memória.
     try
         dtmSisGestao.FdQryDevedor.Close;
     except
     end;
  end;
end;
procedure TfrmMenuPrincipal.Grava_Analise_Devedor;
var sAuxValor : String;
begin
    if dtmSisGestao.FdConnection.InTransaction then
      dtmSisGestao.FdConnection.Rollback;
   dtmSisGestao.FdConnection.StartTransaction;
    dtmSisGestao.FdQryGeralDados.Active      := False;
    dtmSisGestao.FdQryGeralDados.SQL.Clear;
    dtmSisGestao.FdQryGeralDados.SQL.Text := LowerCase('INSERT INTO ANALISE_DEVEDOR (EMPRE_CODIGO,ADEV_DATA,ADEV_HORA,FUNC_CODIGO,ADEV_DEVEDORES,ADEV_DIASBLOQUEIO,ADEV_TOTALATRASO) '+
                                                                            'VALUES (:EMPRECODIGO,:ADEVDATA,:ADEVHORA,:FUNCCODIGO,:ADEVDEVEDORES,:ADEVDIASBLOQUEIO,:ADEVTOTALATRASO) '+
                                                            'ON DUPLICATE KEY UPDATE  EMPRE_CODIGO      = :EMPRECODIGO, '+
                                                                                     'ADEV_DATA         = :ADEVDATA, '+
                                                                                     'ADEV_HORA         = :ADEVHORA, '+
                                                                                     'FUNC_CODIGO       = :FUNCCODIGO, '+
                                                                                     'ADEV_DEVEDORES    = :ADEVDEVEDORES, '+
                                                                                     'ADEV_DIASBLOQUEIO = :ADEVDIASBLOQUEIO, '+
                                                                                     'ADEV_TOTALATRASO  = :ADEVTOTALATRASO ');
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('EMPRECODIGO').AsInteger      := FUNCIONARIO.EMPRE_CODIGO;
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('ADEVDATA').AsDate            := Date;
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('ADEVHORA').AsString          := TimeToStr(Time);
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('FUNCCODIGO').AsString        := Trim(FUNCIONARIO.FUNC_CODIGO);
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('ADEVDEVEDORES').AsInteger    := iClientesDevedores;
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('ADEVDIASBLOQUEIO').AsInteger := iDiasBloqueio;
    // Formata valor sem ponto de milhar e ponto decimal no lugar da virgula...
    sAuxValor := FloatToStr(dValorAtrasado);
    sAuxValor := Elimina_Caracteres(Elimina_Caracteres(sAuxValor,'.',','),',','.');
    dtmSisGestao.FdQryGeralDados.Params.ParamByName('ADEVTOTALATRASO').AsString   := sAuxValor;
    try
       dtmSisGestao.FdQryGeralDados.Execute;
       dtmSisGestao.FdConnection.Commit;
       // 'Gravou Primeiro Login do Dia';
    except on E: Exception do
      begin
         Informacao('Não Gravou Primeiro Login do Dia '+#13+
                     'Aconteceu um erro e a mensagem de erro é : '+E.Message,'Atenção');
         dtmSisGestao.FdConnection.Rollback;
      end;
    end;
end;

end.
