#!/bin/bash
# Script para automatizar hyprsunset a las 7 PM (19:00)
# Noche (19:00 - 07:00): 4000K
# Día (07:00 - 19:00): 6500K (Neutral) o Apagado

while true; do
  HOUR=$(date +%H)
  if [ "$HOUR" -ge 19 ] || [ "$HOUR" -lt 7 ]; then
    # ES DE NOCHE
    if ! pgrep -x "hyprsunset" > /dev/null; then
      hyprsunset -t 4000 &
    fi
  else
    # ES DE DÍA
    if pgrep -x "hyprsunset" > /dev/null; then
      pkill hyprsunset
    fi
  fi
  sleep 60
done
