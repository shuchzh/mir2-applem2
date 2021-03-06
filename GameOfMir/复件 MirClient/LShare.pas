unit LShare;

interface

uses
Messages, Windows, SysUtils;

const
  COPYMSG_LOGIN_HINTMSG = 1000;
  COPYMSG_LOGIN_SENDSERVERLIST = 1001;
  COPYMSG_LOGIN_WEBINFO = 1002;
  
  WM_REST = WM_USER + 888;
  WM_DISPOSALXML = WM_USER + 1000;
  WM_CHANGEPERCENT = WM_USER + 1001;
  WM_MYREAD_OK = WM_USER + 1002;
  WM_SELFCHANGE = WM_USER + 1003;
  WM_GETSERVERLIST = WM_USER + 1004;
  WM_CHECK_CLIENT = WM_USER + 1005;
  WM_WRITELOGO = WM_USER + 1010;

  MSG_CHECK_CLIENT_TEST = 1;
  MSG_CHECK_CLIENT_EXIT = 2;

type
  TCServerInfo = packed record
    sName: string[24];
    sAddrs: string[150];
    sPort: string[80];
  end;
  TCServerInfos = array[0..7] of TCServerInfo;

  TCWebInfo = packed record
    g_GMUrl: string[255];
    g_PayUrl: string[255];
    g_RegUrl: string[255];
    g_ChangePassUrl: string[255];
    g_LostPassUrl: string[255];
    g_UserList: string[255];
    g_GameName: string[12];
  end;

  pTLServerInfo = ^TLServerInfo;
  TLServerInfo = packed record
    sShowName: string[60];
    Info: TCServerInfos;
    ENInfo: TCServerInfos;
    boCheck: Boolean;
    nIndex: Integer;
    CAddr: string;
    CPort: Word;
  end;

  function CheckMirDir(sDir: string; boClient: Boolean): Boolean;

var
  g_Login_Handle: THandle;
  g_Login_Index: SmallInt;
  g_ServerInfo: TCServerInfos;
  g_WebInfo: TCWebInfo;
  g_ServerInfoCount: SmallInt;

implementation

function CheckMirDir(sDir: string; boClient: Boolean): Boolean;
begin
  Result := False;
  if sDir = '' then
    exit;
  if not DirectoryExists(sDir + 'data\books') then
    exit;
  if not DirectoryExists(sDir + 'data\minimap') then
    exit;
  if not DirectoryExists(sDir + 'data\ui') then
    exit;
  if not FileExists(sDir + 'wav\sound.lst') then
    exit;
  if not FileExists(sDir + 'map\0122.map') then
    exit;
  if not FileExists(sDir + 'data\Prguse.wil') then
    exit;
  if not FileExists(sDir + 'data\Prguse2.wil') then
    exit;
  if not FileExists(sDir + 'data\Prguse3.wil') then
    exit;
  if not FileExists(sDir + 'data\Tiles.wil') then
    exit;
  if not FileExists(sDir + 'data\SmTiles.wil') then
    exit;
  if not FileExists(sDir + 'data\Objects2.wil') then
    exit;
  if not FileExists(sDir + 'data\Objects.wil') then
    exit;
  if not FileExists(sDir + 'data\Objects3.wil') then
    exit;
  if not FileExists(sDir + 'data\Objects5.wil') then
    exit;
  if not FileExists(sDir + 'data\npc.wil') then
    exit;
  if not FileExists(sDir + 'data\mmap.wil') then
    exit;
  if not FileExists(sDir + 'data\MagIcon.wil') then
    exit;
  if not FileExists(sDir + 'data\Hum.wil') then
    exit;
  if not FileExists(sDir + 'data\Effect.wil') then
    exit;
  if not FileExists(sDir + 'data\Dragon.wil') then
    exit;
  if boClient then begin
    if not FileExists(sDir + 'Resource\Data\Prguse.pak') then
      exit;
    if not FileExists(sDir + 'Resource\Data\ChrSel.pak') then
      exit;
  end;
  Result := True;
end;

end.
