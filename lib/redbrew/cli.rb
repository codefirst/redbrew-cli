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
      elsif cmd == 'search'
        puts search(@args[1])
      end
    end

    private
    def search(keyword)
      out = ''
      plugins = Core.new.search(keyword)
      plugins.each do |plugin|
        out << plugin['name']
        out << ":\t"
        out << plugin['description']
        out << "\n"
      end
      out
    end
  end
end
