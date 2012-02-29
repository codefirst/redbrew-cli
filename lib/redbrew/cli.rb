#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew
  class CLI
    def initialize(args = ARGV)
      @args = args
    end

    def run
      cmd = @args[0]
      if cmd == 'version'
        puts 'Redbrew ' + Redbrew::VERSION
      end
    end
  end
end
