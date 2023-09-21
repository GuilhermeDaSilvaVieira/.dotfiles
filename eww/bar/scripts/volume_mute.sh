if [[ $(wpctl get-volume @DEFAULT_SINK@ | awk '{print $3}') == "[MUTED]" ]]; then
	echo "yes"
else
	echo "no"
fi
