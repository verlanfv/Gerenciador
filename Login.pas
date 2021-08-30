unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Imaging.jpeg, Vcl.Buttons, ShellApi;

type
    RCOMBO = record
             CAMPO01 : String;
             CAMPO02 : String;
    end;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnAcesso: TBitBtn;
    btnCancela: TBitBtn;
    Label1: TLabel;
    cbxEmpresa: TComboBox;
    Label2: TLabel;
    cbxUsuario: TComboBox;
    Label3: TLabel;
    edtSenha: TMaskEdit;
    lblSite: TLabel;
    Image6: TImage;
    lblErro: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure btnAcessoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbxUsuarioClick(Sender: TObject);
    procedure edtSenhaClick(Sender: TObject);
    procedure cbxEmpresaClick(Sender: TObject);
    procedure cbxEmpresaEnter(Sender: TObject);
    procedure cbxUsuarioEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbxUsuarioChange(Sender: TObject);
    procedure cbxEmpresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxEmpresaExit(Sender: TObject);
    procedure lblSiteMouseLeave(Sender: TObject);
    procedure lblSiteMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblSiteClick(Sender: TObject);
    procedure Image6Click(Sender: TObject);
  private
    procedure Carrega_dados_funcionario(Sender: TObject);
    procedure CarregaGeral_Configurador;
    procedure btnCancelaClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure Seleciona_Empresa;
    procedure Seleciona_Usuario(pEmpreCodigo: Double; var pRetorno: String);
    procedure VerificaMenusPermissoes(out bExiste :boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
   frmLogin: TfrmLogin;
   iTentativas : Integer;
   sPalavra, sRet : String;
   chLetra : Char;
   COMBO : RCOMBO;
   aConfiguracao : array[0..93] of String; // Vetor com as configurações da impressora...
   sDataGlobal:string;

const

ssqlgrava = 'insert into mercado_atualiza_reducao (reducao_loja,reducao_data,reducao_maq,reducao_nr_serie,reducao_cup_ini,reducao_cup_fim,reducao_cup_red,'+
                                                  ' reducao_gt_ini,reducao_gt_final,reducao_aliq1,reducao_aliq2,reducao_aliq3,reducao_aliq4,reducao_aliq5,'+
                                                  ' reducao_aliq6,reducao_aliq7,reducao_aliq8,reducao_aliq9,reducao_aliq10,reducao_aliq11,reducao_aliq12,'+
                                                  ' reducao_aliq13,reducao_aliq14,reducao_aliq15,reducao_aliq16,reducao_vlr1,reducao_vlr2,reducao_vlr3,'+
                                                  ' reducao_vlr4,reducao_vlr5,reducao_vlr6,reducao_vlr7,reducao_vlr8,reducao_vlr9,reducao_vlr10,reducao_vlr11,'+
                                                  ' reducao_vlr12,reducao_vlr13,reducao_vlr14,reducao_vlr15,reducao_vlr16,reducao_st,reducao_nt,reducao_is,'+
                                                  ' reducao_issqn,reducao_canc,reducao_desc,reducao_statust1,reducao_seqarquivo )'+
                                                  ' values (:reducao_loja,:reducao_data,:reducao_maq,:reducao_nr_serie,:reducao_cup_ini,:reducao_cup_fim,:reducao_cup_red,'+
                                                  ' :reducao_gt_ini,:reducao_gt_final,:reducao_aliq1,:reducao_aliq2,:reducao_aliq3,:reducao_aliq4,:reducao_aliq5,'+
                                                  ' :reducao_aliq6,:reducao_aliq7,:reducao_aliq8,:reducao_aliq9,:reducao_aliq10,:reducao_aliq11,:reducao_aliq12,'+
                                                  ' :reducao_aliq13,:reducao_aliq14,:reducao_aliq15,:reducao_aliq16,:reducao_vlr1,:reducao_vlr2,:reducao_vlr3,' +
                                                  ' :reducao_vlr4,:reducao_vlr5,:reducao_vlr6,:reducao_vlr7,:reducao_vlr8,:reducao_vlr9,:reducao_vlr10,:reducao_vlr11,'+
                                                  ' :reducao_vlr12,:reducao_vlr13,:reducao_vlr14,:reducao_vlr15,:reducao_vlr16,:reducao_st,:reducao_nt,:reducao_is,'+
                                                  ' :reducao_issqn,:reducao_canc,:reducao_desc,:reducao_statust1,:reducao_seqarquivo )';


implementation

uses
    Sleep, uFuncoes, uDtmSisGestao;

{$R *.dfm}

procedure TfrmLogin.btnAcessoClick(Sender: TObject);
var
   sFim,sErroDesconecta,sErroMapeia : String;
   sServidor,sletra : PChar;
   iRetornaMapeamento : Integer;
   bExiste:boolean;
begin
     Carrega_dados_funcionario(Sender);

     if (Trim(edtSenha.Text) <> '') then
     begin

          // Desencripta senha...
          if (Trim(FUNCIONARIO.SENHA_SENHA) <> (Trim(edtSenha.Text))) then
          begin

               Informacao('Senha não confere...','Aviso...');
               Inc(iTentativas);
               if iTentativas >= 3 then
               begin
                    Informacao('Número de tentativas expiradas...','Aviso...');
                    FUNCIONARIO.FUNC_RETORNOSENHA := 'FALHA';
                   // Application.Terminate;
                    ExitProcess(0);
               end
               else
               begin
                    edtSenha.Clear;
                    edtSenha.SetFocus;
                    Exit;
               end;
          end
          else
              FUNCIONARIO.FUNC_RETORNOSENHA := 'OK';

              bExiste:=False;
              VerificaMenusPermissoes(bExiste);
              if bExiste then
              begin
                  edtSenha.Clear;
                  edtSenha.SetFocus;
                  Exit;
              end;

            FUNCIONARIO.FUNC_CODIGO  := Trim(Copy(cbxUsuario.Text,34,10));
            FUNCIONARIO.EMPRE_CODIGO := StrToInt(Trim(Copy(cbxEmpresa.Text,34,5)));
          Close;
     end
     else
     begin
          Informacao('Senha não confere...','Aviso...');
          Inc(iTentativas);
          if iTentativas >= 3 then
          begin
               Informacao('Número de tentativas expiradas...','Aviso...');
               FUNCIONARIO.FUNC_RETORNOSENHA := 'FALHA';
               //Application.Terminate;
               ExitProcess(0);
          end
          else
          begin
               edtSenha.Clear;
               edtSenha.SetFocus;
               Exit;
          end;
     end;


    {if edtSenha.Text = '123' then
    begin
        Close;
        {frmSleep := TfrmSleep.Create(Self);
        try
            frmSleep.ShowModal;
        finally
            FreeAndNil(frmSleep);
        end;}

    {end
    else
    begin
        lblErro.Visible := True;
        edtSenha.SetFocus;
    end;}

end;

procedure TfrmLogin.BitBtn2Click(Sender: TObject);
begin
    //Application.Terminate;
    ExitProcess(0);//força a finalização do processo
end;

procedure TfrmLogin.cbxUsuarioChange(Sender: TObject);
var
    sCodigoEmpresa,sCodigoUsuario:string;
begin

   sCodigoEmpresa:= Trim(Copy(cbxEmpresa.Text,34,5));
   sCodigoUsuario:= Trim(Copy(cbxUsuario.Text,34,10));

    if dtmSisGestao.FdConnection.InTransaction then
       dtmSisGestao.FdConnection.Commit;
    dtmSisGestao.FdConnection.StartTransaction;
     dtmSisGestao.FdQryGeralDados.Active := false;
     dtmSisGestao.FdQryGeralDados.SQL.clear;
     dtmSisGestao.FdQryGeralDados.SQL.text := 'select * from geral_configuracao where (empre_codigo =:codigo)';
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('CODIGO').AsString:= sCodigoEmpresa;
     dtmSisGestao.FdQryGeralDados.Active:=true;

     // Coloca os dados na estrutura em memoria...
     confsisgestao.empre_codigo             := dtmsisgestao.FdQryGeralDados.fieldbyname('empre_codigo').asinteger;
     confsisgestao.config_imagemfundo       := dtmsisgestao.FdQryGeralDados.fieldbyname('config_imagemfundo').asstring;
     confsisgestao.config_imagemsplash      := dtmsisgestao.FdQryGeralDados.fieldbyname('config_imagemsplash').asstring;
     confsisgestao.config_caminhoskin       := dtmsisgestao.FdQryGeralDados.fieldbyname('config_caminhoskin').asstring;
     confsisgestao.config_fotosfuncionario  := dtmsisgestao.FdQryGeralDados.fieldbyname('config_fotosfuncionario').asstring;
     confsisgestao.config_logorelatorio     := dtmsisgestao.FdQryGeralDados.fieldbyname('config_logorelatorio').asstring;
     confsisgestao.config_fotosprodutos     := dtmsisgestao.FdQryGeralDados.fieldbyname('config_fotosprodutos').asstring;
     confsisgestao.config_fotosclientes     := dtmsisgestao.FdQryGeralDados.fieldbyname('config_fotosclientes').asstring;
     confsisgestao.config_sessaologin       := dtmsisgestao.FdQryGeralDados.fieldbyname('config_sessaologin').asstring;
     confsisgestao.config_rss               := dtmsisgestao.FdQryGeralDados.fieldbyname('config_rss').asstring;
     confsisgestao.config_spc               := dtmsisgestao.FdQryGeralDados.fieldbyname('config_spc').asstring;
     dtmSisGestao.FdQryGeralDados.Active  := False;
     dtmSisGestao.FdConnection.Commit
end;

procedure TfrmLogin.cbxUsuarioClick(Sender: TObject);
begin
    lblErro.Visible := False;
end;

procedure TfrmLogin.cbxUsuarioEnter(Sender: TObject);
begin
    lblErro.Visible := False;
end;

procedure TfrmLogin.cbxEmpresaClick(Sender: TObject);
begin
    lblErro.Visible := False
end;

procedure TfrmLogin.cbxEmpresaEnter(Sender: TObject);
begin
    lblErro.Visible := False;
end;

procedure TfrmLogin.cbxEmpresaExit(Sender: TObject);
begin
    KeyPreview := True;
     Cor_Campo(Sender,clWindow);
     if (cbxEmpresa.Text = '') then
     begin
          informacao('Digite a  Empresa... ','Aviso');
          cbxEmpresa.SetFocus;
          Exit;
     end;
     if (cbxEmpresa.Items.IndexOf(cbxEmpresa.Text) = -1) then
     begin
          Informacao('Empresa e Razão  Não Encontrada','Aviso');
          cbxEmpresa.Text := '';
          cbxEmpresa.SetFocus;
          Exit;
     end;
     Seleciona_Usuario(StrToFloat(Trim(Copy(cbxEmpresa.Text,34,5))),sRet);
     if (sRet = 'CANCELAR') then
     begin
          Close;
          Exit;
     end;
end;

procedure TfrmLogin.cbxEmpresaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
          VK_RETURN : Perform(WM_NEXTDLGCTL,0,0);
          VK_F12    : Perform(WM_NEXTDLGCTL,0,1);
          VK_ESCAPE : if sAcao = 'INATIVO' then
                         Close;
     end;
end;

procedure TfrmLogin.edtSenhaClick(Sender: TObject);
begin
    lblErro.Visible := False
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    case Key of
          VK_RETURN, VK_DOWN: Perform(WM_NEXTDLGCTL,0,0);
          VK_UP, VK_F12 : Perform(WM_NEXTDLGCTL,1,0);
     end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
    cbxUsuario.SetFocus;
    lblErro.Caption:='';
     Seleciona_Empresa;
     if Trim(Copy(cbxEmpresa.Text,34,5)) <> '' then
     begin
       Seleciona_Usuario(StrToFloat(Trim(Copy(cbxEmpresa.Text,34,5))),sRet);
       //cbxUsuarCodigoExit(Sender);
     end
     else
     begin
          Informacao('Sistema será fechado para configuração do Usuário'+#13+
                     lblErro.Caption,'Aviso');
          Close;
          btnCancelaClick(Sender);
          exit;
     end;
     cbxEmpresa.SetFocus;
end;
procedure TfrmLogin.Image6Click(Sender: TObject);
begin
    ShellExecute(Application.Handle, 'open', PChar(lblSite.Caption), nil, nil, 0);
end;

procedure TfrmLogin.lblSiteClick(Sender: TObject);
begin
    ShellExecute(Application.Handle, 'open', PChar(lblSite.Caption), nil, nil, 0);
end;

procedure TfrmLogin.lblSiteMouseLeave(Sender: TObject);
begin
    TLabel(Sender).Font.Color := clWindow;
    TLabel(Sender).Font.Style := [];
end;

procedure TfrmLogin.lblSiteMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    TLabel(Sender).Font.Color := $00D9C518;
    TLabel(Sender).Font.Style := [fsUnderline];
end;

procedure TfrmLogin.Carrega_dados_funcionario(Sender: TObject);
begin
     //Cor_Campo(Sender,clWindow);
     // Seleciona o usuario escolhido....
     if dtmSisGestao.FdConnection.InTransaction then
               dtmSisGestao.FdConnection.Commit;
            dtmSisGestao.FdConnection.StartTransaction;
     dtmSisGestao.FdQryGeralDados.Active := False;
     dtmSisGestao.FdQryGeralDados.SQL.clear;
     dtmSisGestao.FdQryGeralDados.SQL.text :=
          'select * from geral_funcionario left outer join geral_nfe on '+
          '              (geral_funcionario.empre_codigo = geral_nfe.empre_codigo), '+
          '              geral_empresa,geral_cidade '+
          'where (geral_funcionario.empre_codigo  = geral_empresa.empre_codigo) and '+
          '      (geral_EMPRESA.cidade_coddne = geral_cidade.cidade_coddne) and'+
          '      (geral_funcionario.func_codigo   = :funccodigo) and '+
          '      (geral_funcionario.empre_codigo  = :emprecodigo)';
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('FUNCCODIGO').AsString   := Trim(Copy(cbxUsuario.Text,34,10));
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('EMPRECODIGO').AsInteger := StrToInt(Trim(Copy(cbxEmpresa.Text,34,5)));
     dtmSisGestao.FdQryGeralDados.Active := True;
     if (dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SENHA').IsNull) then
     begin
          lblErro.Caption:='Dados do usuário não encontrados...';
          cbxEmpresa.SetFocus;
          Exit;
     end;
     // Verifica se o usuário tem acesso ao sistema....
     if (dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SISTEMA').IsNull) or
        (dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SISTEMA').AsInteger = 1) then
     begin
          lblErro.Caption := 'Usuário sem acesso ao SISTEMA...';
          Informacao('Usuário sem acesso ao SISTEMA...','Aviso...');
          //Application.Terminate;
          //Exit;
     end;
     //LIMPA AS VARIAVEIS ANTES DE PEGAR OS DADOS DO USUARIO
     Limpa_variavel(sPalavra);
     // Passagem de dados para a estrutura de usuarios...
     FUNCIONARIO.EMPRE_CODIGO               := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_CODIGO').AsInteger;
     FUNCIONARIO.EMPRE_UF                   := dtmSisGestao.FdQryGeralDados.FieldByName('CIDADE_UF').AsString;
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
     FUNCIONARIO.SENHA_SENHA                := trim(Decripta_Email(dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SENHA').AsString));
     FUNCIONARIO.SENHA_NIVEL                := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_NIVEL').AsString;
     FUNCIONARIO.FUNC_REPLICA                := trim(dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_REPLICA').AsString);
     FUNCIONARIO.FUNC_TIPO_USU               := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_TIPO_USU').AsString;
     if dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CORCAMPOS').IsNull then
        FUNCIONARIO.SENHA_CORCAMPOS := clSkyBlue
     else
         FUNCIONARIO.SENHA_CORCAMPOS := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CORCAMPOS').AsInteger;
     FUNCIONARIO.SENHA_SKIN := dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SKIN').AsString;
     if dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_SKIN').IsNull then
        FUNCIONARIO.SENHA_SKIN := 'macos.skn';
     FUNCIONARIO.EMPRE_RAZAOSOCIAL  := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_RAZAOSOCIAL').AsString;
     FUNCIONARIO.EMPRE_CNPJ         := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_CNPJ').AsString;
     FUNCIONARIO.EMPRE_INSCESTADUAL := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_INSCESTADUAL').AsString;
     FUNCIONARIO.EMPRE_UF           := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_UF').AsString;
     FUNCIONARIO.EMPRE_LOGOTIPO     := dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_LOGOTIPO').AsString;
     // configurar variaveis utilizadas na NF-e
     FUNCIONARIO.empre_endereco       := dtmSisGestao.FdQryGeralDados.fieldbyname('empre_endereco').asstring;
     FUNCIONARIO.empre_numero         := dtmSisGestao.FdQryGeralDados.fieldbyname('empre_numero').asstring;
     FUNCIONARIO.empre_complemento    := dtmSisGestao.FdQryGeralDados.fieldbyname('empre_complemento').asstring;
     FUNCIONARIO.empre_cep            := dtmSisGestao.FdQryGeralDados.fieldbyname('empre_cep').asstring;
     FUNCIONARIO.empre_bairro         := dtmSisGestao.FdQryGeralDados.fieldbyname('empre_bairro').asstring;
     FUNCIONARIO.empre_cidade         := dtmSisGestao.FdQryGeralDados.fieldbyname('cidade_nome').AsString;
     FUNCIONARIO.empre_telefone       := dtmSisGestao.FdQryGeralDados.fieldbyname('empre_telefone').asstring;
     FUNCIONARIO.empre_fax            := dtmSisGestao.FdQryGeralDados.fieldbyname('empre_fax').asstring;
     FUNCIONARIO.empre_inscmunicipal  := dtmSisGestao.FdQryGeralDados.fieldbyname('empre_inscmunicipal').asstring;
     FUNCIONARIO.empre_site           := dtmSisGestao.FdQryGeralDados.fieldbyname('empre_site').asstring;
     FUNCIONARIO.empre_modelodanfe    := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_danfe').asstring;
     FUNCIONARIO.empre_modcomprovante := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_comprovante').asstring;
     FUNCIONARIO.empre_ambiente       := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_ambiente').asstring;
     FUNCIONARIO.empre_contingencia   := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_contingencia').asstring;
     FUNCIONARIO.empre_cancelamento   := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_chavecancelamento').asstring;
     FUNCIONARIO.empre_dtcertific     := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_certificadodata').asstring;
     FUNCIONARIO.empre_certificado    := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_certificadonome').asstring;
     FUNCIONARIO.empre_siglaws        := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_siglaws').asstring;
     FUNCIONARIO.empre_versaonfe      := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_versao').asstring;
     FUNCIONARIO.empre_consicm        := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_consultaicm').asstring;
     FUNCIONARIO.empre_conscep        := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_consultacep').asstring;
     FUNCIONARIO.nfe_logotipo         := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_logotipo').asstring;
     // pastas
     FUNCIONARIO.nfe_geranota         := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_geranota').asstring;
     FUNCIONARIO.nfe_caminhonfe       := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_caminhonfe').asstring;
     FUNCIONARIO.nfe_backupnfe        := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_backupnfe').asstring;
     FUNCIONARIO.nfe_retornonfe       := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_retornonfe').asstring;
     FUNCIONARIO.nfe_retornoxml       := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_retornoxml').asstring;
     FUNCIONARIO.nfe_geratxtxml       := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_geratxtxml').asstring;
     FUNCIONARIO.nfe_versao           := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_versao').asstring;
     FUNCIONARIO.nfe_siglaws          := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_siglaws').asstring;
     FUNCIONARIO.nfe_consultaicm      := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_consultaicm').asstring;
     FUNCIONARIO.nfe_consultacep      := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_consultacep').asstring;
     FUNCIONARIO.nfe_ctaemail         := dtmSisGestao.FdQryGeralDados.fieldbyname('email_conta').asstring;
     FUNCIONARIO.nfe_gerapdf          := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_gerapdf').asstring;
     FUNCIONARIO.nfe_caminhopdf       := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_caminhopdf').asstring;
     FUNCIONARIO.nfe_2via             := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_2via').asstring;
     FUNCIONARIO.nfe_segundos         := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_tempo_retorno').asstring;
     FUNCIONARIO.nfe_obs              := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_obs').asstring;
     FUNCIONARIO.nfe_bat_retorno      := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_bat_retorno').asstring;
     FUNCIONARIO.nfe_bat_cancelamento := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_bat_cancelamento').asstring;
     FUNCIONARIO.nfe_testa_versao     := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_testa_versao').asstring;
     // ALTERAÇÕES NFE 3a GERAÇÃO
     FUNCIONARIO.NFE_DANFE            := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_danfe').asstring;
     FUNCIONARIO.NFE_HORA_UTC         := dtmSisGestao.FdQryGeralDados.fieldbyname('nfe_hora_utc').asstring;
     FUNCIONARIO.NFE_VARIOS_USUARIOS  := dtmSisGestao.FdQryGeralDados.fieldbyname('NFE_VARIOS_USUARIOS').asstring;
     FUNCIONARIO.NFCE_DANFE           := dtmSisGestao.FdQryGeralDados.fieldbyname('NFCE_DANFE').asstring;
     FUNCIONARIO.NFCE_LOGOTIPO        := dtmSisGestao.FdQryGeralDados.fieldbyname('NFCE_LOGOTIPO').asstring;
     FUNCIONARIO.NFCE_TEMPO_RETORNO   := dtmSisGestao.FdQryGeralDados.fieldbyname('NFCE_TEMPO_RETORNO').asstring;
     FUNCIONARIO.NFCE_QRCODE_VERSAO   := dtmSisGestao.FdQryGeralDados.fieldbyname('NFCE_QRCODE_VERSAO').asstring;
     FUNCIONARIO.NFCE_QRCODE_IDTOKEN  := dtmSisGestao.FdQryGeralDados.fieldbyname('NFCE_QRCODE_IDTOKEN').asstring;
     FUNCIONARIO.NFCE_QRCODE_CSC   	  := dtmSisGestao.FdQryGeralDados.fieldbyname('NFCE_QRCODE_CSC').asstring;
     FUNCIONARIO.NFCE_QRCODE_ESCALA   := dtmSisGestao.FdQryGeralDados.fieldbyname('NFCE_QRCODE_ESCALA').asstring;
     FUNCIONARIO.NFCE_QRCODE_PASTA   	:= dtmSisGestao.FdQryGeralDados.fieldbyname('NFCE_QRCODE_PASTA').asstring;
     FUNCIONARIO.NFE_TABLET_USA  	    := dtmSisGestao.FdQryGeralDados.fieldbyname('NFE_TABLET_USA').asstring;
     FUNCIONARIO.NFE_TABLET_PASTA	    := dtmSisGestao.FdQryGeralDados.fieldbyname('NFE_TABLET_PASTA').asstring;
     FUNCIONARIO.NFE_TABLET_PDF  	    := dtmSisGestao.FdQryGeralDados.fieldbyname('NFE_TABLET_PDF').asstring;
     FUNCIONARIO.NFE_TABLET_XML  	    := dtmSisGestao.FdQryGeralDados.fieldbyname('NFE_TABLET_XML').asstring;
     FUNCIONARIO.NFE_TABLET_RET  	    := dtmSisGestao.FdQryGeralDados.fieldbyname('NFE_TABLET_RET').asstring;
     FUNCIONARIO.nfce_contingencia    := dtmSisGestao.FdQryGeralDados.fieldbyname('nfce_contingencia').asstring;
     // Localizar Empresa Específica
     FUNCIONARIO.EMPRE_ESPECIFICA      := 0;
     dtmSisGestao.FdqryGeral.Active      := False;
     dtmSisGestao.FdqryGeral.SQL.clear;
     dtmSisGestao.FdqryGeral.SQL.text := LowerCase('SELECT * FROM GERAL_EMP_ESPECIFICAS WHERE (EMPRE_CODIGO = :EMPRECODIGO)');
     dtmSisGestao.FdqryGeral.Params.ParamByName('EMPRECODIGO').AsString := IntToStr(FUNCIONARIO.EMPRE_CODIGO);
     dtmSisGestao.FdqryGeral.Active      := True;
     if not (dtmsisgestao.FdqryGeral.fieldbyname('EMPRE_CODIGO').isnull) then
        FUNCIONARIO.EMPRE_ESPECIFICA   := dtmsisgestao.FdqryGeral.fieldbyname('ESP_CODIGO').AsInteger;
     //
     FUNCIONARIO.empre_proxy          := '';
     FUNCIONARIO.empre_proxyporta     := '';
     FUNCIONARIO.empre_proxyusuario   := '';
     FUNCIONARIO.empre_proxysenha     := '';
     //

     // ler configurador geral
     CarregaGeral_Configurador;
end;
procedure TfrmLogin.CarregaGeral_Configurador;
var bAuxConfigura : Boolean;
begin
    bAuxConfigura := False;
    if dtmSisGestao.FdConnection.InTransaction then
               dtmSisGestao.FdConnection.Commit;
            dtmSisGestao.FdConnection.StartTransaction;
    // Ler configurador GERAL para EMPRESA LOGADA -> EMPRE_CODIGO = FUNCIONARIO.EMPRE_CODIGO
    dtmSisGestao.FdQryConsulta.Active := False;
    dtmSisGestao.FdQryConsulta.SQL.text:='';
    dtmSisGestao.FdQryConsulta.SQL.text:='select * from geral_configurador where empre_codigo = :emprecodigo';
    dtmSisGestao.FdQryConsulta.Params.ParamByName('emprecodigo').AsString := IntToStr(FUNCIONARIO.EMPRE_CODIGO);
    dtmSisGestao.FdQryConsulta.Active:=true;
    Application.ProcessMessages;
    if not (dtmSisGestao.FdQryConsulta.FieldByName('ger_diasgravoso').IsNull) then
       bAuxConfigura := True
    else  // Se não existir Configurador para empresa logada - Ler configurador GERAL para todas as empresas -> EMPRE_CODIGO = 0
    begin
        dtmSisGestao.FdQryConsulta.Active := False;
        dtmSisGestao.FdQryConsulta.SQL.text:='';
        dtmSisGestao.FdQryConsulta.SQL.text:='select * from geral_configurador where empre_codigo = :emprecodigo';
        dtmSisGestao.FdQryConsulta.Params.ParamByName('emprecodigo').AsString := '0';
        dtmSisGestao.FdQryConsulta.Active:=true;
        Application.ProcessMessages;
        if not (dtmSisGestao.FdQryConsulta.FieldByName('ger_diasgravoso').IsNull) then
           bAuxConfigura := True
    end;
    if bAuxConfigura then
    begin
        GERAL_CONFIGURADOR.EMPRE_CODIGO         := dtmSisGestao.FdQryConsulta.FieldByName('EMPRE_CODIGO').AsString;//referente a empresa se for 0 para todos <> cada empresa
        GERAL_CONFIGURADOR.GER_DIASGRAVOSO      := dtmSisGestao.FdQryConsulta.FieldByName('GER_DIASGRAVOSO').AsString;
        GERAL_CONFIGURADOR.GER_DIASBLOQUEIO     := dtmSisGestao.FdQryConsulta.FieldByName('GER_DIASBLOQUEIO').AsString;
        GERAL_CONFIGURADOR.GER_DIASREPOUSO      := dtmSisGestao.FdQryConsulta.FieldByName('GER_DIASREPOUSO').AsString;
        GERAL_CONFIGURADOR.GER_DIASINATIVO      := dtmSisGestao.FdQryConsulta.FieldByName('GER_DIASINATIVO').AsString;
        GERAL_CONFIGURADOR.GER_RAMOCLIENTE      := dtmSisGestao.FdQryConsulta.FieldByName('GER_RAMOCLIENTE').AsString;
        GERAL_CONFIGURADOR.GER_PIS              := dtmSisGestao.FdQryConsulta.FieldByName('GER_PIS').AsString;
        GERAL_CONFIGURADOR.GER_COFINS           := dtmSisGestao.FdQryConsulta.FieldByName('GER_COFINS').AsString;
        GERAL_CONFIGURADOR.GER_CUSADM           := dtmSisGestao.FdQryConsulta.FieldByName('GER_CUSADM').AsString;
        GERAL_CONFIGURADOR.GER_IMPOSTOVIG       := dtmSisGestao.FdQryConsulta.FieldByName('GER_IMPOSTOVIG').AsString;
        GERAL_CONFIGURADOR.GER_MARGEMMIN        := dtmSisGestao.FdQryConsulta.FieldByName('GER_MARGEMMIN').AsString;
        GERAL_CONFIGURADOR.GER_MARGEMMAX        := dtmSisGestao.FdQryConsulta.FieldByName('GER_MARGEMMAX').AsString;
        GERAL_CONFIGURADOR.GER_CPMF             := dtmSisGestao.FdQryConsulta.FieldByName('GER_CPMF').AsString;
        GERAL_CONFIGURADOR.GER_ISSQN            := dtmSisGestao.FdQryConsulta.FieldByName('GER_ISSQN').AsString;
        GERAL_CONFIGURADOR.GER_LIVROMES         := dtmSisGestao.FdQryConsulta.FieldByName('GER_LIVROMES').AsString;
        GERAL_CONFIGURADOR.GER_LIVROANO         := dtmSisGestao.FdQryConsulta.FieldByName('GER_LIVROANO').AsString;
        GERAL_CONFIGURADOR.GER_BCOCXAMES        := dtmSisGestao.FdQryConsulta.FieldByName('GER_BCOCXAMES').AsString;
        GERAL_CONFIGURADOR.GER_BCOCXAANO        := dtmSisGestao.FdQryConsulta.FieldByName('GER_BCOCXAANO').AsString;
        GERAL_CONFIGURADOR.GER_DESCESPNOTA      := dtmSisGestao.FdQryConsulta.FieldByName('GER_DESCESPNOTA').AsString;
        GERAL_CONFIGURADOR.GER_DESCESPITEM      := dtmSisGestao.FdQryConsulta.FieldByName('GER_DESCESPITEM').AsString;
        GERAL_CONFIGURADOR.GER_IPITIPO          := dtmSisGestao.FdQryConsulta.FieldByName('GER_IPITIPO').AsString;
        GERAL_CONFIGURADOR.GER_IPITABELA        := dtmSisGestao.FdQryConsulta.FieldByName('GER_IPITABELA').AsString;
        GERAL_CONFIGURADOR.GER_ICMPAUTA         := dtmSisGestao.FdQryConsulta.FieldByName('GER_ICMPAUTA').AsString;
        GERAL_CONFIGURADOR.GER_ICMPAUTATAB      := dtmSisGestao.FdQryConsulta.FieldByName('GER_ICMPAUTATAB').AsString;
        GERAL_CONFIGURADOR.GER_ACUMULADUPLIC    := dtmSisGestao.FdQryConsulta.FieldByName('GER_ACUMULADUPLIC').AsString;
        GERAL_CONFIGURADOR.GER_DIASBLOQMENOS    := dtmSisGestao.FdQryConsulta.FieldByName('GER_DIASBLOQMENOS').AsString;
        GERAL_CONFIGURADOR.GER_ENTDECPRECO      := dtmSisGestao.FdQryConsulta.FieldByName('GER_ENTDECPRECO').AsString;
        GERAL_CONFIGURADOR.GER_ENTDECQUANT      := dtmSisGestao.FdQryConsulta.FieldByName('GER_ENTDECQUANT').AsString;
        GERAL_CONFIGURADOR.GER_SAIDECPRECO      := dtmSisGestao.FdQryConsulta.FieldByName('GER_SAIDECPRECO').AsString;
        GERAL_CONFIGURADOR.GER_SAIDECQUANT      := dtmSisGestao.FdQryConsulta.FieldByName('GER_SAIDECQUANT').AsString;
        GERAL_CONFIGURADOR.GER_NATUREZATROC1    := dtmSisGestao.FdQryConsulta.FieldByName('GER_NATUREZATROC1').AsString;
        GERAL_CONFIGURADOR.GER_NATUREZATROC2    := dtmSisGestao.FdQryConsulta.FieldByName('GER_NATUREZATROC2').AsString;
        GERAL_CONFIGURADOR.GER_NATUREZATROC3    := dtmSisGestao.FdQryConsulta.FieldByName('GER_NATUREZATROC3').AsString;
        GERAL_CONFIGURADOR.GER_PEDIDOMINIMO     := dtmSisGestao.FdQryConsulta.FieldByName('GER_PEDIDOMINIMO').AsString;
        GERAL_CONFIGURADOR.GER_BOLETOMINIMO     := dtmSisGestao.FdQryConsulta.FieldByName('GER_BOLETOMINIMO').AsString;
        GERAL_CONFIGURADOR.GER_MULTA            := dtmSisGestao.FdQryConsulta.FieldByName('GER_MULTA').AsString;
        GERAL_CONFIGURADOR.GER_JUROSDIA         := dtmSisGestao.FdQryConsulta.FieldByName('GER_JUROS_DIA').AsString;
        GERAL_CONFIGURADOR.GER_JUROSSUP         := dtmSisGestao.FdQryConsulta.FieldByName('GER_JUROS_SUP').AsString;
        GERAL_CONFIGURADOR.GER_COMISSAO         := dtmSisGestao.FdQryConsulta.FieldByName('GER_COMISSAO').AsString;
    end;
    Application.ProcessMessages;
    dtmSisGestao.FdConnection.Commit
end;

procedure TfrmLogin.VerificaMenusPermissoes(out bExiste :boolean);
begin
// ShowMessage( Trim(Copy(cbxEmpreRazaoSocial.Text,34,5)));
  if Trim(Copy(cbxEmpresa.Text,34,5)) <> '00000'  then
  begin
  if dtmSisGestao.FdConnection.InTransaction then
               dtmSisGestao.FdConnection.Commit;
            dtmSisGestao.FdConnection.StartTransaction;
     dtmSisGestao.FdQryGeralDados.Active := False;
     dtmSisGestao.FdQryGeralDados.SQL.clear;
     dtmSisGestao.FdQryGeralDados.SQL.text := 'select * from geral_acesso where (empre_codigo = :empresa) and (func_codigo = :Funcionario)and (acesso_nivel <> ''N'')  ';
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('empresa').AsInteger:=StrToInt(Trim(Copy(cbxEmpresa.Text,34,5)));
     dtmSisGestao.FdQryGeralDados.Params.ParamByName('Funcionario').AsString:= Trim(Copy(cbxUsuario.Text,34,10));
     dtmSisGestao.FdQryGeralDados.Active := True;

     if (dtmSisGestao.FdQryGeralDados.FieldByName('menu_codigo').IsNull) then
     begin
        bExiste:=true;
        Informacao('Usuario Não tem Permissão para acesso aos Menus '+#13+
                   'Contate o Administrador do Sistema !!! ','Atenção');
        Exit;
     end;
     bExiste:=False;
  end;
end;

procedure TfrmLogin.Seleciona_Empresa;
begin
     if dtmSisGestao.FdConnection.InTransaction then
               dtmSisGestao.FdConnection.Commit;
            dtmSisGestao.FdConnection.StartTransaction;
     dtmSisGestao.FdQryGeralDados.Active := False;
     dtmSisGestao.FdQryGeralDados.SQL.clear;
     dtmSisGestao.FdQryGeralDados.SQL.text := 'SELECT EMPRE_RAZAOSOCIAL,EMPRE_CODIGO,EMPRE_VIS FROM GERAL_EMPRESA '+
                                               'WHERE (EMPRE_VIS <> "N") ORDER BY EMPRE_CODIGO ';
     dtmSisGestao.FdQryGeralDados.Active := True;
     if (dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_CODIGO').IsNull) then
     begin
          //Informacao('Não há empresa cadastrada...','Aviso...');
          lblErro.Caption := 'Não há empresa Cadastrada ou o Cadastro da Empresa está incompleto !';
          cbxEmpresa.Style := csDropDownList;
          lblErro.Update;
     end;
     cbxEmpresa.Items.Clear;
     while not dtmSisGestao.FdQryGeralDados.Eof do
     begin
          COMBO.CAMPO01 := PadLeft(dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_CODIGO').AsString,5,'0');
          COMBO.CAMPO02 := Copy(PadRight(dtmSisGestao.FdQryGeralDados.FieldByName('EMPRE_RAZAOSOCIAL').AsString,30,' '),1,30);
          cbxEmpresa.Items.Add(COMBO.CAMPO02+' - '+COMBO.CAMPO01);
          dtmSisGestao.FdQryGeralDados.Next;
          cbxEmpresa.Style := csDropDownList;
     end;
     dtmSisGestao.FdQryGeralDados.Active := False;
     dtmSisGestao.FdConnection.Commit;
     cbxEmpresa.ItemIndex := 0;
     cbxEmpresa.Text      := cbxEmpresa.Items[0];
end;

procedure TfrmLogin.Seleciona_Usuario(pEmpreCodigo : Double; var pRetorno : String);
begin
     if dtmSisGestao.FdConnection.InTransaction then
               dtmSisGestao.FdConnection.Commit;
            dtmSisGestao.FdConnection.StartTransaction;
     dtmSisGestao.FdQryGeralDados.Active := False;
     dtmSisGestao.FdQryGeralDados.SQL.clear;
     dtmSisGestao.FdQryGeralDados.SQL.text :=
           'select func_nome,func_codigo from geral_funcionario '+
           'where (empre_codigo = :emprecodigo)and(func_sistema = 0) order by func_nome';
     dtmsisgestao.FdQryGeralDados.params.parambyname('emprecodigo').asfloat := pemprecodigo;
     dtmSisGestao.FdQryGeralDados.Active := True;
     if (dtmSisGestao.FdQryGeralDados.FieldByName('FUNC_CODIGO').IsNull) then
     begin
           lblErro.Visible:=true;
           lblErro.Caption:= 'Não há Usuário Cadastrado para essa Empresa ...';
           lblErro.Update;
           cbxUsuario.Style:=csDropDownList;
           //pRetorno := 'CANCELAR';
          cbxEmpresa.SetFocus;
          Exit;
     end;
     cbxUsuario.Items.Clear;
     while not dtmSisGestao.FdQryGeralDados.Eof do
     begin
          lblErro.Visible:=False;
          lblErro.Caption:= '';
          combo.campo01 := padleft(dtmsisgestao.FdQryGeralDados.fieldbyname('func_codigo').asstring,5,' ');
          combo.campo02 := copy(padright(dtmsisgestao.FdQryGeralDados.fieldbyname('func_nome').asstring,30,' '),1,30);
          cbxUsuario.Items.Add(COMBO.CAMPO02+' - '+COMBO.CAMPO01);
          dtmSisGestao.FdQryGeralDados.Next;
     end;
     cbxUsuario.Style:=csDropDownList;
     dtmSisGestao.FdQryGeralDados.Active := False;
     dtmSisGestao.FdConnection.Commit;
     cbxUsuario.ItemIndex := -1;
     cbxUsuario.Text      := cbxUsuario.Items[-1];
     pRetorno := 'OK';
end;

procedure TfrmLogin.btnCancelaClick(Sender: TObject);
begin
     FUNCIONARIO.FUNC_RETORNOSENHA := 'CANCELA';
     Close;
end;

procedure TfrmLogin.btnOKClick(Sender: TObject);
var
   //formulario : TfrmPrincipalECF;
   sFim,sErroDesconecta,sErroMapeia : String;
   sServidor,sletra : PChar;
   iRetornaMapeamento : Integer;
   bExiste:boolean;
begin
     Carrega_dados_funcionario(Sender);

     if (Trim(edtSenha.Text) <> '') then
     begin
               {
     SHOWMESSAGE('mostra'+#13+edtUsuarSenha.Text+#13+
     'Encripta '+ Encripta(Trim(edtUsuarSenha.Text))+
     ' DECRIPTA '+ Decripta(Trim(edtUsuarSenha.Text))+#13#13+
     'Trim(FUNCIONARIO.SENHA_SENHA) = '+Trim(FUNCIONARIO.SENHA_SENHA)+#13#13+
     'Trim(edtUsuarSenha.Text) = '+Trim(edtUsuarSenha.Text));
               }
          // Desencripta senha...
          if (Trim(FUNCIONARIO.SENHA_SENHA) <> (Trim(edtSenha.Text))) then
          begin
              // ShowMessage('Senha Cadastrada:'+FUNCIONARIO.SENHA_SENHA);
              // ShowMessage('Senha Digitada:'+edtUsuarSenha.Text);

               Informacao('Senha não confere...','Aviso...');
               Inc(iTentativas);
               if iTentativas >= 3 then
               begin
                    Informacao('Número de tentativas expiradas...','Aviso...');
                    FUNCIONARIO.FUNC_RETORNOSENHA := 'FALHA'; Close;
               end
               else
               begin
                    edtSenha.Clear; cbxUsuario.SetFocus; Exit;
               end;
          end
          else
              FUNCIONARIO.FUNC_RETORNOSENHA := 'OK';
              ///DANIEL SANNTOS 27/05/2011- VERIFICA SE A MENUS HABILITADOS PARA ESSE USUARIO
              bExiste:=False;
              VerificaMenusPermissoes(bExiste);
              if bExiste then
              begin
                  edtSenha.Clear;
                  cbxUsuario.SetFocus;
                  Exit;
              end;
           ///DANIEL SANNTOS 27/05/2011- PEGAVA O USUARIO ERRADO
          /// ESTA ATUALIZANDO CADA VEZ QUE ENTRA NO LOGIN
            FUNCIONARIO.FUNC_CODIGO  := Trim(Copy(cbxUsuario.Text,34,10));
            FUNCIONARIO.EMPRE_CODIGO := StrToInt(Trim(Copy(cbxEmpresa.Text,34,5)));
          Close;
     end
     else
     begin
          Informacao('Senha não confere...','Aviso...');
          Inc(iTentativas);
          if iTentativas >= 3 then
          begin
               Informacao('Número de tentativas expiradas...','Aviso...');
               FUNCIONARIO.FUNC_RETORNOSENHA := 'FALHA';
               Close;
          end
          else
          begin
               edtSenha.Clear;
               edtSenha.SetFocus; Exit;
          end;
     end;
end;


Initialization
        iTentativas := 0;



end.
