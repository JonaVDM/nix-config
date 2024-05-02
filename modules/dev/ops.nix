{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; lib.optionals config.ops.gitlab [
      gitlab-ci-local
      yaml-language-server
      yamllint
    ] ++
    lib.optionals config.ops.docker [
      docker-ls
    ] ++
    lib.optionals config.ops.kind [
      kind
    ] ++
    lib.optionals config.ops.k8s [
      kubectl
    ];
}
