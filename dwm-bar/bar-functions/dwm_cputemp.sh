#!/bin/bash
dwm_cputemp () {
 cpu_temp=$(< /sys/class/thermal/thermal_zone0/temp)
 cpu_temp=$(($cpu_temp/1000))
 echo 🔥 $cpu_temp°C 
}

dwm_cputemp
