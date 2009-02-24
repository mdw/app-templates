#base_template.rb
# this is not intended to be used directly - it is included in git or svn versions

run "echo 'coming soon' > README"

gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
rake "gems:install"

generate :controller, "welcome index"
# only need to migrate if model generated
#rake "db:migrate"
route "map.root :controller => 'welcome'"
run "rm public/index.html"

