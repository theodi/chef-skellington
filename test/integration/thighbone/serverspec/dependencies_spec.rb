require 'serverspec'
set :backend, :exec

%w{
  build-essential
  libcurl4-openssl-dev
  libmysqlclient-dev
  libxml2-dev
  libxslt1-dev
}.each do |dependency|
  describe package dependency do
    it { should be_installed }
  end
end
