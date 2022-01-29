{ pkgs, lib, ... }:{
   networking.wireguard.interfaces = {
     wireguard = {
       ips = [ "172.20.60.1/24" ];
       listenPort = 61891;
       privateKeyFile = "/etc/nixos/secrets/wireguard-privateKey";
       peers = [
         {
	   publicKey = "897mRPejuv9yVnmTvcUL7ckQkIiM0wnSgHmgR15Evyw=";
	   allowedIPs = [ "172.20.60.10/32" ];
	   presharedKeyFile = "/etc/nixos/secrets/wireguard-presharedkey";
	 }
         {
	   publicKey = "OBwrULCECC1bH/oMkuyput1D0Sl/ZxoTBoXtEScTHzY=";
	   allowedIPs = [ "172.20.60.11/32" ];
	   presharedKeyFile = "/etc/nixos/secrets/wireguard-presharedkey";
	 }
         {
	   publicKey = "tqg0i3v4d3h4vzN6GakpXWucFl2FLDtD1q8IXnAga1o=";
	   allowedIPs = [ "172.20.60.12/32" ];
	   presharedKeyFile = "/etc/nixos/secrets/wireguard-presharedkey";
	 }
         {
           # spania
	   publicKey = "ekV0KB96PWQik28vh0/QJfHyeX6qJrhZ1jd53IfMLiM=";
	   allowedIPs = [ "172.20.60.13/32" "192.168.0.0/24" ];
	   presharedKeyFile = "/etc/nixos/secrets/wireguard-presharedkey";
	 }
         {
           # Stavtjørn:
	   publicKey = "GQ2CTd/jYSXREdSK2unnGdU5xhkVJGmWCEbNvoW2cgw=";
	   allowedIPs = [ "172.20.60.14/32" "172.20.70.0/24" ];
	   presharedKeyFile = "/etc/nixos/secrets/wireguard-presharedkey";
	 }
         {
           # Siri:
	   publicKey = "/4I1g2bMras7psU0mHXFuxB2yKnyCrBfzxJ6tdJENgA=";
	   allowedIPs = [ "172.20.60.15/32" "172.20.70.0/24" ];
	   presharedKeyFile = "/etc/nixos/secrets/wireguard-presharedkey";
	 }
       ];
     };
   };
}
