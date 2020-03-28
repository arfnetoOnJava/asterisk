#
# '20
#
# Assigned IP
#
GATEWAY=192.168.15.1
PLEX=192.168.15.74			# DSK-1910
SERVER_MAC=00:1F:C6:B0:E0:E6		# Discovery 11 onboard nic
SEGFLEX_MAC=00:1D:7D:81:23:39

# MAC

# o desktop tem 3 placas de rede mas o WOL so funcionou da D-Link
# que hoje e a de baixo (06/jan/2019
#
DB_Server=84:16:F9:00:5e:38		# Discovery 11 PLACA TP-LINK TG-3269
Plex_OnBoard=00:22:15:8D:B7:8C		# DSK-1910
Plex_DLink=1C:BD:B9:E6:79:C0
Plex_Realtek=00:1A:3F:8E:44:52
A6_onBoard=bc:5f:f4:88:b3:ce		# Guaruja
HP8000=3c:4a:92:5a:a5:16		# HP
SERVER_MAC=00:1F:C6:B0:E9:20		# Discovery 12 OnBoard NIC

ping -t 3 -q -c 1 $PLEX > /dev/null
R=T${?}
if [ $R != T1 ]; then
    exit 0	
fi

ether-wake -i enp4s0 ${Plex_DLink}
R=T${?}
if [ $R == T0 ]; then
    exit 1			# ether-wake ok
fi
exit 2				# ether-wake erro
