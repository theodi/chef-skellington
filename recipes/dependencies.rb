node['skellington']['dependencies'].each do |dependency|
  package dependency do
    action :install
  end
end
