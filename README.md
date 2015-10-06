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

#### Mandatory
#### Optional

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

### Our tests
### Client cookbook tests
