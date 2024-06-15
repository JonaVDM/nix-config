{ config, pkgs, lib, ... }:

let
  cfg = config.j.ops;

  gitlabPkgs = with pkgs; [
    gitlab-ci-local
    yaml-language-server
    yamllint
  ];

  dockerPkgs = with pkgs; [
    docker-ls
  ];

  kindPkgs = with pkgs; [
    kind
  ];

  k8sPkgs = with pkgs; [
    kubectl
  ];
in
{
  options.j.ops = {
    docker = lib.mkEnableOption "docker lsp";
    gitlab = lib.mkEnableOption "gitlab ci development";
    kind = lib.mkEnableOption "local k8s in docker";
    k8s = lib.mkEnableOption "tools for kubernetes";
  };

  config = {
    environment.systemPackages =
      lib.optionals cfg.gitlab gitlabPkgs ++
      lib.optionals cfg.docker dockerPkgs ++
      lib.optionals cfg.kind kindPkgs ++
      lib.optionals cfg.k8s k8sPkgs;
  };
}
