require 'serverspec'
set :backend, :exec

describe package 'nginx' do
  it { should be_installed }
end

describe service 'nginx' do
  it { should be_running }
end

describe file '/etc/nginx/sites-enabled/kneecap.theodi.org' do
  it { should be_symlink }
  its(:content) { should match /server 127.0.0.1:9999;/ }
  its(:content) { should match /listen 80 default;/ }
  its(:content) { should match /server_name kneecap.staging.theodi.org;/ }
end

describe file '/etc/nginx/sites-enabled/default' do
  it { should_not exist }
end

describe file '/etc/nginx/sites-enabled/000-default' do
  it { should_not exist }
end
