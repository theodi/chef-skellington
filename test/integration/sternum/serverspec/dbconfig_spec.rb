require 'serverspec'
set :backend, :exec

describe file '/home/shoulder_blade/sternum.io/shared/config/database.yml' do
  it { should be_file }
  its(:content) { should match /production:/ }
  its(:content) { should match /adapter: mysql2/ }
  its(:content) { should match /pool: 5/ }
  its(:content) { should match /database: shoulder_blade/ }
  its(:content) { should match /username: shoulder_blade/ }
  its(:content) { should match /password: shoulder_blade/ }
  its(:md5sum) { should eq 'dccee79f40c43620cd1a570328f8cf99' }
end
