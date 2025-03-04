{
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
  # stylix.image = ../../wallpapers/car2.png;
  # stylix.enable = true;
  # home-manager.extraSpecialArgs = { inherit base16; };

  # Enable networking
  networking.networkmanager.enable = true;
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

}
