{ ... }:

{
  programs.firefox.enable = true;

  programs.firefox.policies = {
    ExtensionSettings = with builtins;
      let extension = shortId: uuid: {
        name = uuid;
        value = {
          install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
          installation_mode = "normal_installed";
        };
      };
      in listToAttrs [
        # { name = "*"; value = { installation_mode = "blocked"; }; }
        (extension "ublock-origin" "uBlock0@raymondhill.net")
        (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
        (extension "facebook_container" "@contain-facebook")
        (extension "multi_account_containers" "@testpilot-containers")
        (extension "refined_github" "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}")
        (extension "return_youtube_dislikes" "{762f9885-5a13-4abd-9c77-433dcd38b8fd}")
      ];
      # about:support#addons for extension id
      # Valid strings for installation_mode are "allowed", "blocked",
      # "force_installed" and "normal_installed".
      # https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265
      # 
      # To add additional extensions, find it on addons.mozilla.org, find
      # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
      # Then, download the XPI by filling it in to the install_url template, unzip it,
      # run `jq .browser_specific_settings.gecko.id manifest.json` or
      # `jq .applications.gecko.id manifest.json` to get the UUID
  };
}
