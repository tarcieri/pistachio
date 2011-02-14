require 'bundler/setup'
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'pistachio'

Bundler.setup :default
run Pistachio.new