require 'rufus-scheduler'
require 'rubygems'
require 'bundler/setup'
require "pp"
require 'yaml'
require 'google_drive'
require 'redd'

@client = Google::APIClient.new(application_name: 'SROTDroid', application_version: '2.1')
@config = YAML::load(IO.read('config.yml'))
@redditConfig=@config['reddit']
@redditclient=Redd.it(:script,@redditConfig['clientid'],@redditConfig['secret'],@redditConfig['username'],@redditConfig['password'],user_agent: "SROTDroid V 2.1")
@redditclient.authorize!

pp @redditclient.subreddit_from_name("lgbt")