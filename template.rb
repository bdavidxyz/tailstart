
say "💡 Building a fresh new Rails app for you ✨", :green

def add_gems
  gem 'authentication-zero'
end


########################################
# Function definition (not called here)
########################################
def source_paths
  [File.expand_path(File.dirname(__FILE__))]
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
  rails_command "db:migrate"

  directory "files/app", "app", force: true
  copy_file "files/tailwind.config.js", "tailwind.config.js", force: true

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
  say ""
  say "============================================================="
end