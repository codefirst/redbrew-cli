#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew::Rebooter
  class NotImplemented < Exception; end

  class Rebooter
    def reboot
      raise NotImplemented, "'reboot' must be implemented in subclass."
    end

    def self.create(type, home_path)
      if type == PassengerRebooter::TYPE
        PassengerRebooter.new(home_path)
      end
    end
  end
end
