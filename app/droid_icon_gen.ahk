#SingleInstance,Force
#NoEnv

SetWorkingDir, %A_ScriptDir%

applicationname=DroidIconGenerator
Gui, Add, GroupBox, x10 y106 w97 h111, Preview
Gui, Add, Button, x20 y126 w75 h20 , Holo &Light
Gui, Add, Button, x20 y156 w75 h20 , Holo &Dark
Gui, Add, Button, x20 y186 w75 h20 , Holo &Gray
Gui, Add, Picture, x10 y10 w96 h96, android-robog-alone.png
Gui, Add, Text, x116 y10 w275 h13 , Icon Image (SVG) filename
Gui, Add, Edit, WantCtrlA r1 vSvgName x116 y28 w374 h20 ,
Gui, Add, Button, x415 y54 w75 h20 , &Open...
Gui, Add, Text, x116 y84 w275 h13 , Generate Icon to
StringGetPos, pos, A_ScriptDir, %A_Space%
Gui, Add, Edit, WantCtrlA r1 vSvgIconFldr x116 y102 w374 h20, 
Gui, Add, Button, x415 y128 w75 h20 , &Browse...
Gui, Add, Text, x116 y158 w275 h13 , Rename Icon to
Gui, Add, Edit, WantCtrlA r1 vIconName x116 y176 w374 h20, 
Gui, Add, Button, default WantReturn x207 y206 w75 h23 , &Generate
Gui, Add, Button, x292 y206 w75 h23 , &Close
Gui,Add,Text,x10 y+10,This GUI tool was developed by VinDroidApps. Get VinDroidApps from Google Play
Gui,Font,CBlue Underline
Gui,Add,Text,y+5 GVinDroidApps,https://play.google.com/store/apps/developer?id=Vindroidapps
Menu,Tray,NoStandard 
Menu,Tray,DeleteAll 
Menu,Tray,Tip,%applicationname%
Menu, Tray, Icon, lib\dig.ico

if strLen(1) > 0
    GuiControl,Text, SvgName, %1%

Gui, Show, AutoSize Center, Android Icon generator
Return

ButtonHoloLight:
Run "Chrome" "%A_ScriptDir%\assests\assets_holo_light\index.html"
Return

ButtonHoloDark:
Run "Chrome" "%A_ScriptDir%\assests\assets_holo_dark\index.html"
Return

ButtonHoloGray:
Run "Chrome" "%A_ScriptDir%\assests\assets_gray\index.html"
Return

ButtonOpen...:
FileSelectFile, SelectedFile, 1, , Select Icon SVG Image file to generate Icon, Icon SVG Image (*.svg)
if StrLen(SelectedFile) > 0
    GuiControl,Text, SvgName, %SelectedFile%

    SplitPath, SelectedFile,,,, IconNameOnlyVal
    GuiControl,Text, IconName, ic_menu_%IconNameOnlyVal%
Return

ButtonBrowse...:
FileSelectFolder, OutputVar, , 0, Decode Android Application Package to
if StrLen(OutputVar) > 0
    GuiControl,Text, SvgIconFldr, %OutputVar%
Return

ButtonGenerate:
guiControlGet, SvgNameVal, , SvgName
guiControlGet, SvgIconFldrVar, , SvgIconFldr
guiControlGet, IconNameVar, , IconName

if strLen(SvgNameVal) = 0 {
    MsgBox ,48, No SVG to generate icon, Error#101: No SVG image selected.`n`nPlease choose a SVG Icon image (SVG) to generate icon.
    Return
}

IfNotExist, %SvgNameVal%
{
    MsgBox, 16, SVG not exists, Error#102: %SvgNameVal% not found.`n`nPlease choose an existing SVG Icon image (SVG) to generate icon.
    Return
}

if strLen(SvgIconFldrVar) = 0 {
    MsgBox ,48, No output folder, Error#103: No Android project base folder.`n`nPlease Browse and set an Android project base folder to which icons will be generated.
    Return
}

StringGetPos, pos, SvgIconFldrVar, %A_Space%
if pos >= 0
{
    MsgBox, 48, Invalid Android project base folder, Error#104: %SvgIconFldrVar% contains space which is not supported.`n`nPlease Browse a different Android project base folder to which icons will be generated.
    Return
}

Loop
{
    IfNotExist, %SvgIconFldrVar%
    {
        MsgBox, 534, Android project base folder not exists, Error#105: %SvgIconFldrVar% not exists`n`nPlease choose an existing Android project base folder to which icons will be generated.`n`nChoose [Continue] to create %SvgIconFldrVar% folder and proceed.

        IfMsgBox, Cancel
            Return

        IfMsgBox Continue
        {
            FileCreateDir, %SvgIconFldrVar%
            break
        }
    }
    else
        break
}
SplitPath, SvgNameVal,,,, SvgNameOnlyVal

if strLen(IconNameVar) = 0 {
    MsgBox ,48, No Icon name, Error#106: No Icon name specified.`n`nPlease specify to which Icon must be renamed to.
    Return
}

FileRemoveDir, %SvgIconFldrVar%\%SvgNameOnlyVal%, 1
FileCopyDir, %A_ScriptDir%\bin, %SvgIconFldrVar%\%SvgNameOnlyVal%, 1
Run "%A_ScriptDir%\genicons.bat" "%A_ScriptDir%" "%SvgNameVal%" "%SvgNameOnlyVal%" "%SvgIconFldrVar%" "%IconNameVar%"

Return

VinDroidApps:
  Run, https://play.google.com/store/apps/developer?id=Vindroidapps,,UseErrorLevel
Return

GuiEscape:
GuiClose:
ButtonClose:
Gui, Destroy
ExitApp
