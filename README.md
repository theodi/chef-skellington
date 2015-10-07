# The Skellington Cookbook

The result of some long-term rewriting of a lot of our Chef cookware, and then some heavy-duty refactoring of the results.

## What's in here?

A set of [default attributes](attributes/default), a collection of [common definitions](definitions) (and some associated [templates](templates)), a handful of [supporting recipes](recipes), and the [One True Deployment Recipe](recipes/deploy). Also [a test suite](test/integration), although it makes more sense to test some of the functionality via client cookbooks.

## How to use it

A client cookbook should just need to specify a few attributes, then call

    include_recipe 'skellington'
    include_recipe 'skellington::deploy'

and all should Just Work.

### Attributes

I've tried to keep this as minimal as possible

#### Mandatory

    default['user'] = 'directory'
    default['fully_qualified_domain_name'] = "#{node['user']}.theodi.org"
    default['repo'] = "#{node['github_org']}/member-directory"
    default['start_port'] = 8000
    default['concurrency'] = 2
    default['concurrency_string'] = "thin=#{node['concurrency']},worker=1"

This will:
* create a user called `directory`
* deploy code as that user from `https://github.com/theodi/member-directory.git`
* to `/home/directory/directory.theodi.org/`
* run two instances of `thin`, on ports 8000 and 8001
* proxy them via nginx and present the whole thing at `http://directory.theodi.org`

That `concurrency_string` is a bit of a hack, this stuff actually belongs in the individual apps in a `.foreman` configuration file. This will get DRYed up eventually.

#### Optional

    default['catch_and_redirect'] = ['members.theodi.org']
    default['max_body_size'] = '5M'

We will intercept calls to `members.theodi.org` and point them at the actual FQDN above, and we will configure the `client_max_body_size` nginx parameter.

##### Ruby

    default['ruby-ng']['ruby_version'] = '2.1'

This defaults to 2.0

##### MySQL

    default['mysql']['user'] = 'member_directory'
    default['mysql']['database'] = 'member_directory_production'
    default['mysql']['pool'] = 50

Our database user is `member_directory`, and if we don't specify a `database` then that will default to the same name. The database `host` and `password` are set elsewhere - in `.kitchen.yml` for testing and dev, or in the Chef environment in production.

##### Deployment

    default['migrate'] = 'bundle exec rake db:migrate'
    default['precompile_assets'] = true

This command will be run during the `migrate` step of the deployment process - no command, no migration. And we would like to precompile the assets, please, because things are better when they take 20 minutes.

## Berkshelf is terrible

Because of the (shitty) way [Berkshelf](http://berkshelf.com/) works, a client cookbook will need to specify all of Skellington's dependencies in its _Berksfile_ too. You should probably just cargo-cult this:

    cookbook 'skellington', github: 'theodi/chef-skellington'

    # Skellington dependencies
    cookbook 'odi-users', github: 'theodi/chef-odi-users'
    cookbook 'odi-pk', github: 'theodi/chef-odi-pk'
    cookbook 'ruby-ng', github: '3ofcoins/chef-cookbook-ruby-ng'
    cookbook 'envbuilder', github: 'theodi/chef-envbuilder'
    cookbook 'odi-monitoring', github: 'theodi/chef-odi-monitoring'
    cookbook 'serverdensity', github: 'serverdensity/chef-serverdensity'

## Running the tests

If you have VirtualBox and Vagrant installed, it should be as simple as

    bundle
    bundle exec kitchen verify

But there are caveats here around having MySQL DBs configured correctly and having Redis running and so on

> TODO: Provide some sort of `create.sql` as part of the test suite

### Our tests
### Client cookbook tests
