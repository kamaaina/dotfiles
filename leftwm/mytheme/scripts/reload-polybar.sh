#!/bin/bash
export SCRIPTPATH=$HOME/.config/leftwm/themes/current
if pgrep -x "polybar" > /dev/null
then
	killall polybar
fi

echo "starting polybar"
index=0
monitors=($(polybar -m | sed s/:.*//))
echo "m: $monitors"
leftwm-state -q -n -t "$SCRIPTPATH"/sizes.liquid | sed -r '/^\s*$/d' | while read -r width x y
do
  barname="mainbar$index"
  monitor=${monitors[index]} width=$(( width - 10 )) polybar -c "$SCRIPTPATH"/polybar.cfg $barname &> /dev/null &
  let index=index+1
done
