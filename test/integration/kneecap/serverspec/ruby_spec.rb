require 'serverspec'
set :backend, :exec

describe package 'ruby2.2' do
  it { should be_installed }
end

describe package 'ruby2.2-dev' do
  it { should be_installed }
end
