set :rails_env, 'production'
set :branch, 'master'

server '127.0.0.1', user: 'deploy', roles: %w[web app db]

