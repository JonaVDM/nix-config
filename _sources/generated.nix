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
    version = "f79117d6129a318fb564ba7c604c0d7e33463ea9";
    src = fetchFromGitHub {
      owner = "JonaVDM";
      repo = "neovim-config";
      rev = "f79117d6129a318fb564ba7c604c0d7e33463ea9";
      fetchSubmodules = false;
      sha256 = "sha256-UcHyhvHyi7hyINUC1xWJYYH8pf7edsGy57bcbJJhxak=";
    };
    date = "2024-04-11";
  };
}
