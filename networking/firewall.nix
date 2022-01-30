{ pkgs, lib, ... }:{

  networking.nat = {
    enable = true;
    externalInterface = "wan";
    internalInterfaces = [ "wireguard" "vlan20" "vlan30" "vlan99" ];
  };

  networking.firewall = {
    enable = true;
    allowedUDPPorts = [ 61891 ];
    allowedTCPPorts = [ 22 80 ];
    trustedInterfaces = [ "wireguard" "vlan20" "vlan30" "vlan99" ];
    logRefusedConnections = false;
  };
}
