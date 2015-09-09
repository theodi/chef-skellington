require 'serverspec'
set :backend, :exec

describe user 'skellington' do
  it { should exist }
end
