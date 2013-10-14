# PrimaryServerHighAvailability

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'primary_server_high_availability'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install primary_server_high_availability

## Usage

TODO: Write usage instructions here

## TODOS

* mail sendor

* config loader


    hosts:
      primary: 192.2.0.1
      secondary:
        - 192.168.2.0.2
        - 192.168.2.0.3
    health_check:
      check_interval: 3
      retry_interval: 3
      retry_times: 3
      mysql:
        user: check_user
        password: 
        port: 3306 #default
    failover:
      command: /usr/local/sbin/myfailover_command

* manager
    * watching loop
    * do failover


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
