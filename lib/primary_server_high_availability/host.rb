require 'ipaddr'

module PrimaryServerHighAvailability
  class Host
    attr_reader :ip_address

    def initialize(config = {})
      @ip_address = IPAddr.new(config[:ip_address])
      @primary = config[:primary]
      self.up
    end

    def alive?
      @alive
    end

    def primary?
      @primary
    end

    def promote
      @primary = true
    end

    def demote
      @primary = false
    end

    def up
      @alive = true
    end

    def down
      @alive = false
    end
  end
end
