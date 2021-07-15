program BukuBaru;

uses
  Forms,
  UnitBuku in 'UnitBuku.pas' {fbuku},
  Unit1 in 'Unit1.pas' {feditbuku};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfbuku, fbuku);
  Application.CreateForm(Tfeditbuku, feditbuku);
  Application.Run;
end.
