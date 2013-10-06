require 'spec_helper'

describe "PrimaryServerHighAvailability::HealthCheck" do
  describe "Ping" do
    before do
      @reachable_host = PrimaryServerHighAvailability::Host.new( :ip_address => '127.0.0.1')
      @unreachable_host = PrimaryServerHighAvailability::Host.new( :ip_address => '192.2.0.1')
      @timeout = 1
    end
  
    describe '#check?' do
      it 'reachable' do
        ping = PrimaryServerHighAvailability::HealthCheck::Ping.new(@reachable_host, @timeout)
        ping.check?.should be_true
      end
  
      it 'unreachable' do
        ping = PrimaryServerHighAvailability::HealthCheck::Ping.new(@unreachable_host, @timeout)
        ping.check?.should be_false
      end
    end
  end


  describe "MySQL" do
    before do
      @reachable_host = PrimaryServerHighAvailability::Host.new( :ip_address => '127.0.0.1')
      @unreachable_host = PrimaryServerHighAvailability::Host.new( :ip_address => '192.2.0.1')
      @user = "root"
      @password = nil
      @timeout = 1
    end
  
    describe '#check?' do
#      it 'reachable' do
#        mysql = PrimaryServerHighAvailability::HealthCheck::MySQL.new(@reachable_host, @user, @password, @timeout)
#        mysql.check?.should be_true
#      end
  
      it 'unreachable' do
        mysql = PrimaryServerHighAvailability::HealthCheck::MySQL.new(@unreachable_host, @user, @password, @timeout)
        mysql.check?.should be_false
      end
    end
  end
end
