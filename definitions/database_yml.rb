define :database_yml, :params => {} do
  directory "/home/#{params[:name]}/#{params[:fully_qualified_domain_name]}/shared/config/" do
    action :create
    recursive true
  end

  template "/home/#{params[:name]}/#{params[:fully_qualified_domain_name]}/shared/config/database.yml" do
    action :create
    variables(
      :mysql_host     => node['mysql']['host'],
      :mysql_database => node['mysql']['database'],
      :mysql_username => node['mysql']['username'],
      :mysql_password => node['mysql']['password'],
      :mysql_pool     => node['mysql']['pool']
    )
  end
end
