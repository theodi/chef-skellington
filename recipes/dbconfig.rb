include_recipe 'skellington::attributes'

database_yml node['user'] do
  fully_qualified_domain_name node['fully_qualified_domain_name']
end
