node.default['start_port'] = 9999

make_vhosts do
  cwd '/home/vagrant'
  user 'vagrant'
  fqdn node['fully_qualified_domain_name']
end
