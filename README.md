[![Code Climate](https://codeclimate.com/github/IcaliaLabs/hermes/badges/gpa.svg)](https://codeclimate.com/github/IcaliaLabs/hermes)
[![Test Coverage](https://codeclimate.com/github/IcaliaLabs/hermes/badges/coverage.svg)](https://codeclimate.com/github/IcaliaLabs/hermes/coverage)
[![Issue Count](https://codeclimate.com/github/IcaliaLabs/hermes/badges/issue_count.svg)](https://codeclimate.com/github/IcaliaLabs/hermes)
![Made with Love by Icalia Labs](https://img.shields.io/badge/With%20love%20by-Icalia%20Labs-ff3434.svg)

<div style="text-align:center">
  <img src="assets/logo.png" width="980">
</div>

Hermes is an open source ruby gem that acts as a wrapper for IBM Watson's [Language Translator service API](https://www.ibm.com/watson/developercloud/language-translator.html).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hermes-bot'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hermes-bot

## Usage

### Configuration

In order for Hermes to work correctly, it is important that you [set up an IBM Bluemix account of your own](https://console.ng.bluemix.net/) and that your trial period hasn't ended (or, for that matter, that you've registered for a paid account)

First require the `hermes-bot` in your file:

```ruby
require 'hermes-bot'
```

Then add the following configuration block:

```ruby

Hermes::Bot.configure do |config|
	config.username = SOME_USERNAME
	config.password = SOME_PASSWORD
	config.base_uri = "https://gateway.watsonplatform.net/language-translator/api"
end
```

**Note: The username and password are not your Bluemix credentials. These
credentials are specific to the Natural Language Classifier API and must
be obtained from said section of Watson's Docs**

### Using the translator

In order to use the translator, simply use the class `Hermes::Bot::Translator` translate method:

```ruby
Hermes::Bot::Translator.translate(source: "en", target: "es", text: "hello")
```

`Hermes::Bot::Translator.translate` returns the translated text. An example can be seen below:

`"Hello"`  

### Identifying languages

In order to identify languages, simply use the class `Hermes::Bot::Translator` identify method:

```ruby
Hermes::Bot::Translator.identify("hello")
```
`Hermes::Bot::Translator.identify` returns an array of type `Hermes::Bot::Language`. An example of the array can be seen below:

```
[#<Hermes::Bot::Language:0x007f9731516dd0 @language="en", @confidence=0.317471>, #<Hermes::Bot::Language:0x007f9731516da8 @language="fi", @confidence=0.166536>, #<Hermes::Bot::Language:0x007f9731516d80 @language="it", @confidence=0.096696>, #<Hermes::Bot::Language:0x007f9731516d58 @language="nb", @confidence=0.0535525>,...]
 ```

### Identifiable languages

In order find the identifiable languages, simply use the class `Hermes::Bot::Translator` identifiable_languages method:

```ruby
Hermes::Bot::Translator.identifiable_languages
```
`Hermes::Bot::Translator..identifiable_languages` returns an array of `Hermes::Bot::Language`. An example of the array can be seen below:

```
[#<Hermes::Bot::IdentifiableLanguage:0x007f81b7219950 @language="af", @name="Afrikaans">, #<Hermes::Bot::IdentifiableLanguage:0x007f81b7219928 @language="ar", @name="Arabic">, #<Hermes::Bot::IdentifiableLanguage:0x007f81b7219900 @language="az", @name="Azerbaijani">, #<Hermes::Bot::IdentifiableLanguage:0x007f81b72198d8 @language="ba", @name="Bashkir">,..]
```

### List models

In order to list all the models, simply use the class `Hermes::Bot::Translator` models method:

```ruby
Hermes::Bot::Translator.models
```

`Hermes::Bot::Translator.models` returns an array of type `Hermes::Bot::Model`. An example of the array can be seen below:

```
[#<Hermes::Bot::Model:0x007fb11c2604d8 @id="ar-en", @source="ar", @target="en", @base_model_id="", @customizable=true, @default=nil, @domain="news", @owner="", @status="available", @name="">, #<Hermes::Bot::Model:0x007fb11c2604b0 @id="ar-en-conversational", @source="ar", @target="en", @base_model_id="", @customizable=false, @default=nil, @domain="conversational", @owner="", @status="available", @name="">,...]
```

### Find a model

In order to find a model, simply use the class `Hermes::Bot::Translator` model method:

```ruby
Hermes::Bot::Translator.model("ar-en")
```

`Hermes::Bot::Translator.model` returns an object of type `Hermes::Bot::Model`. An example of the object can be seen below:

```
#<Hermes::Bot::Model:0x007fb11b8cfa18 @id="ar-en", @source="ar", @target="en", @base_model_id="", @customizable=true, @default=nil, @domain="news", @owner="", @status="available", @name="">
```

### Create a model

In order to create a model, use the class `Hermes::Bot::Translator` create_model method:

```ruby
Hermes::Bot::Translator.create_model(base_model_id: "en-es",name: "custom-english-to-spanish",forced_glossary: File.open("/Users/Jorge/Desktop/tmxExample.tmx"
```

<!-- `Hermes::Bot::Translator.create_model` returns the newly created object of type `Hermes::Bot::Model`. An example of the object can be seen below: -->

### Delete a model

In order to delete a model, simply  use the class `Hermes::Bot::Translator` destroy_model method:

```ruby
Hermes::Bot::Translator.destroy_model(model_id)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hermes-bot. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
