program pMenuPrincipal;

uses
  Vcl.Forms,
  Winapi.Windows,
  System.SysUtils,
  UMenuPrincipal in 'UMenuPrincipal.pas' {frmMenuPrincipal},
  Login in 'Login.pas' {frmLogin},
  Sleep in 'Sleep.pas' {frmSleep},
  uFuncoes in 'uFuncoes.pas',
  uConfiguracaoINI in '..\Configurador\uConfiguracaoINI.pas' {frmConfiguracaoINISisGestao},
  uDtmSisGestao in 'uDtmSisGestao.pas' {dtmSisGestao: TDataModule};

{$R *.res}
var
   HMutex : THandle;
   FileName : PChar;

begin
    FileName := Pchar(ExtractFileName(Application.ExeName));
     HMutex := CreateMutex(nil, True,FileName);
     if (HMutex = 0) or (GetLastError = ERROR_ALREADY_EXISTS) then
     begin
          ReleaseMutex(HMutex);
          Informacao('Este programa já está sendo executado','Aviso');
          Halt ; // cancela execução
     end;

  Application.Initialize;
  Application.Title := 'Gerenciador Sulpasso Informática';
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmSisGestao, dtmSisGestao);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  //Para iniciar o LOGIN...
     {if (FUNCIONARIO.FUNC_RETORNOSENHA <> 'OK') then
     begin
          Application.CreateForm(TfrmLogin, frmLogin);
          frmLogin.ShowModal;
          frmLogin.Free;
          if FUNCIONARIO.FUNC_RETORNOSENHA <> 'OK' then
             Application.Terminate;
          //Application.CreateForm(TfrmPrincipalGerenciador, frmPrincipalGerenciador);
     end;}
     Application.Run;
end.
