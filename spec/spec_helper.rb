require 'chefspec'
require 'chefspec/berkshelf'

TOPDIR = File.expand_path(File.join(File.dirname(__FILE__), ".."))
$: << File.expand_path(File.dirname(__FILE__))

RSpec.configure do |c|
  #c.filter_run :focus => true
  #c.run_all_when_everything_filtered = true
end
