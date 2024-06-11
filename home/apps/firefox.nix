{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.main = {

      search = {
        engines = {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
        };

        force = true;
      };

      settings = {
        "browser.download.panel.shown" = true;
        "identity.fxaccounts.enabled" = false;
        "signon.rememberSignons" = false;
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "general.autoScroll" = true;
      };


      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        facebook-container
        multi-account-containers
        refined-github
        return-youtube-dislikes
        ublock-origin
      ];
    };
  };
}
