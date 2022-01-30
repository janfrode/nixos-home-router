{ pkgs, lib, ... }:{

  services.darkhttpd = {
    enable = true;
    address = "0.0.0.0";
    rootDir = "/srv/www";
  };
}
