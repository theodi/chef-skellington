require 'serverspec'
set :backend, :exec

describe file '/home/skellington/env' do
  it { should be_file }
  its(:content) { should match /KNEEBONE: thighbone/ }
end
