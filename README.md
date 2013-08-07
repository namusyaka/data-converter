# data-converter

DataConverter convert Array and Hash into HTML.

## Installation

add this line to your Gemfile.

`gem 'data-converter'`

or

`$ gem install data-converter`

## Usage

```ruby
require 'data-converter'

DataConverter.parse([0,1,2,3]) #=> "<ul><li>0</li><li>1</li><li>2</li></ul>"
DataConverter.parse(:foo => "bar") #=> "<dl><dt>foo</dt><dd>bar</dd></dl>"
```

## Contributing to Botch

1. fork the project.
2. create your feature branch. (`git checkout -b my-feature`)
3. commit your changes. (`git commit -am 'commit message.'`)
4. push to the branch. (`git push origin my-feature`)
5. send pull request.

## License

MIT

