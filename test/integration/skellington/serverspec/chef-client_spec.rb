require 'serverspec'
set :backend, :exec

describe file '/etc/cron.d/chef-client' do
  it { should be_file }
  its(:content) { /\*\/10 * * * * root \/bin\/sleep [0-9]+;  \/usr\/bin\/chef-client > \/dev\/null 2>&1/ }
end

describe file '/etc/chef/client.rb' do
  it { should be_file }
  its(:content) { should match /validation_client_name "chef-validator"/ }
end
