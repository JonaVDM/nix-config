all: copy reload

copy:
	cp configuration.nix home.nix /etc/nixos

reload:
	nixos-rebuild switch

clean:
	nix-collect-garbage -d
