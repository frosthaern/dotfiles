#!/usr/bin/env bash

kitty -e nvim -- $(fd -I -t f | fzf)
