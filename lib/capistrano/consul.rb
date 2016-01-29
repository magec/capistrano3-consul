require 'capistrano/consul/version'
require 'diplomat'

module Capistrano
  module Consul
    def self.setup
      return if @url
      @url = fetch(:consul_url)
      return false unless @url

      Diplomat.configure do |config|
        config.url = @url
      end
    end
  end

  module DSL
    def consul_service(service_name, properties = {})
      Consul.setup
      Diplomat::Service.get(service_name, :all).each do |node|
        server(node['Address'], properties)
      end
    end
  end
end
