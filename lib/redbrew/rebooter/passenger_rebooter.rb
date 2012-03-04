#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew::Rebooter
  class PassengerRebooter < Rebooter
    TYPE = 'passenger'

    def initialize(redmine_home)
      @redmine_home = redmine_home
    end

    def reboot
      system("touch #{@redmine_home.tmp}/restart.txt")
    end
  end
end
