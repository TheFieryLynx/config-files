#!/usr/bin/env bash

def_open_test() {
  eww open theme_picker
  eww update open_theme_picker=true
  exit 0
}


def_close_test() {
  eww close theme_picker
  eww update open_theme_picker=false
  exit 0
}

if [ $(eww get open_theme_picker) == "false" ]; then
  def_open_test
else 
  def_close_test
fi
