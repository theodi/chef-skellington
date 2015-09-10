include_recipe 'ruby-ng'

if node['ruby-ng']['ruby_version'].to_s < '2'
  legacy_cruft = %w{
    ruby1.9.1-dev
    ruby-dev
  }

  legacy_cruft.each do |cruft|
    package cruft do
      action :install
    end
  end
else
  include_recipe 'ruby-ng::dev'
end

# There is the weirdest fucking bug somewhere in ruby-ng
# This directory gets chown'ed to root, but *only when we install ruby 2*
directory '/home/vagrant/.gem/' do
  owner 'vagrant'
  group 'vagrant'
  only_if { File.exists? '/home/vagrant/.gem/' }
end
