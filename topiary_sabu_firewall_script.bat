netsh advfirewall reset
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

netsh advfirewall firewall add rule name=”RDP” dir=out protocol=tcp localport=3389 action=allow
netsh advfirewall firewall add rule name=”RDP” dir=in protocol=tcp localport=3389 action=allow

netsh advfirewall firewall add rule name="WinRM-in" protocol=tcp localport=5985,5986 action=allow
netsh advfirewall firewall add rule name="WinRM-out" protocol=tcp localport=5985,5986 action=allow

netsh advfirewall firewall add rule name=”HTTPI” dir=in protocol=tcp localport=443,80 action=allow
netsh advfirewall firewall add rule name=”HTTPO” dir=out protocol=tcp localport=443,80 action=allow

netsh advfirewall set allprofiles logging filename \Windows\fw.log
netsh advfirewall set allprofiles logging maxfilesize 32676
netsh advfirewall set allprofiles logging droppedconnections enable 
netsh advfirewall set allprofiles settings inboundusernotification enable
