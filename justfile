build_arm:
  nix run nixpkgs#nixos-generators -- -f sd-aarch64 --flake .#arm_iso --system aarch64-linux -o ./pi.sd

build_io:
  nix run nixpkgs#nixos-generators -- -f sd-aarch64 --flake .#io --system aarch64-linux -o ./pi.sd
