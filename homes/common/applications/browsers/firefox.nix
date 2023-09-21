{pkgs, ...}: {
  programs.firefox = {
    enable = true;

    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        ExtensionSettings = {};
      };
    };
  };

  home = {
    sessionVariables = {
      BROWSER = "firefox";
      MOZ_ENABLE_WAYLAND = 1;
    };
    persistence."/nix/persist/home/ttecho".directories = [".mozilla/firefox"];
  };
}
