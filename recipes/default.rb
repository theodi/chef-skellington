include_recipe 'skellington::dependencies'
include_recipe 'skellington::ruby'
include_recipe 'skellington::chef-client'

include_recipe 'envbuilder'

include_recipe 'odi-pk'
include_recipe 'odi-users'
include_recipe 'odi-monitoring'
