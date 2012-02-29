#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe Redbrew::CLI do
  describe 'start' do
    subject { Redbrew::CLI.new }
    its(:start) { should == 'ok' }
  end
  describe 'version' do
    it do
      capture(:stdout) { Redbrew::CLI.new(['version']).run }.should == "Redbrew #{Redbrew::VERSION}\n"
    end
  end
end