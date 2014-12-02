# RubotySonar

RubotySonar search ruboty plugin gems.

[![Gem Version](https://badge.fury.io/rb/ruboty-sonar.svg)](http://badge.fury.io/rb/ruboty-sonar)
[![Build Status](https://travis-ci.org/tbpgr/ruboty-sonar.png?branch=master)](https://travis-ci.org/tbpgr/ruboty-sonar)
[![Coverage Status](https://coveralls.io/repos/tbpgr/ruboty-sonar/badge.png)](https://coveralls.io/r/tbpgr/ruboty-sonar)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-sonar'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruboty-sonar

## Usage

### info
~~~ruby
require 'ruboty-sonar'
print RubotySonar.info ruboty-megen
__END__
{
  :name => 'ruboty-megen',
  :desc => 'ruboty-megen generate ruboty README.md template.',
  :downloads => 364,
  :rubygems_uri => 'http://rubygems.org/gems/ruboty-megen',
  :homepage_uri => 'https://github.com/tbpgr/ruboty-megen'
}
~~~

### random
~~~ruby
require 'pp'
require 'ruboty-sonar'
pp RubotySonar.random
pp RubotySonar.random
__END__
# randome result
{:name=>"ruboty-response",
 :desc=>"Ruboty handler to register a response.",
 :downloads=>414,
 :rubygems_uri=>"http://rubygems.org/gems/ruboty-response",
 :homepage_uri=>"https://github.com/kaihar4/ruboty-response"}
{:name=>"ruboty-seppuku",
 :desc=>"ruboty plugin for seppuku.",
 :downloads=>310,
 :rubygems_uri=>"http://rubygems.org/gems/ruboty-seppuku",
 :homepage_uri=>"https://github.com/blockgiven/ruboty-seppuku"}
~~~

### ranking
~~~ruby
require 'pp'
require 'ruboty-sonar'
pp RubotySonar.ranking
__END__
[{:name=>"ruboty-redis", :downloads=>869, :authors=>"Ryo Nakamura"},
 {:name=>"ruboty-lgtm", :downloads=>827, :authors=>"negipo"},
 {:name=>"ruboty-twitter", :downloads=>626, :authors=>"Ryo Nakamura"},
 {:name=>"ruboty-japan_weather", :downloads=>551, :authors=>"Taiki ONO"},
 {:name=>"ruboty-trust_me", :downloads=>485, :authors=>"block_given?"}]
~~~

~~~ruby
require 'pp'
require 'ruboty-sonar'
pp RubotySonar.ranking(3)
__END__
[{:name=>"ruboty-redis", :downloads=>869, :authors=>"Ryo Nakamura"},
 {:name=>"ruboty-lgtm", :downloads=>827, :authors=>"negipo"},
 {:name=>"ruboty-twitter", :downloads=>626, :authors=>"Ryo Nakamura"}]
~~~

###  author_ranking
~~~ruby
require 'pp'
require 'ruboty-sonar'
pp RubotySonar.author_ranking
__END__
[{:authors=>"block_given?", :downloads=>4530},
 {:authors=>"Ryo Nakamura", :downloads=>1495},
 {:authors=>"kaihar4", :downloads=>1131},
 {:authors=>"negipo", :downloads=>827},
 {:authors=>"Yoshiori SHOJI", :downloads=>805}]
~~~

~~~bash
require 'ruboty-sonar'
print RubotySonar.author_ranking(3)
__END__
[{:authors=>"block_given?", :downloads=>4530},
 {:authors=>"Ryo Nakamura", :downloads=>1495},
 {:authors=>"kaihar4", :downloads=>1131}]
~~~

## Usage (Command Line)
### Commands (Command Line)
|name|args|memo|
|:--|:--|:--|
|[info](#ruboty-sonar-info)|gem name|Show target gem info. gem_name, descriptions, downloads, rubygems_url, homepage_url|
|[random](#ruboty-sonar-random)|--|Show random gem info. gem_name, descriptions, downloads, rubygems_url, homepage_url|
|[ranking](#ruboty-sonar-ranking)|limit|Show gem donloads ranking. default = 5|
|[author_ranking](#ruboty-sonar-author_ranking)|limit|Show gem's authers donloads ranking. default = 5|

### ruboty-sonar info
~~~bash
$ ruboty-sonar info ruboty-megen
name:ruboty-megen
desc:ruboty-megen generate ruboty README.md template.
downloads:365
rubygems_uri:http://rubygems.org/gems/ruboty-megen
homepage_uri:https://github.com/tbpgr/ruboty-megen
~~~

### ruboty-sonar random
~~~bash
$ ruboty-sonar random
name:ruboty-nullpo
desc:ruboty plugin for ぬるぽ ガッ.
downloads:136
rubygems_uri:http://rubygems.org/gems/ruboty-nullpo
homepage_uri:https://github.com/blockgiven/ruboty-nullpo

$ ruboty-sonar random
name:ruboty-megen
desc:ruboty-megen generate ruboty README.md template.
downloads:365
rubygems_uri:http://rubygems.org/gems/ruboty-megen
homepage_uri:https://github.com/tbpgr/ruboty-megen

$ ruboty-sonar random
name:ruboty-qiita_scouter
desc:An Ruboty Handler + Actions to analyze your Qiita power.
downloads:135
rubygems_uri:http://rubygems.org/gems/ruboty-qiita_scouter
homepage_uri:https://github.com/tbpgr/ruboty-qiita_scouter
~~~

### ruboty-sonar ranking
~~~bash
$ ruboty-sonar ranking
no:1,name:ruboty-redis,downloads:869
no:2,name:ruboty-lgtm,downloads:827
no:3,name:ruboty-twitter,downloads:626
no:4,name:ruboty-japan_weather,downloads:551
no:5,name:ruboty-trust_me,downloads:485

$ ruboty-sonar ranking  3
no:1,name:ruboty-redis,downloads:869
no:2,name:ruboty-lgtm,downloads:827
no:3,name:ruboty-twitter,downloads:626
~~~

### ruboty-sonar author_ranking
~~~bash
$ ruboty-sonar author_ranking
no:1,author:block_given?,downloads:4530
no:2,author:Ryo Nakamura,downloads:1495
no:3,author:kaihar4,downloads:1131
no:4,author:negipo,downloads:827
no:5,author:Yoshiori SHOJI,downloads:805

$ ruboty-sonar author_ranking 3
no:1,author:block_given?,downloads:4530
no:2,author:Ryo Nakamura,downloads:1495
no:3,author:kaihar4,downloads:1131
~~~

## Dependency
* ruboty-sonar depend on [gems gem](https://github.com/rubygems/gems)

## Contributing

1. Fork it ( https://github.com/tbpgr/ruboty-sonar/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
