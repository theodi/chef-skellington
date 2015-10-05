define :make_vhosts, :params => {} do
  vhosts_dir = "%s/vhosts" % [
    params[:cwd]
  ]

  vh = "%s/%s" % [
    vhosts_dir,
    params[:fqdn]
  ]

  directory vhosts_dir do
    action :create
    owner params[:user]
  end

  template vh do
    source "vhost.erb"
    concurrency = 1
    if node.has_key? 'concurrency'
      concurrency = node['concurrency']
    end
    variables(
      :servername         => node['user'],
      :port               => node['start_port'],
      :fqdn               => node['fully_qualified_domain_name'],
      :prefix             => begin node['deployment']['nginx']['prefix'] rescue nil end,
      :catch_and_redirect => begin node['catch_and_redirect'] rescue nil end,
      :precompiled_assets => begin node['precompile_assets'] rescue nil end,
      :concurrency        => concurrency
    )
    action :create
  end

  file '/etc/nginx/sites-enabled/default' do
    action :delete
  end

  link "/etc/nginx/sites-enabled/%s" % [
      File.basename(vh)
  ] do
    to vh
  end
end
