require 'serverspec'
set :backend, :exec

describe file '/home/cranium/cranium.io/shared/config/database.yml' do
  it { should be_file }
  its(:content) { should match /production:/ }
  its(:content) { should match /adapter: mysql2/ }
  its(:content) { should match /pool: 5/ }
  its(:content) { should match /database: cranium/ }
  its(:content) { should match /username: skeletor/ }
  its(:content) { should match /password: cranium/ }
  its(:md5sum) { should eq 'dd277fba5f954df7f611a749f8299838' }
end
