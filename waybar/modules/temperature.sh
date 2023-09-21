#!/usr/bin/env bash
echo " $(sensors | rg Tctl | awk '{print $2}' | sed -e 's/+//')"
