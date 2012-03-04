#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew::Rebooter
  class NotImplemented < Exception; end

  class Rebooter
    def reboot
      raise NotImplemented, "'reboot' must be implemented in subclass."
    end

    def self.create(type, redmine_home)
      if type == PassengerRebooter::TYPE
        PassengerRebooter.new(redmine_home)
      end
    end
  end
end
