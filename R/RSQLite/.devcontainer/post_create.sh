#!/bin/bash

apt -y update
apt -y upgrade
apt -y install sqlite3
sqlite3 bd.db < init_db.sql
R -q -e 'renv::install()'
R -q -e 'renv::restore()'
chown -R rstudio:rstudio .
