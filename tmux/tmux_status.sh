#!/usr/bin/env bash

cpu=$(top -bn1 | awk '/Cpu\(s\)/ {printf "%.0f%%", 100 - $8}')
ram=$(free | awk 'NR==2{printf "%.0f%%", $3/($3+$4+$6+$7)*100}')

echo "\
#[fg=white, bg=green]C: $cpu#[fg=default, bg=default]\
#[bg=default] #[bg=default]\
#[fg=white, bg=cyan]M: $ram#[fg=default, bg=default]"
