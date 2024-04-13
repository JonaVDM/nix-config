{ config, pkgs, ... }:

{
  home.packages = with pkgs; [] ++
    lib.optionals (config.ops.gitlab) [
      gitlab-ci-local
      yaml-language-server
      yamllint
    ];
}
