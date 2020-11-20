library RadData;

{$IFDEF MSWINDOWS}
{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }
{$ENDIF}

{$IFDEF LINUX}
{ Important note about exception handling across multiple
  binary modules (EXEs and shared objects):

  All projects must be built with the same version of the
  baseclx runtime package for exception handling to work.
  If this is not the case, exceptions raised in one module
  may cause unintended side-effects in other modules. }
{$ENDIF}

uses
  {$IFDEF MSWINDOWS}
  ShareMem,
  {$ENDIF}
  SysUtils,
  Classes,
  Radar_Data in 'Radar_Data.pas',
  Description in 'Description.pas';

{$R *.res}

exports
  Find, TrustStr, BrandStr, Manufacturer, NominalParams;

begin
end.

