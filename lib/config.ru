require 'sinatra/base'

require_relative 'main'
require_relative 'song'
# require_relative 'admin/config/environment'

# map('/songs') { run SongController }
# map('/') { run Website }
# map('/admin'){ run Rails.application }
# run SongController.new
run Website.new
