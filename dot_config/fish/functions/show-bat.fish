function show-bat --wraps='upower -i /org/freedesktop/UPower/devices/battery_BATT' --description 'alias show-bat upower -i /org/freedesktop/UPower/devices/battery_BATT'
    upower -i /org/freedesktop/UPower/devices/battery_BATT $argv
end
