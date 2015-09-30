node.default['envbuilder']['base_dir'] = "/home/#{node['user']}"
node.default['envbuilder']['owner'] = node['user']
node.default['envbuilder']['group'] = node['user']

include_recipe 'apt'
include_recipe 'git'
include_recipe 'nginx'

node['skellington']['dependencies'].each do |dependency|
  package dependency do
    action :install
  end
end
