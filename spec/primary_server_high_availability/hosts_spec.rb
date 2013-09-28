require 'spec_helper'

describe "PrimaryServerHighAvailability::Hosts" do
  before do
    @host_1 = PrimaryServerHighAvailability::Host.new(
      {
        :ip_address => '192.0.2.1',
        :primary => true
      }
    )

    @host_2 = PrimaryServerHighAvailability::Host.new(
      {
        :ip_address => '192.0.2.2',
      }
    )
    
    @host_3 = PrimaryServerHighAvailability::Host.new(
      {
        :ip_address => '192.0.2.3',
      }
    )
  end

  describe '#push' do
    context 'Normal hosts' do
      it 'list incremented' do
        hosts = PrimaryServerHighAvailability::Hosts.new

        hosts.push(@host_1)
        hosts.list.should == [@host_1]

        hosts.push(@host_2)
        hosts.list.should == [@host_1, @host_2]

        hosts.push(@host_3)
        hosts.list.should == [@host_1, @host_2, @host_3]
      end
    end

    context 'Multiple primaries' do
      it 'raise' do
        hosts = PrimaryServerHighAvailability::Hosts.new

        hosts.push(@host_1)
        hosts.list.should == [@host_1]

        @host_2.promote
        lambda { hosts.push(@host_2) }.should raise_error(RuntimeError)
      end
    end
  end

  describe '#primary & #secondaries & #alives & #deads' do
    before do
      @hosts = PrimaryServerHighAvailability::Hosts.new
      @hosts.push(@host_1)
      @hosts.push(@host_2)
      @hosts.push(@host_3)
    end

    it '1 primary and 2 secondaries exist' do
      @hosts.primary == @host_1
      @hosts.secondaries == [@host_2, @host_3]
    end

    context 'all servers alive' do
      it '3 hosts alive' do
        @hosts.alives.should == [@host_1, @host_2, @host_3]
        @hosts.deads.should be_empty
      end
    end

    context 'host_3 is down' do
      it '2 hosts alive' do
        @host_3.down
        @hosts.alives.should == [@host_1, @host_2]
        @hosts.deads.should == [@host_3]
      end
    end
  end
end
