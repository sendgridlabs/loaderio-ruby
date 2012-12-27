# ruby client for loader.io api [![Build Status](https://travis-ci.org/sendgridlabs/loaderio-ruby.png)](https://travis-ci.org/sendgridlabs/loaderio-ruby)

## License
Licensed under the MIT License.

## Installing

Add to your 'Gemfile': 

```ruby
gem 'loaderio'
```

## Configuration

```ruby
Loaderio::Configuration.api_key = "your_api_key"
```

## Application

### Applications
```ruby
Loaderio::Application.all
=> [#<Loaderio::Application:0x007f8615393af8 >, #<Loaderio::Application:0x007f86153939e0>]
```

### Find application
```ruby
Loaderio::Application.find "app_id"
=> #<Loaderio::Application:0x007fd232fe5338>
```

### Create application
```ruby
Loaderio::Application.create(app: "example.com")
=> #<Loaderio::Application:0x007fd232fe5338
```
### Verify application
```ruby
Loaderio::Application.verify("app_id")
=> #<Loaderio::Application:0x007fd23301b7f8>
```

## Test

### Tests
```ruby
Loaderio::Test.all
=> [#<Loaderio::Test:0x007fd232066290>, #<Loaderio::Test:0x007fd2320661c8>]
```

### Find test
```ruby
Loaderio::Test.find("test_id")
=> #<Loaderio::Test:0x007fd2320eefc8>
```

### Create test
```ruby
Loaderio::Test.create(url: "http://example.com", load: "0-10-10")
=> #<Loaderio::Test:0x007fd232131ee0>
```

### Test results
```ruby
Loaderio::Test.results("app_id")
=> #<Loaderio::Test:0x007fd2320eefc8>
```
