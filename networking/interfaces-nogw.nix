{ pkgs, lib, ... }:{

# Dummy config before replacing old router

  networking.interfaces = {
    eno1.useDHCP = true;
  };
}
