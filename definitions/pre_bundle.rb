define :pre_bundle, :params => {} do
  bash 'Symlink env' do
    cwd params[:release_path]
    user params[:name]
    code <<-EOF
      ln -sf /home/#{params[:name]}/env .env
    EOF
  end

  directory "/home/#{params[:name]}/#{params[:fully_qualified_domain_name]}/shared/config/" do
    action :create
    recursive true
  end

  directory "/home/#{params[:name]}/#{params[:fully_qualified_domain_name]}/shared/log/" do
    action :create
    recursive true
    user params[:name]
  end
end
