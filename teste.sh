
#
# retorna 0 se o servidor esta ligado
#

GATEWAY=192.168.15.1
SERVER=192.168.15.74			# Discovery 11

ping -t 1 -q -c 1 $SERVER > /dev/null
R=T${?}
if [ $R != T1 ]; then
	exit 0				# ligado
else
	exit 1				# ether-wake erro
fi


