�
 TDELPHIXDXPLAYFORM 0,  TPF0TDelphiXDXPlayFormDelphiXDXPlayFormLeftKTop� BorderStylebsDialogCaptionSetting of communicationClientHeightClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PositionpoScreenCenterScaled	OnDestroyFormDestroyOnShowFormShowPixelsPerInch`
TextHeight TBevelBevel2LeftTop
Width� Height�   TBevelBevel1LeftTop� Width�Height  	TNotebookNotebookLeft� TopWidthIHeight� TabOrder OnPageChangedNotebookPageChanged TPage Left Top CaptionSelectProvider TLabelLabel1LeftTopWidth!HeightAutoSizeCaption'Please choose the communication method.WordWrap	  TListBoxProviderListLeft Top8WidthHeight� Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTerminal
Font.Style 
ItemHeight
ParentFontTabOrder OnClickProviderListClick	OnKeyDownEditKeyDown   TPage Left Top CaptionSessionType TLabelLabel2LeftTopWidth!HeightAutoSizeCaption3Please specify the method of beginning of the game.WordWrap	  TRadioButtonNewGameLeftXTopXWidthqHeightCaptionNew gameChecked	TabOrder TabStop	OnClickNewGameClick	OnKeyDownEditKeyDown  TRadioButtonJoinGameLeftXToppWidth� HeightCaption	Join gameTabOrderOnClickNewGameClick	OnKeyDownEditKeyDown   TPage Left Top Caption
SessionNew TLabelLabel3LeftTopWidth!HeightAutoSizeCaptionGA new game is made . Please input the session name and the player name.WordWrap	  TLabelLabel4Left$TopWWidthBHeightCaption&Session nameFocusControlNewGameSessionName  TLabelLabel5Left$TopqWidth:HeightCaption&Player nameFocusControlNewGamePlayerName  TEditNewGameSessionNameLeft� TopSWidth� HeightTabOrder OnChangeNotebookPageChanged	OnKeyDownNewGameSessionNameKeyDown  TEditNewGamePlayerNameLeft� TopmWidth� HeightTabOrderOnChangeNotebookPageChanged	OnKeyDownNewGamePlayerNameKeyDown   TPage Left Top CaptionSessionJoin TLabelLabel7Left"Top� Width:HeightCaption&Player nameFocusControlJoinGamePlayerName  TLabelLabel8LeftTopWidth!HeightAutoSizeCaptionkYou participate in an existing game . Please choose the participation session,  and input the player name. WordWrap	  TEditJoinGamePlayerNameLeft� Top� Width� HeightTabOrderOnChangeNotebookPageChanged	OnKeyDownJoinGamePlayerNameKeyDown  TListBoxJoinGameSessionListLeft Top8Width� HeightnFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTerminal
Font.Style 
ItemHeight
ParentFontTabOrder OnClickJoinGameSessionListClick	OnKeyDownJoinGameSessionListKeyDown  TListBoxJoinGamePlayerListLeft� Top8WidtheHeightnEnabled
ItemHeightTabOrder    TButton
NextButtonLeft1Top� WidthYHeightCaptionNext >TabOrderOnClickNextButtonClick  TButton
BackButtonLeft� Top� WidthYHeightCaption< &BackTabOrderOnClickBackButtonClick  TButtonCancelButtonLeft�Top� WidthQHeightCancel	CaptionCancelTabOrderOnClickCancelButtonClick  TTimerJoinGameGetPlayerListTimerEnabledInterval� OnTimerJoinGameGetPlayerListTimerTimerLeft� TopH   