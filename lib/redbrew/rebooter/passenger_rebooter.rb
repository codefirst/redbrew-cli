#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew::Rebooter
  class PassengerRebooter < Rebooter
    TYPE = 'passenger'

    def initialize(home_path)
      @home_path = home_path
    end

    def reboot
      system("touch #{@home_path}/tmp/restart.txt")
    end
  end
end
