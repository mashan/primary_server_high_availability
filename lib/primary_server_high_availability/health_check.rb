require 'net/ping'
require 'mysql'

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
      def initialize(host=nil, user=nil, password=nil, timeout=3)
        @host = host
        @user = user
        @password = password
        @timeout = timeout
      end

      def check?
        command = "mysqladmin ping -h#{@host.ip_address} -u#{@user} --connect_timeout #{@timeout}"
        command = command + "-p#{@password}" if @password
        system(command)
      end
    end
  end
end
