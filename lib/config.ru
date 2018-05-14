require 'sinatra/base'

require './main'
require './song'
require './admin/config/environment'

map('/songs') { run SongController }
map('/') { run Website }
map('/admin'){ run Rails.application }
