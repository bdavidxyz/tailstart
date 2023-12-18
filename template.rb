
say "💡 Building a fresh new Rails app for you ✨", :green

def add_gems
  gem 'authentication-zero'
end

add_gems

after_bundle do
  rails_command "db:create"
  rails_command "generate authentication"
  rails_command "db:migrate"

  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }

  say "============================================================="
  say ""
  say "💡 Done! ✨", :yellow
  say ""
  say "============================================================="

end