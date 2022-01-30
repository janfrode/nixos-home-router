# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./networking/interfaces.nix
      #./networking/interfaces-nogw.nix
      ./networking/wireguard.nix
      ./networking/firewall.nix
      ./services/avahi.nix
      ./services/chrony.nix
      ./services/darkhttpd.nix
      ./services/ddclient.nix
      ./services/dhcpd4.nix
      ./services/rsyslogd.nix
      ./services/openssh.nix
      ./services/unbound.nix
      ./users/users.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "hjemmerouter";
    domain = "tanso.net";
    hostId = "f2536017";
    timeServers = [ "0.no.pool.ntp.org" "1.no.pool.ntp.org" "2.no.pool.ntp.org" "3.no.pool.ntp.org" ];
  };

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  #networking.interfaces.eno1.useDHCP = true;
  #networking.interfaces.wlp2s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     tmux 
     git
     nftables
     ethtool
     (import ./vim.nix) 
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

boot.kernel.sysctl = {
  # if you use ipv4, this is all you need
  "net.ipv4.conf.all.forwarding" = true;

  # If you want to use it for ipv6
  "net.ipv6.conf.all.forwarding" = true;

  # source: https://github.com/mdlayher/homelab/blob/master/nixos/routnerr-2/configuration.nix#L52
  # By default, not automatically configure any IPv6 addresses.
  "net.ipv6.conf.all.accept_ra" = 0;
  "net.ipv6.conf.all.autoconf" = 0;
  "net.ipv6.conf.all.use_tempaddr" = 0;

  # On WAN, allow IPv6 autoconfiguration and tempory address use.
  #"net.ipv6.conf.${name}.accept_ra" = 2;
  #"net.ipv6.conf.${name}.autoconf" = 1;
};

# The services doesn't actually work atm, define an additional service
# Fix e1000e adapter reset:
# https://serverfault.com/questions/616485/e1000e-reset-adapter-unexpectedly-detected-hardware-unit-hang
  # see https://github.com/NixOS/nixpkgs/issues/91352
  systemd.services.ethtool = {
    description = "Disable TSO on boot";
    after = [ "network.target" ];
    serviceConfig = {
      Type = "simple";
      RemainAfterExit = "true";
      ExecStart = "${pkgs.ethtool}/sbin/ethtool -K eno1 tso off";
    };
    wantedBy = [ "default.target" ];
  };

  # Only members of wheel may sudo:
  security.sudo.execWheelOnly = true;
  environment.variables = { EDITOR = "vi"; };

}
