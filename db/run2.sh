#!/bin/bash

# Part 2 of recreate data process. Run run1.sh first.

db=${1:-mbta2}

echo "adding functions to $db"
createlang plpgsql $db;
psql $db < db/create_functions.sql

echo Now run run3.sh

