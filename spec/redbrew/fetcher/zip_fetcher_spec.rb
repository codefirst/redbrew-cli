#!/usr/bin/env ruby
# -*- mode:ruby; coding:utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Redbrew::ZipFetcher do
  ZIP_FILE_URI = 'https://bitbucket.org/haru_iida/redmine_code_review/downloads/redmine_code_review-0.4.7.zip'

  describe 'extract_file_name' do
    subject { Redbrew::ZipFetcher.new('.', ZIP_FILE_URI)}
    its(:extract_file_name) { should == 'redmine_code_review-0.4.7.zip' }
  end

  describe 'fetch' do
    it do
      fetcher = Redbrew::ZipFetcher.new('./vendor/plugins', ZIP_FILE_URI)
      fetcher.stub(:tmp_dir).and_return('/tmp')
      fetcher.should_receive(:system).with("wget #{ZIP_FILE_URI} -O /tmp/redmine_code_review-0.4.7.zip") { true }
      fetcher.should_receive(:system).with("unzip /tmp/redmine_code_review-0.4.7.zip ./vendor/plugins/redmine_code_review-0.4.7") { true }
      fetcher.fetch.should be_true
    end
  end
end
