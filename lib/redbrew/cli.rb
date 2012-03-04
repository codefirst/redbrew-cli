#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

module Redbrew
  class CLI
    HELP = <<HELP
Redbrew - A missing Redmine plugin manager.

Commands:

 install <plugin_id>   - install specified plugin
 search  <keyword>     - search plugins with specified keyword
 reboot  <server_type> - reboot Remdmine
                         (supporting server_type is 'passenger')
 version               - show Redbrew's version
 help                  - show this message

HELP


    def initialize(args = ARGV)
      @args = args
    end

    def run
      cmd = @args[0]
      if cmd == 'version'
        puts 'Redbrew ' + Redbrew::VERSION
      elsif cmd == 'search'
        puts search(@args[1])
      elsif cmd == 'install'
        puts install(@args[1])
      elsif cmd == 'reboot'
        puts reboot(@args[1])
      elsif cmd == 'help'
        puts HELP
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

    def install(plugin_id)
      home = redmine_home
      unless home.valid?
        warn "This command should be kicked at REDMINE_HOME!"
      else
        out = (core(home).install(plugin_id) || '')
      end
      out || ''
    end

    def reboot(server_type)
      home = redmine_home
      unless home.valid?
        warn "This command should be kicked at REDMINE_HOME!"
      else
        result = core(home).reboot(server_type)
        out = 'reboot ' + (result ? 'successful' : 'failure')
      end
      out || ''
    end

    def core(home)
      Core.new(home)
    end

    def redmine_home
      RedmineHome.new
    end
  end
end
