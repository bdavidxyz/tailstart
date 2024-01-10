
say "💡 Building a fresh new Rails app for you ✨", :green


########################################
# Function definition (not called here)
########################################
def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

def add_gems
  append_to_file 'Gemfile', "\n# Simplest but complete authentication \ngem 'authentication-zero'\n"
  append_to_file 'Gemfile', "\n# Clean validations \ngem 'dry-validation'\n"
  append_to_file 'Gemfile', "\n# Easy way to stub and test outcoming e-mails \ngem 'letter_opener_web', '~> 2.0', group: [:development]\n"
  append_to_file 'Gemfile', "\n# Better test output \ngem 'minitest-reporters', group: [:test]\n"
end

def remove_unneeded_files
  run "rm app/controllers/passwords_controller.rb" # we use account/passwords_controller instead
  run "rm app/controllers/identity/emails_controller.rb" # we use account/emails_controller instead
end

########################################
# Script starts here
########################################


# Consider all directories
# Will make files/ directory available
######################################## => 
source_paths

add_gems

########################################
# What happens after bundle:install...
########################################
after_bundle do
  rails_command "db:create"
  generate "authentication"
  run "yarn upgrade @hotwired/turbo-rails@7.3.0"
  run "yarn add flowbite"
  rails_command "db:migrate"

  remove_unneeded_files

  directory "files/app", "app", force: true
  directory "files/config", "config", force: true
  directory "files/db", "db", force: true
  directory "files/test", "test", force: true
  copy_file "files/tailwind.config.js", "tailwind.config.js", force: true

  rails_command "db:seed"

  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }

  say "============================================================="
  say
  say "App successfully created! 🎉🎉🎉", :green
  say
  say "Switch to your app by running:"
  say "$ cd #{app_name}", :yellow
  say
  say "Then run:"
  say "bin/dev", :yellow
  say
  say "Then open:"
  say "http://localhost:3000", :yellow
  say
  say "Database is already filled with default values of db/seeds.rb. Enjoy!"
  say ""
  say "============================================================="
end