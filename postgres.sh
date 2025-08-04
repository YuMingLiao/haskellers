#!/usr/bin/env bash

pg_ctl -D .tmp/haskellers -l logfile -o "-h 127.0.0.1 --unix_socket_directories='$PWD'" start

export PGHOST=$(pwd)
psql template1 -h 127.0.0.1 \
   -c "CREATE DATABASE haskellers;" \
   -c "GRANT ALL PRIVILEGES ON DATABASE haskellers TO nixos;"
# pg_ctl -D .tmp/haskellers stop
#   -c "CREATE USER postgres WITH PASSWORD 'your_password'; " \
