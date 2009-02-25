#base_template.rb
# this is not intended to be used directly - it is included in git or svn versions

# install plugins for user authentication
plugin 'open_id_authentication', :git => 'git://github.com/rails/open_id_authentication.git', :submodule => true
plugin 'restful-authentication', :git => 'git://github.com/technoweenie/restful-authentication.git', :submodule => true

# install my favorite gems
gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
gem 'ruby-openid', :lib => 'openid'
rake "gems:install"

# setup user model, openid, run migrations
rake('db:sessions:create')
generate("authenticated", "user session")
rake('open_id_authentication:db:create')
rake "db:migrate"

# setup the session store
nitializer 'session_store.rb', <<-END
ActionController::Base.session = { :session_key => '_#{(1..6).map { |x| (65 + rand(26)).chr }.join}_session', :secret => '#{(1..40).map { |x| (65 + rand(26)).chr }.join}' }
ActionController::Base.session_store = :active_record_store
  END

generate :controller, "welcome index"
route "map.root :controller => 'welcome'"
run "rm public/index.html"
run "echo 'coming soon' > README"

