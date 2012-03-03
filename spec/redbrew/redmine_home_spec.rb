#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe Redbrew::RedmineHome do
  context 'check?' do
    subject { Redbrew::RedmineHome.new }
    it { should_not be_valid }
  end
end

