#!/bin/sh

# the script will not work if xrandr is not available
if [ -z "$(which xrandr)" ]; then
    exit 1
fi

DISABLE_SUBSTRING="LVDS"

TO_DISABLE=""
PRIMARY_OUT=""

old_IFS="${IFS}"
IFS=$'\n'
for out in `xrandr | grep connected | cut -d ' ' -f 1-2`; do
    name=`echo $out | cut -d ' ' -f 1`
    state=`echo $out | cut -d ' ' -f 2`
    if [ "$state" = "connected" ]; then
        case "$name" in
            # disable a monitor connected via LVDS
            ${DISABLE_SUBSTRING}*)
                if [ -z "$TO_DISABLE" ]; then
                    TO_DISABLE="$name"
                fi
                ;;
            *)
                # set the 'first' external monitor as the
                # primary one, disable the other external monitors
                if [ -z "$PRIMARY_OUT" ]; then
                    PRIMARY_OUT="$name"
                else
                    xrandr --output "$name" --off
                fi
                ;;
        esac
    fi
done
IFS="${old_IFS}"

# If there is an internal screen, as well as at least one external monitor, then
# disable the internal monitor and use the external monitor as the primary one.
#
# Otherwise, if there are any external monitors, use the 'first' detected one
# as the primary monitor.
if [ -n "$TO_DISABLE" ] && [ -n "$PRIMARY_OUT" ]; then
    xrandr --output "$PRIMARY_OUT" --primary --auto --output "$TO_DISABLE" --off
elif [ -n "$PRIMARY_OUT" ]; then
    xrandr --output "$PRIMARY_OUT" --primary --auto
fi

exit 0
