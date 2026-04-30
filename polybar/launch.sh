#!/usr/bin/env bash

# Убить все старые процессы polybar
killall -q polybar

# Дождаться их завершения
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Запустить polybar на каждом активном мониторе
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar main --reload &
done
