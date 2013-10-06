module PrimaryServerHighAvailability
  class Failover
    def initialize(new_primary_host=nil, alive_secondary_hosts=nil ,command=nil)
      @new_primary_host = new_primary_host
      @alive_secondary_hosts = alive_secondary_hosts
      @command = command
    end

    def execute
      command = @command + 
        " --new_primary_host=#{@new_primary_host.ip_address}" + 
        " --secondary_hosts=#{@alive_secondary_hosts.list.map(&:ip_address).join(',')}"
      system(command)
    end
  end
end
