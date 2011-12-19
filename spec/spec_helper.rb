home = File.expand_path(File.join(File.dirname(__FILE__), ".."))
lib  = File.join(home, "lib")
spec = File.join(home, "spec")
$: << lib

Dir["#{spec}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config| 
	# Nothing here yet
end