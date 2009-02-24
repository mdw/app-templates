load_template "/Users/mdw/code/base_template.rb"

git :init

file ".gitignore", <<-EOGIT
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
notes.txt
EOGIT

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

git :add => "."
git :commit => "-m 'added gitignore files and setup homepage welcome#index'"

