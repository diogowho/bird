#!/bin/sh

clean_bird() {
  rm -rf /etc/bird/*.conf
  rm -rf \
    /etc/bird/filters \
    /etc/bird/functions \
    /etc/bird/peers \
    /etc/bird/protocols \
    /etc/bird/templates
}

install_bird() {
  cp bird.conf tables.conf communities.conf pref.conf /etc/bird/
  cp -r "hosts/$(hostname -s)/"* /etc/bird/
  cp -r filters functions protocols templates /etc/bird/
}

clean_bird
install_bird

chown -R bird:bird /etc/bird
birdc configure
