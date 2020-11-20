unit Taskbar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;


type
  TTaskbarIconNotify = procedure (what : integer) of object;

type
  TTaskbarStateIcon =
    class(TComponent)
      public
        constructor Create(aOwner : TComponent);   override;
        destructor  Destroy;   override;
      private
        fIcon     : TIcon;
        fToolTip  : string;
        fOnNotify : TTaskbarIconNotify;
        procedure SetIcon(which : TIcon);
        procedure SetToolTip(which : string);
      published
        property Icon     : TIcon   read fIcon    write SetIcon;
        property ToolTip  : string  read fToolTip write SetToolTip;
        property OnNotify : TTaskbarIconNotify read fOnNotify write fOnNotify;
      protected
        procedure Loaded;   override;
        procedure Notify(what : integer);   virtual;
      private
        procedure NotifyIcon(msg : DWORD; hIcon : HICON; aToolTip : pchar);
        procedure Add(hIcon : HICON; aToolTip : pchar);
        procedure Modify(hIcon : HICON; aToolTip : pchar);
        procedure Remove;
    end;


procedure Register;


implementation

// {$R *.dcr}

uses
  ShellAPI;


const
  MYWM_NOTIFYICON = WM_USER + 3024;

  
type
  TTaskbarIcon =
    class(TIcon)
      public
        constructor CreateIcon(aOwner : TTaskbarStateIcon);
      protected
        procedure Changed(Sender : TObject);   override;
      private
        fOwner       : TTaskbarStateIcon;
        fSavedHandle : HICON;
    end;

type
  TEventHandler =
    class
      public
        constructor Create;
        destructor  Destroy;   override;
      private
        hWindow : HWND;
        procedure Handler(var msg : TMessage);
    end;


var  // class variables (TTaskbarStateIcon)
  StateIcons : integer       = 0;
  Events     : TEventHandler = nil;


// TTaskbarIcon

constructor TTaskbarIcon.CreateIcon(aOwner : TTaskbarStateIcon);
  begin
    inherited Create;
    fOwner := aOwner;
  end;

procedure TTaskbarIcon.Changed(Sender : TObject);
  var
    lHandle : HICON;
  begin
    inherited;
    if fOwner <> nil
      then
        begin
          lHandle := Handle;
          if lHandle <> 0
            then
              if fSavedHandle <> 0
                then fOwner.Modify(lHandle, pchar(fOwner.fToolTip))
                else fOwner.Add(lHandle, pchar(fOwner.fToolTip))
            else
              if fSavedHandle <> 0
                then fOwner.Remove;
          fSavedHandle := lHandle;
        end;
  end;


// TEventHandler

constructor TEventHandler.Create;
  begin
    inherited;
    hWindow := AllocateHWnd(Handler);
  end;

destructor TEventHandler.Destroy;
  begin
    DeallocateHWnd(hWindow);
    inherited;
  end;

procedure TEventHandler.Handler(var msg : TMessage);
  var
    Obj : TTaskbarStateIcon;
  begin
    with msg do
      if msg = MYWM_NOTIFYICON
        then
          begin
            obj := TTaskbarStateIcon(wParam);
            assert(obj <> nil);
            obj.Notify(lParam);
          end;
  end;

// TTaskbarStateIcon

constructor TTaskbarStateIcon.Create(aOwner : TComponent);
  begin
    inherited;
    if StateIcons = 0
      then Events := TEventHandler.Create;
    inc(StateIcons);
    fIcon := TTaskbarIcon.CreateIcon(Self);
  end;

destructor TTaskbarStateIcon.Destroy;
  begin
    if fIcon.Handle <> 0
      then Remove;
    fIcon.Destroy;
    dec(StateIcons);
    if StateIcons = 0
      then Events.Free;
    inherited;
  end;

procedure TTaskbarStateIcon.SetIcon(which : TIcon);
  begin
    fIcon.Assign(which);
  end;

procedure TTaskbarStateIcon.SetToolTip(which : string);
  const
    MAXTOOLTIPLEN = 63;   // pred(sizeof(TNOTIFYICONDATA.szTip));
  begin
    if length(which) > MAXTOOLTIPLEN
      then SetLength(which, MAXTOOLTIPLEN);
    if fIcon.Handle <> 0
      then Modify(0, pchar(which));
    fToolTip := which;
  end;

procedure TTaskbarStateIcon.Loaded;
  begin
    inherited;
    if fIcon.Handle <> 0
      then Add(fIcon.Handle, pchar(fToolTip));
  end;

procedure TTaskbarStateIcon.Notify(what : integer);
  begin
    if assigned(fOnNotify)
      then fOnNotify(what);
  end;

procedure TTaskbarStateIcon.NotifyIcon(msg : DWORD; hIcon : HICON; aToolTip : pchar);
  var
    aux : TNOTIFYICONDATA;
  begin
    if not (csDesigning in ComponentState)
      then
        begin
          aux.cbSize := sizeof(aux);
          aux.Wnd    := Events.hWindow;
          aux.uID    := integer(Self);
          aux.uFlags := NIF_MESSAGE;
          if aToolTip <> nil
            then aux.uFlags := aux.uFlags or NIF_TIP;
          if hIcon <> 0
            then aux.uFlags := aux.uFlags or NIF_ICON;
          aux.uCallbackMessage := MYWM_NOTIFYICON;
          aux.hIcon := hIcon;
          if aToolTip <> nil
            then lstrcpyn(aux.szTip, aToolTip, sizeof(aux.szTip))
            else aux.szTip[0] := #0;
          Shell_NotifyIcon(msg, @aux);
        end;
  end;

procedure TTaskbarStateIcon.Add(hIcon : HICON; aToolTip : pchar);
  begin
    NotifyIcon(NIM_ADD, hIcon, aToolTip);
  end;

procedure TTaskbarStateIcon.Modify(hIcon : HICON; aToolTip : pchar);
  begin
    NotifyIcon(NIM_MODIFY, hIcon, aToolTip);
  end;

procedure TTaskbarStateIcon.Remove;
  begin
    NotifyIcon(NIM_DELETE, 0, nil);
  end;

procedure Register;
  begin
    RegisterComponents('Vesta', [TTaskbarStateIcon]);
  end;

end.

