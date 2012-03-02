#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe Redbrew::CLI do
  describe 'version' do
    subject { capture(:stdout) { Redbrew::CLI.new(['version']).run } }
    it { should == "Redbrew #{Redbrew::VERSION}\n" }
  end
end
