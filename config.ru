require 'bundler/setup'
require File.expand_path('../lib/pistachio', __FILE__)

Bundler.setup :default
run Pistachio.new