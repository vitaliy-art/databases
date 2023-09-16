#!/bin/bash

sqlite3 bd.db < init_db.sql
gem install debase
bundler install
