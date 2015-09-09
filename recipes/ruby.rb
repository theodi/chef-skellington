include_recipe 'ruby-ng'

if node['ruby-ng']['ruby_version'] < '2'
  package 'ruby1.9.1-dev' do
    action :install
  end
else
  include_recipe 'ruby-ng::dev'
end
