require 'sinatra_sandbox/version'
require 'sinatra/base'
require 'slim'
require 'sass'
require 'data_mapper'


SINATRA_PATH = File.expand_path("../sinatra", __FILE__)

%w(helpers controllers models).each{|folder| Dir["#{SINATRA_PATH}/#{folder}/*.rb"].each {|file| require file
}
}