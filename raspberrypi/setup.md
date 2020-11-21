# Raspberry Pi 4 Manjaro Linux

## Upgrade Packages

```
# sudo pacman -Syu
```

## Upgrade Boot Loader

Install

```
# sudo rpi-eeprom-update -a
```

Reboot and then remove temporary files in /boot:

```
# sudo rpi-eeprom-update -r
```

Validate

```
# sudo rpi-eeprom-update
```

## Software

```
# sudo pacman -S neovim
# sudo pacman -S emacs
# sudo pacman -S alacritty

# bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

```

## Wifi

https://archived.forum.manjaro.org/t/raspberry-pi-4-manjaro-kde-20-06-unable-to-connect-to-any-wifi-not-just-5-ghz/155610/9
