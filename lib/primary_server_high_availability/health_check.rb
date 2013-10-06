require 'net/ping'

module PrimaryServerHighAvailability
  class HealthCheck
    class Ping
      def initialize(host=nil, timeout=3)
        @host = host
        @timeout = timeout
      end

      def check?
        Net::Ping::External.new(@host.ip_address, nil, @timeout).ping?
      end
    end

    class MySQL

    end
  end
end
