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
