program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {fbuku},
  Unit4 in 'Unit4.pas' {fsekolah},
  Unit2 in 'Unit2.pas' {ftransaksi},
  Unit3 in 'Unit3.pas' {fwelcome};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfwelcome, fwelcome);
  Application.CreateForm(Tftransaksi, ftransaksi);
  Application.CreateForm(Tfbuku, fbuku);
  Application.CreateForm(Tfsekolah, fsekolah);
  Application.Run;
end.
