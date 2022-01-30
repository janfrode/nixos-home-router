
This is my nixos based home router. 

The network components are:

* Huawei managed 1 GbE switch
* A few Unifi access points.
* An old Intel NUC D33217GKE as router.

My ISP connection goes to the switch, and is mapped to VLAN10. 

Unifi access points are placed in the infrastrructure VLAN1.

My basement apartment is on VLAN20.  

My own devices are on VLAN30.

Communication between VLAN20, VLAN30 and VLAN1 should be blocked, but currently
isn't.

The router runs DHCP, DNS, NTP,  Wireguard and syslog from internal networks.

I store my secrets in /etc/nixos/secrets/, which is excluded from this repo by .gitignore.
