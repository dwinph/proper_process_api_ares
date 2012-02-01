begin
  require 'active_resource'
rescue LoadError
  begin
    require 'rubygems'
    require 'active_resource'
  rescue LoadError
   abort "Unable to load activeresource.\n You can install it using gem install activeresoruce"
  end
end

require "proper_process_api_ares/version"

module ProperProcess
  class << self
    attr_accessor :site, :api_key
    def configure
      yield self
      
      Base.user = api_key
      Base.password = 'x'

      self.site ||= "http://properprocess.com"
      Base.site = site
    end
  end
  
  class Base < ActiveResource::Base
    def to_xml(options = {})
      options.merge!(:dasherize => false)
      super
    end
  end

  class Procedure < Base
    
  end
end
