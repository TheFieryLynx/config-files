#!/usr/bin/env bash

def_open_test() {
  eww open example
  eww update open_test=true
  exit 0
}


def_close_test() {
  eww close example
  eww update open_test=false
  exit 0
}

if [ $(eww get open_test) == "false" ]; then
  def_open_test
else 
  def_close_test
fi
