role :app, %w{deploy@example.com}
role :web, %w{deploy@example.com}
role :db,  %w{deploy@example.com}
role :batch,  %w{deploy@example.com}

server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value

set :whenever_roles, :batch # 対象のロールを指定
set :whenever_environment, :staging # 対象の環境を指定
