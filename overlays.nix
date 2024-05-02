{ inputs, ... }:

{
  staging-next-packages = final: _prev: {
    staging-next = import inputs.nixpkgs-sn {
      inherit (final) system;
    };
  };
}
