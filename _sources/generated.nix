# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  dotfiles = {
    pname = "dotfiles";
    version = "2b9da42ed0750457284cb1f9fae57e9bfc910519";
    src = fetchFromGitHub {
      owner = "JonaVDM";
      repo = "dotfiles";
      rev = "2b9da42ed0750457284cb1f9fae57e9bfc910519";
      fetchSubmodules = false;
      sha256 = "sha256-YZnON69Uh4pyxnW99LHnsZZTnyZBwRwHiXhTsFZAqgY=";
    };
    date = "2024-04-11";
  };
  nvim = {
    pname = "nvim";
    version = "c310513fca5741cd7b70ff28d60c11ff9020a418";
    src = fetchFromGitHub {
      owner = "JonaVDM";
      repo = "neovim-config";
      rev = "c310513fca5741cd7b70ff28d60c11ff9020a418";
      fetchSubmodules = false;
      sha256 = "sha256-MGdUyBHSfxy40MNDOrRzv0ZCVS9jf1A/hfGtj9nAxxY=";
    };
    date = "2024-06-11";
  };
}
