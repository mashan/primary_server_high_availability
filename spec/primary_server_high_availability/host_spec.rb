require 'spec_helper'

describe "PrimaryServerHighAvailability::Host" do
  describe '#new' do
    context 'IPv4' do
      it 'success' do
        ip_address = '192.0.2.1'
        host = PrimaryServerHighAvailability::Host.new(ip_address)
        host.ip.should == IPAddr.new(ip_address)
      end
    end

    context 'invalid IP' do
      it 'railse error' do
        ip_address = '192.0.2.256'
        lambda { PrimaryServerHighAvailability::Host.new(ip_address) }.should raise_error(ArgumentError)
      end
    end
  end
end
