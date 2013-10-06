require 'spec_helper'
require 'stringio' 

def capture(stream)
  begin
    stream = stream.to_s
    eval "$#{stream} = StringIO.new"
    yield
    result = eval("$#{stream}").string
  ensure
    eval "$#{stream} = #{stream.upcase}"
  end
  result
end

describe "PrimaryServerHighAvailability::Failover" do
  before do
    @new_primary_host = PrimaryServerHighAvailability::Host.new(
      {
        :ip_address => '192.0.2.1',
        :primary => true
      }
    )

    @alive_secondary_host_1 = PrimaryServerHighAvailability::Host.new(
      {
        :ip_address => '192.0.2.2',
      }
    )
    @alive_secondary_host_2 = PrimaryServerHighAvailability::Host.new(
      {
        :ip_address => '192.0.2.3',
      }
    )
    @alive_secondary_hosts = PrimaryServerHighAvailability::Hosts.new
    @alive_secondary_hosts.push(@alive_secondary_host_1)
    @alive_secondary_hosts.push(@alive_secondary_host_2)

    @command = 'echo'
  end

  describe '#execute' do
    it 'success' do
      failover = PrimaryServerHighAvailability::Failover.new(@new_primary_host, @alive_secondary_hosts, @command)
      failover.execute.should be_true
    end
  end
end
