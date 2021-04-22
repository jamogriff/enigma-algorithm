require './lib/sequencer'
require './lib/library'
require 'pry'

new_sequencer = Sequencer.new("hello world", :A)
binding.pry
