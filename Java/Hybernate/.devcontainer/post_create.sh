#!/bin/bash

apt -y update
apt -y upgrade
apt -y install sqlite3
sqlite3 bd.db < init_db.sql
chown vscode:vscode bd.db
