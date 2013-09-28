require 'ipaddr'

module PrimaryServerHighAvailability
  class Host
    attr_reader :ip

    def initialize(ip)
      @ip = IPAddr.new(ip)
    end
  end
end
