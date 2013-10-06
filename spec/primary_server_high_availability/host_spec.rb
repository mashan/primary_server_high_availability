require 'spec_helper'

describe "PrimaryServerHighAvailability::Host" do
  before do
    ip_address = '192.0.2.1'
    @host = PrimaryServerHighAvailability::Host.new(
      { 
        :ip_address => ip_address,
        :primary => true
      }
    )
  end

  describe '#new' do
    context 'IPv4 Primary' do
      it 'success' do
        ip_address = '192.0.2.1'

        host = PrimaryServerHighAvailability::Host.new(
          {
            :ip_address => ip_address,
            :primary => true
          }
        )
        host.ip_address.should == IPAddr.new(ip_address)
        host.primary?.should be_true
        host.alive?.should be_true
      end
    end

    context 'IPv4 Secondary' do
      it 'success' do
        ip_address = '192.0.2.2'

        host = PrimaryServerHighAvailability::Host.new(
          {
            :ip_address => ip_address,
          }
        )
        host.ip_address.should == IPAddr.new(ip_address)
        host.primary?.should be_false
        host.alive?.should be_true
      end
    end

    context 'invalid IP' do
      it 'railse error' do
        ip_address = '192.0.2.256'
        lambda { PrimaryServerHighAvailability::Host.new( :ip_address => ip_address) }.should raise_error(ArgumentError)
      end
    end
  end

  describe '#demote & #promote' do
    it 'host demote to secondary. next, promote to primary' do
      @host.demote
      @host.primary?.should be_false

      @host.promote
      @host.primary?.should be_true
    end
  end

  describe '#down' do
    it 'host down' do
      @host.down.should be_false
    end
  end

  describe '#up' do
    it 'host down' do
      @host.up.should be_true
    end
  end
end
