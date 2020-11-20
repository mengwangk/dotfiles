# Raspberry Pi 4 Manjaro Linux

## Upgrade Packages

```
# sudo pacman -Ss
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

## Wifi


