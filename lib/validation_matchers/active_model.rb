here = File.dirname(__FILE__)
Dir["#{here}/active_model/*.rb"].each {|f| require f}