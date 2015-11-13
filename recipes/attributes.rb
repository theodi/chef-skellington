node.default['envbuilder']['base_dir'] = "/home/#{node['user']}"
node.default['envbuilder']['owner'] = node['user']
node.default['envbuilder']['group'] = node['user']

node.default['mysql']['database'] = node['user'] unless node['mysql']['database']
node.default['mysql']['username'] = node['user'] unless node['mysql']['username']
node.default['mysql']['password'] = node['user'] unless node['mysql']['password']
