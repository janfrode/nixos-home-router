{ pkgs, lib, ... }:{

  services.avahi = {
    enable = true;
    reflector = true;
    interfaces = [
      "vlan30"
    ];
  };
}
