#!/bin/bash

apt -y update
apt -y upgrade
apt -y install sqlite3
sqlite3 example/bd.db < init_db.sql
chown -R vscode:vscode .
