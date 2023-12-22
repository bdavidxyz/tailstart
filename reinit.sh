#!/bin/bash

cd myapp 
bin/rails db:drop
cd ..
rm -rf myapp
