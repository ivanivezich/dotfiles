#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
    REMAINING=$(acpi -b | cut -c 30-47)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = "Discharging" ]; then
            printf " 🔋 %s%% %s " "$CHARGE" "$REMAINING"
        else
            printf " 🗲 %s%% %s " "$CHARGE" 
        fi
    else
        printf " BAT %s%% %s" "$CHARGE" 
    fi
    printf "%s\n" "$SEP2"
}

dwm_battery

