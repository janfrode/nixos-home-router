{ pkgs, lib, ... }:{

  services.avahi = {
    enable = true;
    reflector = true;
    openFirewall = false;
    interfaces = [
      "vlan30"
    ];
  };
}
