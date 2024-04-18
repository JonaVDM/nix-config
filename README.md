# nix config

## setting up (NixOS)

0. install NixOs

0. update the `/etc/nixos/configuration.nix` file

    ```bash
    sudo nano /etc/nixos/configuration.nix
    ```

    - `networking.hostName`: Set the hostname to something unique
    - `environment.systemPackages`: Add `git` and `vim`
    -  and add `nix.settings.experimental-features = [ "nix-command" "flakes" ];`

0. execute first rebuild

    ```bash
    sudo nixos-rebuild switch
    ```

0. clone this repo

    ```bash
    git clone https://github.com/jonavdm/nix-config.git ~/.nix-config
    cd ~/.nix-config
    ```

0. add host config files

    create a folder in `hosts` named after the host (optional add device)
    ```bash
    mkdir hosts/[hostname]_[device] 
    ```

    in here, copy the system (hardware) config over
    ```bash
    cp /etc/nixos/*.nix /hosts/{...}/
    ```

0. update host config file

    see other hosts for example

0. update `flake.nix`
    
    see other hosts under `nixosConfigurations` to see how

## Adding overlays

See the steps taken in the following commit:
https://github.com/JonaVDM/nix-config/commit/33bee790e3eb2c3294791b1895c43cf835d250d5

## Building custom pi images

In order to build a custom image for the raspberry pi, first make sure to put
the following config into the hosts configuration:

```nix
  boot.binfmt.emulatedSystems = [
    "aarch64-linux"
  ];
```

This will alow building for the arm64 platform. Next simply run the following
command using `just`.

```bash
just build_arm
```

After that compile it down to a image:
```bash
unzstd -d pi.sd/sd-image/{!insert_path_here!} -o nixos-sd-image.img
```

And upload it to the sd card or usb ssd. (device name can be found using `fsdisk -l`)
```bash
sudo dd if=~/.nix-config/nixos-sd-image.img of=/dev/{insert device name} bs=1M status=progress
```
