# Dokument

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'dokument'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dokument

## Usage

TODO: Write usage instructions here

### Notes

MapReduce query for extracting entities with secondary index search
    {
       "inputs":{
           "bucket":"mybucket",
           "index":"field1_bin",
           "start":"val3",
           "end":"val4"
       },
       "query":[
          {
             "map":{
                "language":"javascript",
                "source":"
                  function(value, keydata, arg){
                    return [value];
                  }
                ",
                "keep":true
             }
          }
       ]
    }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
