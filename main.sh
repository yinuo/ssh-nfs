#!/bin/bash

host_ip=10.30.47.219
target_dir=/home/share/nfsroot
cur_dir=/home/linaro/result

target_scp=/data/test/bmnet/test.result
#cur_scp=/home/linaro/result

./mount.exp $host_ip $target_dir $cur_dir

cd /home/linaro

#./load_balance_server &

tail -n 6 ip_info.txt > last6.ini

cp /home/linaro/last6.ini /home/linaro/zl/last6.ini

cd /home/linaro/zl/


line1=`sed -n "1p" last6.ini`
line2=`sed -n "2p" last6.ini`
line3=`sed -n "3p" last6.ini`
line4=`sed -n "4p" last6.ini`
line5=`sed -n "5p" last6.ini`
line6=`sed -n "6p" last6.ini`

IP_NUM1=${line1:26:14}
IP_NUM2=${line2:26:14}
IP_NUM3=${line3:26:14}
IP_NUM4=${line4:26:14}
IP_NUM5=${line5:26:14}
IP_NUM6=${line6:26:14}

./login_core.exp $IP_NUM1
#./login_core.exp $IP_NUM2
#./login_core.exp $IP_NUM3
#./login_core.exp $IP_NUM4
#./login_core.exp $IP_NUM5
#./login_core.exp $IP_NUM6

while [ 1 ]
do
	./scp.exp $IP_NUM1 $target_scp 1
#	./scp.exp $IP_NUM1 $target_scp 2
#	./scp.exp $IP_NUM1 $target_scp 3
#	./scp.exp $IP_NUM1 $target_scp 4
#	./scp.exp $IP_NUM1 $target_scp 5
#	./scp.exp $IP_NUM1 $target_scp 6
done
