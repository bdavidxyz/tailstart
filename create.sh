#!/bin/bash

mkdir myapp && cd myapp 
echo "source 'https://rubygems.org'" > Gemfile
echo "gem 'rails', '7.1.3'" >> Gemfile
bundle install

# https://github.com/rails/cssbundling-rails/issues/146 
echo "Y" | bundle exec rails new . --force --database=postgresql -j=esbuild -c=tailwind -m=../template.rb --skip-docker


