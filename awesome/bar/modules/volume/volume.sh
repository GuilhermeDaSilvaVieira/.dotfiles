if [[ $(wpctl get-volume @DEFAULT_SINK@ | awk '{print $3}') == "[MUTED]" ]]; then
	wpctl get-volume @DEFAULT_SINK@ | awk '{print $2*100"M"}'
else
	wpctl get-volume @DEFAULT_SINK@ | awk '{print $2*100"%"}'
fi
