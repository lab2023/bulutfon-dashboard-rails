# BulutfonDashboardRails

Bulutfon rails dashboard mountable engine. 

## Installation

Add this line to your application's Gemfile:

```ruby
    gem 'bulutfon_dashboard', git: 'https://github.com/lab2023/bulutfon-dashboard-rails.git', branch: 'master'
```

And then execute:

```ruby
    $ bundle install
```

## Usage
	
Run required commands in terminal:

```ruby
	rails generate bulutfon_dashboard:assets 
	rails generate bulutfon_dashboard:initializers 
	rails generate bulutfon_dashboard:helpers 
	rails generate bulutfon_dashboard:migrations 
	rails generate bulutfon_dashboard:controllers 
```

If you want to change views run this command:

```bash
	rails generate bulutfon_dashboard:views
```

Add this line to your application's config/routes.rb:

```ruby
	mount BulutfonDashboard::Engine => '/bulutfon', as: 'bulutfon_dashboard'
```

Access root path like this:

```ruby
	bulutfon_dashboard.root_path
```
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

![lab2023](http://lab2023.com/assets/images/named-logo.png)

- BulutfonDashboardRails is maintained and funded by [lab2023 - information technologies](http://lab2023.com/)
- Thank you to all the [contributors!](../../graphs/contributors)
- The names and logos for lab2023 are trademarks of lab2023, inc.

## License

Copyright © 2013-2015 [lab2023 - information technologies](http://lab2023.com)