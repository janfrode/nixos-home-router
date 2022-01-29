{ pkgs, lib, ... }:{

   services.dhcpd4 = {
    enable = true;
    interfaces = [ "vlan20" "vlan30" "vlan99" "vlan1" ];
    extraConfig = ''
      #option local-pac-server code 252 = text;
      #option local-pac-server "https://tanso.net/wpad.dat";
      option domain-name "tanso.net";
      option domain-name-servers 8.8.8.8, 8.8.4.4;

      subnet 172.20.20.0 netmask 255.255.255.0 {
        default-lease-time 3600;
        max-lease-time 7200;
        range 172.20.20.100 172.20.20.223;
        option routers 172.20.20.1;
	option domain-name-servers 172.20.20.1, 109.247.114.4, 92.220.228.70;
	option ntp-servers 172.20.20.1;
	option domain-name "tanso.net";
      }

      subnet 172.20.30.0 netmask 255.255.255.0 {
        default-lease-time 3600;
        max-lease-time 7200;
        range 172.20.30.100 172.20.30.250;
	option routers 172.20.30.1;
	option domain-name-servers 172.20.30.2, 172.20.30.1, 109.247.114.4;
	option ntp-servers 172.20.30.1;
	option domain-name "tanso.net";
      }

      subnet 172.20.99.0 netmask 255.255.255.0 {
        default-lease-time 3600;
        max-lease-time 7200;
        range 172.20.99.100 172.20.99.250;
	option routers 172.20.99.1;
	option domain-name-servers 172.20.99.1, 109.247.114.4;
	option ntp-servers 172.20.99.1;
	option domain-name "tanso.net";
      }

      subnet 192.168.1.0 netmask 255.255.255.0 {
        default-lease-time 3600;
        max-lease-time 7200;
        range 192.168.1.100 192.168.1.250;
	option routers 192.168.1.1;
	option domain-name-servers 192.168.1.1, 109.247.114.4, 92.220.228.70;
	option ntp-servers 192.168.1.1;
	option domain-name "tanso.net";
      }
    '';
    machines = [
      { 
        hostName = "rt66u.tanso.net"; 
        ethernetAddress = "30:85:a9:6b:a6:f8";
	ipAddress = "172.20.20.10";
      }
      {
        hostName = "verisure.tanso.net"; 
        ethernetAddress = "00:23:c1:1a:ad:ff";
	ipAddress = "172.20.20.11";
      }
      {
        hostName = "hue.tanso.net"; 
        ethernetAddress = "00:17:88:4c:62:3e";
	ipAddress = "172.20.30.10";
      }
      {
        hostName = "mushkin.tanso.net"; 
        ethernetAddress = "00:1f:f3:8a:f5:8c";
	ipAddress = "172.20.30.2";
      }
      {
        hostName = "thecus.tanso.net"; 
        ethernetAddress = "00:14:fd:17:15:ee";
	ipAddress = "172.20.30.11";
      }
      {
        hostName = "hegel160.tanso.net"; 
        ethernetAddress = "cc:90:93:07:92:a7";
	ipAddress = "172.20.30.12";
      }
      {
        hostName = "raspberry3b.tanso.net"; 
        ethernetAddress = "b8:27:eb:70:80:e7";
	ipAddress = "172.20.30.14";
      }
      {
        hostName = "froya-ipad.tanso.net"; 
        ethernetAddress = "f8:95:ea:f3:4b:b0";
	ipAddress = "172.20.30.15";
      }
      {
        hostName = "froya-hoytaler.tanso.net"; 
        ethernetAddress = "ec:66:d1:0c:02:96";
	ipAddress = "172.20.30.16";
      }
      {
        hostName = "falk-ipad.tanso.net"; 
        ethernetAddress = "34:7c:25:18:f7:1a";
	ipAddress = "172.20.30.17";
      }
      {
        hostName = "froya-iphone.tanso.net"; 
        ethernetAddress = "98:9e:63:a0:6b:8e";
	ipAddress = "172.20.30.18";
      }
      {
        hostName = "loftstua-appletv.tanso.net"; 
        ethernetAddress = "c8:69:cd:5c:03:17";
	ipAddress = "172.20.30.19";
      }
      {
        hostName = "siri-iphone.tanso.net"; 
        ethernetAddress = "86:2d:85:e8:e7:c4";
	ipAddress = "172.20.30.20";
        ##option domain-name-servers 172.20.30.1, 109.247.114.4;
      }
      {
        hostName = "allrom.tanso.net"; 
        ethernetAddress = "b8:27:eb:11:ff:2c";
	ipAddress = "172.20.30.21";
      }
      {
        hostName = "kontoret.tanso.net"; 
        ethernetAddress = "b8:27:eb:c1:76:b4";
	ipAddress = "172.20.30.22";
      }
      {
        hostName = "froya.tanso.net"; 
        ethernetAddress = "24:4b:fe:47:f2:3a";
	ipAddress = "172.20.30.23";
      }
    ];
  };
}
