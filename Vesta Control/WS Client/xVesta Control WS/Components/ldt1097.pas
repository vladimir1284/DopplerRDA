unit LDT1097;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Radar_TLB;

type
  TLDT1097 = class(TComponent, IGeneral, ISynchronizer, IVideo, IAntenna, ITxRx, IRadar)
  published  // IGeneral
    function Get_Version: Integer; safecall;
    procedure Enable_IO; safecall;
    procedure Disable_IO; safecall;
    procedure Enable_Int(Int: Byte); safecall;
    procedure Disable_Int(Int: Byte); safecall;
    procedure Enable_DMA(Channel: Byte); safecall;
    procedure Disable_DMA(Channel: Byte); safecall;
  published  // ISynchronizer
    function Sync_Test(Channel, Value: Byte): Byte; safecall;
    procedure Sync_Program(Channel: Byte; Mode, Cell: Word); safecall;
    function Sync_N1_Count(Channel: Byte): Integer; safecall;
  published  // IVideo
    function Video_Test(Channel, Value: Byte): Byte; safecall;
    procedure Video_Program(Channel, Mode, ShotCount: Byte); safecall;
    function Video_Transfer(Channel, Model: Byte; Count: Word; var Address; Size, hEvent: Integer): Integer; safecall;
    procedure Video_Enable; safecall;
    procedure Video_Disable; safecall;
    procedure Video_State(out VideoState); safecall;
  published  // IAntenna
    procedure Antenna_Enable_Control; safecall;
    procedure Antenna_Disable_Control; safecall;
    procedure Antenna_Enable_Measure; safecall;
    procedure Antenna_Disable_Measure; safecall;
    function Antenna_Get_Azimut: Word; safecall;
    function Antenna_Get_Elevat: Word; safecall;
    procedure Antenna_Set_Azimut(Code: Word); safecall;
    procedure Antenna_Set_Elevat(Code: Word); safecall;
    function Antenna_Get_Azimut_Speed: Integer; safecall;
    function Antenna_Get_Elevat_Speed: Integer; safecall;
    procedure Antenna_Set_Azimut_Speed(Code: Integer); safecall;
    procedure Antenna_Set_Elevat_Speed(Code: Integer); safecall;
    function Antenna_Get_Azimut_Current: Byte; safecall;
    function Antenna_Get_Elevat_Current: Byte; safecall;
    procedure Antenna_Set_Azimut_Current(Code: Byte); safecall;
    procedure Antenna_Set_Elevat_Current(Code: Byte); safecall;
    procedure Antenna_Set_Azimut_Bridge(Bridge: Byte; Code: Word); safecall;
    procedure Antenna_Set_Elevat_Bridge(Bridge: Byte; Code: Word); safecall;
    procedure Antenna_Azimut_Bridge_Off; safecall;
    procedure Antenna_Elevat_Bridge_Off; safecall;
    procedure Antenna_Alarm_Set; safecall;
    procedure Antenna_Alarm_Reset; safecall;
  published  // ITxRx
    procedure TxRx_Control(Channel: Byte; Control: Word); safecall;
    function TxRx_Status(Channel: Byte): Byte; safecall;
    function TxRx_Converter(Channel, Selection: Byte): Byte; safecall;
    procedure TxRx_Mode(Channel, Mode: Byte); safecall;
  published  // IRadar
    procedure Radar_Control(Control: Word); safecall;
    function Radar_Status: Word; safecall;
    procedure Radar_On; safecall;
    procedure Radar_Off; safecall;
    procedure Radar_Ok; safecall;
  end;

procedure Register;

implementation

  uses
    Windows;

  const
  //DIOC_Invalid                    = $00;
    DIOC_Enable_IO                  = $01;
    DIOC_Disable_IO                 = $02;
    DIOC_Enable_Int                 = $03;
    DIOC_Disable_Int                = $04;
    DIOC_Enable_DMA                 = $05;
    DIOC_Disable_DMA                = $06;
    DIOC_Get_Version                = $07;
    DIOC_Sync_Test                  = $08;
    DIOC_Sync_Program               = $09;
    DIOC_Sync_N1_Count              = $0A;
  //DIOC_Invalid                    = $0B;
    DIOC_Video_Test                 = $0C;
    DIOC_Video_Program              = $0D;
    DIOC_Video_Transfer             = $0E;
    DIOC_Video_Callback             = $0F;
    DIOC_Video_Enable               = $10;
    DIOC_Video_Disable              = $11;
    DIOC_Video_State                = $12;
  //DIOC_Invalid                    = $13;
  //DIOC_Invalid                    = $14;
  //DIOC_Invalid                    = $15;
    DIOC_Antenna_Enable_Control     = $16;
    DIOC_Antenna_Disable_Control    = $17;
    DIOC_Antenna_Get_Azimut         = $18;
    DIOC_Antenna_Get_Elevat         = $19;
    DIOC_Antenna_Set_Azimut         = $1A;
    DIOC_Antenna_Set_Elevat         = $1B;
    DIOC_Antenna_Get_Azimut_Speed   = $1C;
    DIOC_Antenna_Get_Elevat_Speed   = $1D;
    DIOC_Antenna_Set_Azimut_Speed   = $1E;
    DIOC_Antenna_Set_Elevat_Speed   = $1F;
    DIOC_Antenna_Get_Azimut_Current = $20;
    DIOC_Antenna_Get_Elevat_Current = $21;
    DIOC_Antenna_Set_Azimut_Current = $22;
    DIOC_Antenna_Set_Elevat_Current = $23;
    DIOC_Antenna_Set_Azimut_Bridge  = $24;
    DIOC_Antenna_Set_Elevat_Bridge  = $25;
    DIOC_Antenna_Enable_Measure     = $26;
    DIOC_Antenna_Disable_Measure    = $27;
    DIOC_Antenna_Alarm_Set          = $28;
    DIOC_Antenna_Alarm_Reset        = $29;
    DIOC_Antenna_Azimut_Bridge_Off  = $2A;
    DIOC_Antenna_Elevat_Bridge_Off  = $2B;
    DIOC_TxRx_Control               = $2C;
    DIOC_TxRx_Status                = $2D;
    DIOC_TxRx_Converter             = $2E;
    DIOC_TxRx_Mode                  = $2F;
  //DIOC_Invalid                    = $30;
  //DIOC_Invalid                    = $31;
    DIOC_Radar_Control              = $32;
    DIOC_Radar_Status               = $33;
    DIOC_Radar_On                   = $34;
    DIOC_Radar_Off                  = $35;
    DIOC_Radar_Ok                   = $36;

  var
    VxDHandle : integer = INVALID_HANDLE_VALUE;

  var
    BytesReturned : integer;


{ Public procedures & functions }

  function Installed : boolean;
  begin
    Result := VxDHandle <> INVALID_HANDLE_VALUE;
  end;


{General API}

  function Get_Version : integer;
  begin
    DeviceIOControl( VxDHandle, DIOC_Get_Version,
                     nil, 0,
                     @Result, sizeof(Result),
                     BytesReturned, nil );
  end;

  procedure Enable_IO;
  begin
    DeviceIOControl( VxDHandle, DIOC_Enable_IO,
                     nil, 0,
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Disable_IO;
  begin
    DeviceIOControl( VxDHandle, DIOC_Disable_IO,
                     nil, 0,
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Enable_Int( Int : byte );
  begin
    DeviceIOControl( VxDHandle, DIOC_Enable_Int,
                     @Int, sizeof(Int),
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Disable_Int( Int : byte );
  begin
    DeviceIOControl( VxDHandle, DIOC_Disable_Int,
                     @Int, sizeof(Int),
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Enable_DMA( Channel : byte );
  begin
    DeviceIOControl( VxDHandle, DIOC_Enable_DMA,
                     @Channel, sizeof(Channel),
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Disable_DMA( Channel : byte );
  begin
    DeviceIOControl( VxDHandle, DIOC_Disable_DMA,
                     @Channel, sizeof(Channel),
                     nil, 0,
                     BytesReturned, nil );
  end;


{Sinchronizer API}

  type
    TSyncTestInput = packed record
      Channel : byte;
      Value   : TSyncTest;
    end;

  function Sync_Test( Channel : byte; Value : TSyncTest ) : TSyncTest;
  var
    InBuffer : TSyncTestInput;
  begin
    InBuffer.Channel := Channel;
    InBuffer.Value   := Value;
    DeviceIOControl( VxDHandle, DIOC_Sync_Test,
                     @InBuffer, sizeof(InBuffer),
                     @Result, sizeof(Result),
                     BytesReturned, nil );
  end;

  type
    TSyncProgInput = packed record
      Channel : byte;
      Mode    : word;
      Cell    : TSyncCell;
    end;

  procedure Sync_Program( Channel : byte; Mode : word; Cell : TSyncCell );
  var
    InBuffer : TSyncProgInput;
  begin
    InBuffer.Channel := Channel;
    InBuffer.Mode    := Mode;
    InBuffer.Cell    := Cell;
    DeviceIOControl( VxDHandle, DIOC_Sync_Program,
                     @InBuffer, sizeof(InBuffer),
                     nil, 0,
                     BytesReturned, nil );
  end;

  function Sync_N1_Count( Channel : byte ) : integer;
  begin
    DeviceIOControl( VxDHandle, DIOC_Sync_N1_Count,
                     @Channel, sizeof(Channel),
                     @Result, sizeof(Result),
                     BytesReturned, nil );
  end;


{Video API}

  type
    TVideoTestInput = packed record
      Channel : byte;
      Value   : TVideoTest;
    end;

  function Video_Test( Channel : byte; Value : TVideoTest ) : TVideoTest;
  var
    InBuffer : TVideoTestInput;
  begin
    InBuffer.Channel := Channel;
    InBuffer.Value   := Value;
    DeviceIOControl( VxDHandle, DIOC_Video_Test,
                     @InBuffer, sizeof(InBuffer),
                     @Result, sizeof(Result),
                     BytesReturned, nil );
  end;

  type
    TVideoProgInput = packed record
      Channel : byte;
      Mode    : byte;
      Count   : TShotCount;
    end;

  procedure Video_Program( Channel, Mode : byte; ShotCount : TShotCount );
  var
    InBuffer : TVideoProgInput;
  begin
    InBuffer.Channel := Channel;
    InBuffer.Mode    := Mode;
    InBuffer.Count   := ShotCount;
    DeviceIOControl( VxDHandle, DIOC_Video_Program,
                     @InBuffer, sizeof(InBuffer),
                     nil, 0,
                     BytesReturned, nil );
  end;

  type
    TVideoTransInput = packed record
      Channel : byte;
      Model   : byte;
      Count   : word;
    end;

  function Video_Transfer( Channel, Model : byte; Count : word;
                           Address : pointer; Size : integer;
                           hEvent : integer ) : boolean;
  var
    InBuffer : TVideoTransInput;
    Event    : integer;
  const
    Overlapped    : array[Video1..Video2] of TOverlapped = ( (), () );
    BytesReturned : array[Video1..Video2] of integer     = ( 0, 0 );
  begin
    InBuffer.Channel := Channel;
    InBuffer.Model   := Model;
    InBuffer.Count   := Count;
    if hEvent = 0
      then Event := CreateEvent( nil, true, false, nil )
      else Event := hEvent;
    ResetEvent( Event );
    Overlapped[Channel].hEvent := Event;
    DeviceIOControl( VxDHandle, DIOC_Video_Transfer,
                     @InBuffer, sizeof(InBuffer),
                     Address, Size,
                     BytesReturned[Channel],
                     @Overlapped[Channel] );
    Result := GetLastError = ERROR_IO_PENDING;
    if hEvent = 0
      then
        begin
          Result := Result and GetOverlappedResult( VxDHandle,
                                                    Overlapped[Channel],
                                                    BytesReturned[Channel],
                                                    true );
          CloseHandle( Event );
        end;
  end;

  procedure Video_Enable;
  begin
    DeviceIOControl( VxDHandle, DIOC_Video_Enable,
                     nil, 0,
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Video_Disable;
  begin
    DeviceIOControl( VxDHandle, DIOC_Video_Disable,
                     nil, 0,
                     nil, 0,
                     BytesReturned, nil );
  end;

  function Video_State : TVideoState;
  begin
    DeviceIOControl( VxDHandle, DIOC_Video_State,
                     nil, 0,
                     @Result, sizeof(Result),
                     BytesReturned, nil );
  end;


{Antenna API}

  procedure Antenna_Enable_Control;
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Enable_Control,
                     nil, 0,
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Antenna_Disable_Control;
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Disable_Control,
                     nil, 0,
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Antenna_Enable_Measure;
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Enable_Measure,
                     nil, 0,
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Antenna_Disable_Measure;
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Disable_Measure,
                     nil, 0,
                     nil, 0,
                     BytesReturned, nil );
  end;

  function Antenna_Get_Azimut : TAngleCode;
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Get_Azimut,
                     nil, 0,
                     @Result, sizeof(Result),
                     BytesReturned, nil );
  end;

  function Antenna_Get_Elevat : TAngleCode;
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Get_Elevat,
                     nil, 0,
                     @Result, sizeof(Result),
                     BytesReturned, nil );
  end;

  procedure Antenna_Set_Azimut( Code : TAngleCode );
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Set_Azimut,
                     @Code, sizeof(Code),
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Antenna_Set_Elevat( Code : TAngleCode );
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Set_Elevat,
                     @Code, sizeof(Code),
                     nil, 0,
                     BytesReturned, nil );
  end;

  function Antenna_Get_Azimut_Speed : integer;
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Get_Azimut_Speed,
                     nil, 0,
                     @Result, sizeof(Result),
                     BytesReturned, nil );
  end;

  function Antenna_Get_Elevat_Speed : integer;
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Get_Elevat_Speed,
                     nil, 0,
                     @Result, sizeof(Result),
                     BytesReturned, nil );
  end;

  procedure Antenna_Set_Azimut_Speed( Code : integer );
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Set_Azimut_Speed,
                     @Code, sizeof(Code),
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Antenna_Set_Elevat_Speed( Code : integer );
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Set_Elevat_Speed,
                     @Code, sizeof(Code),
                     nil, 0,
                     BytesReturned, nil );
  end;

  function Antenna_Get_Azimut_Current : TCurrentCode;
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Get_Azimut_Current,
                     nil, 0,
                     @Result, sizeof(Result),
                     BytesReturned, nil );
  end;

  function Antenna_Get_Elevat_Current : TCurrentCode;
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Get_Elevat_Current,
                     nil, 0,
                     @Result, sizeof(Result),
                     BytesReturned, nil );
  end;

  procedure Antenna_Set_Azimut_Current( Code : TCurrentCode );
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Set_Azimut_Current,
                     @Code, sizeof(Code),
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Antenna_Set_Elevat_Current( Code : TCurrentCode );
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Set_Elevat_Current,
                     @Code, sizeof(Code),
                     nil, 0,
                     BytesReturned, nil );
  end;

  type
    TAntSetBridgeInput = packed record
      Bridge : byte;
      Code   : TBridgeCode;
    end;

  procedure Antenna_Set_Azimut_Bridge( Bridge : byte; Code : TBridgeCode );
  var
    InBuffer : TAntSetBridgeInput;
  begin
    InBuffer.Bridge := Bridge;
    InBuffer.Code   := Code;
    DeviceIOControl( VxDHandle, DIOC_Antenna_Set_Azimut_Bridge,
                     @InBuffer, sizeof(InBuffer),
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Antenna_Set_Elevat_Bridge( Bridge : byte; Code : TBridgeCode );
  var
    InBuffer : TAntSetBridgeInput;
  begin
    InBuffer.Bridge := Bridge;
    InBuffer.Code   := Code;
    DeviceIOControl( VxDHandle, DIOC_Antenna_Set_Elevat_Bridge,
                     @InBuffer, sizeof(InBuffer),
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Antenna_Azimut_Bridge_Off;
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Azimut_Bridge_Off,
                     nil, 0,
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Antenna_Elevat_Bridge_Off;
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Elevat_Bridge_Off,
                     nil, 0,
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Antenna_Alarm_Set;
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Alarm_Set,
                     nil, 0,
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Antenna_Alarm_Reset;
  begin
    DeviceIOControl( VxDHandle, DIOC_Antenna_Alarm_Reset,
                     nil, 0,
                     nil, 0,
                     BytesReturned, nil );
  end;


{TxRx API}

  type
    TTxRxControlInput = packed record
      Channel : byte;
      Control : word;
    end;

  procedure TxRx_Control( Channel : byte; Control : word );
  var
    InBuffer : TTxRxControlInput;
  begin
    InBuffer.Channel := Channel;
    InBuffer.Control := Control;
    DeviceIOControl( VxDHandle, DIOC_TxRx_Control,
                     @InBuffer, sizeof(InBuffer),
                     nil, 0,
                     BytesReturned, nil );
  end;

  function TxRx_Status( Channel : byte ) : byte;
  begin
    DeviceIOControl( VxDHandle, DIOC_TxRx_Status,
                     @Channel, sizeof(Channel),
                     @Result, sizeof(Result),
                     BytesReturned, nil );
  end;

  type
    TTxRxConverterInput = packed record
      Channel   : byte;
      Selection : byte;
    end;

  function TxRx_Converter( Channel : byte; Selection : byte ) : byte;
  var
    InBuffer : TTxRxConverterInput;
  begin
    InBuffer.Channel   := Channel;
    InBuffer.Selection := Selection;
    DeviceIOControl( VxDHandle, DIOC_TxRx_Converter,
                     @InBuffer, sizeof(InBuffer),
                     @Result, sizeof(Result),
                     BytesReturned, nil );
  end;

  type
    TTxRxModeInput = packed record
      Channel : byte;
      Mode    : byte;
    end;

  procedure TxRx_Mode( Channel, Mode : byte );
  var
    InBuffer : TTxRxModeInput;
  begin
    InBuffer.Channel := Channel;
    InBuffer.Mode    := Mode;
    DeviceIOControl( VxDHandle, DIOC_TxRx_Mode,
                     @InBuffer, sizeof(InBuffer),
                     nil, 0,
                     BytesReturned, nil );
  end;


{Radar API}

  procedure Radar_Control( Control : word );
  begin
    DeviceIOControl( VxDHandle, DIOC_Radar_Control,
                     @Control, sizeof(Control),
                     nil, 0,
                     BytesReturned, nil );
  end;

  function Radar_Status : word;
  begin
    DeviceIOControl( VxDHandle, DIOC_Radar_Status,
                     nil, 0,
                     @Result, sizeof(Result),
                     BytesReturned, nil );
  end;

  procedure Radar_On;
  begin
    DeviceIOControl( VxDHandle, DIOC_Radar_On,
                     nil, 0,
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Radar_Off;
  begin
    DeviceIOControl( VxDHandle, DIOC_Radar_Off,
                     nil, 0,
                     nil, 0,
                     BytesReturned, nil );
  end;

  procedure Radar_Ok;
  begin
    DeviceIOControl( VxDHandle, DIOC_Radar_Ok,
                     nil, 0,
                     nil, 0,
                     BytesReturned, nil );
  end;

procedure Register;
begin
  RegisterComponents('Vesta', [TLDT1097]);
end;

end.

