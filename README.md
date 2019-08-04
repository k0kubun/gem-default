# Gem::Default

Change a non-default gem to a default gem in your local environment.

## Installation

```bash
$ gem install gem-default
```

## Usage

Run `gem default xxx` after `gem install xxx`.

## Example

### Before

Usually, we cannot run a non-default gem (`pry` for example) with `bundle exec`
if it's not written in Gemfile.

```bash
$ cat Gemfile
source 'https://rubygems.org'
gem 'rails'

$ gem install pry
Successfully installed pry-0.12.2
Parsing documentation for pry-0.12.2
Done installing documentation for pry after 0 seconds
1 gem installed

$ bundle exec pry
bundler: failed to load command: pry (/home/k0kubun/.rbenv/versions/ruby/bin/pry)
Gem::Exception: can't find executable pry for gem pry. pry is not currently included in the bundle, perhaps you meant to add it to your Gemfile?
  /home/k0kubun/.rbenv/versions/ruby/lib/ruby/2.7.0/bundler/rubygems_integration.rb:378:in `block in replace_bin_path'
  /home/k0kubun/.rbenv/versions/ruby/lib/ruby/2.7.0/bundler/rubygems_integration.rb:406:in `block in replace_bin_path'
  /home/k0kubun/.rbenv/versions/ruby/bin/pry:23:in `<top (required)>'
```

### After

With `gem default` command, you can make it available under `bundle exec`.

```bash
$ gem default pry
(..snip...)
=> Copying files from "/home/k0kubun/.rbenv/versions/ruby/lib/ruby/gems/2.7.0/gems/pry-0.12.2/bin" to:
/home/k0kubun/.rbenv/versions/ruby/bin/pry (original => /home/k0kubun/.rbenv/versions/ruby/bin/pry.old)

$ cat Gemfile
source 'https://rubygems.org'
gem 'rails'

$ bundle exec pry
[1] pry(main)>
```

## Caveats

* Own your risk. This gem may break your Ruby installation.
* This does not support gems having non-`*.rb` files under "lib" yet.
  * Patches welcomed.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
