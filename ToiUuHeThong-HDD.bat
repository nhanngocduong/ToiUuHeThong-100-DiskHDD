@echo off
echo  Bat dau quy trinh toi uu hoa he thong...

echo  --------------------------------------
echo  Dang don dep rac he thong...
del /f /s /q "%temp%\*"
del /f /s /q "%windir%\temp\*"
del /f /s /q "%localappdata%\Temp\*"
rundll32.exe advapi32.dll,ProcessIdleTasks
echo  Da don dep rac he thong.

echo  --------------------------------------
echo  Dang toi uu hoa o dia...
chkdsk c: /f /r
defrag c: /u
echo  Da toi uu hoa o dia.

echo  --------------------------------------
echo  Dang quan ly ung dung khoi dong...
echo  Vo hieu hoa cac ung dung khong can thiet khoi dong cung Windows (Y/N)?
choice /c yn /d n
if %errorlevel%==1 (
  echo  Dang vo hieu hoa ung dung...
  dism /online /disable-feature /featurename:WindowsMediaPlayer /norestart
  :: Them cac lenh tat ung dung khac tai day, vi du:
  :: sc config "Ten dich vu" start= disabled
  echo  Da tat ung dung.
) else (
  echo  Bo qua tat ung dung.
)

echo  --------------------------------------
echo  Dang tinh chinh hieu suat he thong...
bcdedit /set disabledynamictick yes
powercfg -h off
echo  Da tinh chinh hieu suat he thong.

echo  --------------------------------------
echo  Hoan tat quy trinh toi uu hoa!
echo  Khoi dong lai may tinh de ap dung thay doi.
pause