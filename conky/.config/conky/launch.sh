#!/bin/bash
killall -q conky

conky -q -c $HOME/.config/conky/conky.conf
