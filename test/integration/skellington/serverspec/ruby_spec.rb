require 'serverspec'
set :backend, :exec

describe package 'ruby2.0' do
  it { should be_installed }
end

describe package 'ruby2.0-dev' do
  it { should be_installed }
end
