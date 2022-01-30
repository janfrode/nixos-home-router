{ pkgs, lib, ... }:{

  services.ddclient = {
    enable = true;
    username = "7391dcf201be8729";
    passwordFile = "/etc/nixos/secrets/ddclient-password";
    domains = [ "tanso.net" ];
    protocol = "dyndns2";
    server = "svc.joker.com";
    ssl = true;
    use = "if if=wan";
  };
}
