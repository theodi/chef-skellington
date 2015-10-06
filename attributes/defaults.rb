default['skellington']['dependencies'] = %w{
  build-essential
  libcurl4-openssl-dev
  libmysqlclient-dev
  libxml2-dev
  libxslt1-dev
}

default['ruby-ng']['ruby_version'] = '2.0'

default['chef_client']['init_style'] = 'none'
default['chef_client']['cron']['use_cron_d'] = true
default['chef_client']['cron']['hour'] = '*'
default['chef_client']['cron']['minute'] = '*/10'

default['deployment']['revision'] = 'CURRENT'
default['deployment']['rack_env'] = 'production'

default['mysql']['database'] = "#{node['mysql']['user']}"
default['mysql']['pool'] = 5
