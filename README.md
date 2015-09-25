# ActivePermissions

Drop in solution for a comprehensive Permission system using Rails and ActiveAdmin.

## Dependencies

**ActiveAdmin**

This gem requires:
- you have the ActiveAdmin installed
- you have an `active_admin.rb` file in `config/initializers`.
- you have an AdminUser model with an `admin_users` database table

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_permissions'
```

Install the gem, run the installer, then run the migrations:

    $ bundle
    $ bundle exec rails generate active_permissions:install
    $ bundle exec rake db:migrate

## Usage

Start `rails server` and navigate to `/admin/permissions`. You'll see a nested list of all Admin Users, all ActiveAdmin-registered resources, and all actions.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/active_permissions. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
