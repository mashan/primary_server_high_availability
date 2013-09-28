module PrimaryServerHighAvailability
  class Hosts
    def initialize
      @list = []
    end

    def list
      @list
    end

    def push(host)
      validate_muliple_primary(host)
      @list.push(host)
    end

    def primary
      @list.find(&:primary?)
    end

    def secondaries
      @list.reject( &:alive? )
    end

    def alives
      @list.select(&:alive?)
    end

    def deads
      @list.reject( &:alive? )
    end

    private 
    def validate_muliple_primary(host)
      return unless host.primary?
      raise 'Primary already exists!' if self.primary
    end
  end
end
