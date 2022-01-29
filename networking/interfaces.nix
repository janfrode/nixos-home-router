{ pkgs, lib, ... }:{

  networking.vlans = {
      vlan1 = { id=1; interface="eno1"; };
      wan = { id=10; interface="eno1"; };
      vlan20 = { id=20; interface="eno1"; };
      vlan30 = { id=30; interface="eno1"; };
      vlan99 = { id=99; interface="eno1"; };
    };

  networking.interfaces = {
    eno1.useDHCP = false;
    #eno1.useDHCP = true;
    wan.useDHCP = true;
    vlan1.ipv4.addresses = [{
      address = "192.168.1.1";
      prefixLength = 24;
    }];
    vlan20.ipv4.addresses = [{
      address = "172.20.20.1";
      prefixLength = 24;
    }];
    vlan30.ipv4.addresses = [{
        address = "172.20.30.1";
        prefixLength = 24;
    }];
    vlan99.ipv4.addresses = [{
      address = "172.20.99.1";
      prefixLength = 24;
    }];
  };
}
