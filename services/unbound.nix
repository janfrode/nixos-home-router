{ pkgs, lib, ... }:{

   services.unbound = {
     enable = true;
     settings = {
       server = {
         interface = [ "0.0.0.0" ];
         access-control = [ "0.0.0.0/0 allow" ];
         #access-control = [ "172.20.0.0/16 allow" "192.168.1.0/24 allow" ];
       };
     };
     #extraConfig = ''
       #allow 192.168.1
       #allow 172.20
       #'';
   };
}
