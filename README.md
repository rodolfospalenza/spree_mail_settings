SpreeMailSettings
=================

[![Build Status](https://travis-ci.org/spree-contrib/spree_mail_settings.png?branch=master)](https://travis-ci.org/spree-contrib/spree_mail_settings)

Installation
------------

Add spree_mail_settings to your Gemfile:

```ruby
gem 'spree_mail_settings'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_mail_settings:install
```

Add config/initializers/sidekiq.rb for asynchronous mailers and add `mailer` queue.

```ruby
Sidekiq.configure_server do |config|
  config.redis = { url: "redis://localhost:6379/0", namespace: "sidekiq_#{ Rails.env }" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://localhost:6379/0", namespace: "sidekiq_#{ Rails.env }" }
end
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_mail_settings/factories'
```

Copyright (c) 2014 [name of extension creator], released under the New BSD License
