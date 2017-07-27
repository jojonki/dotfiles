#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Recommended for catching common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

;上の英文4行はデフォルトで記入してあったもの。
;セミコロンは行頭または半角空白後に置く。
;セミコロンの右側はコメント文になる。
;修飾シンボル
;+ Shift、^ Control、! Alt、# Win
;（複数のシンボルを同時に指定するときは、
;「!+」のように間に何も開けずに連続して記述する。）

;＝＝＝＝＝＝＝＝＝＝注意
;CapsLockキーをCtrlキーに
;Capslock::Ctrl
;sc03a::Ctrl
;CaplLockを変更すると不具合あるらしい。（OKという報告も有り）
;ちなみに、CapsLock→CtrlはHHKB Pro2では不要。
;ちなみに、CapsLock→Ctrlはネットブックではレジストリ書き換え（by KeySwap）で実行済。

;＝＝＝＝＝＝＝＝＝＝高頻度（Ctrl+英字で重要キーを代用）
!i::Send, {BS}
!;::Send, {Del}
!vkBBsc027::Send, {Enter} ; コロン
;!@::Send, {Esc}

;＝＝＝＝＝＝＝＝＝＝カーソル（Ctrl+英字でカーソル移動）
!h::Send, {Left}
!l::Send, {Right}
!k::Send, {Up}
!j::Send, {Down}
^!h::Send, {Home} ;行頭へ
^!l::Send, {End} ;行末へ

;＝＝＝＝＝＝＝＝＝＝ジャンプ（Ctrl+Shift+英字でページジャンプ）
;^+i::Send, {PgUp}
;^+k::Send, {PgDn}
;^+u::Send, ^{Home} ;文書先頭へ
;^+o::Send, ^{End} ;文書最後へ

;![::Send {Esc}

;!e::Send, {RWin}


#ifWinActive ahk_exe chrome.exe
  ^0::Send, ^{Tab}
  ^9::Send, ^+{Tab}
#ifWinActive
