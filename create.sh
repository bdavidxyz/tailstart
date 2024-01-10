#!/bin/bash

mkdir myapp && cd myapp 
echo "source 'https://rubygems.org'" > Gemfile
echo "gem 'rails', '7.1.2'" >> Gemfile
bundle install
bundle exec rails new . --force --database=postgresql -j=esbuild -c=tailwind -m=../template.rb --skip-docker
