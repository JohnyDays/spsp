require 'slim'
require 'tilt'
class SSProto::Slim
	def self.setSlimOptions(hash)
		Slim::Engine.set_default_options( hash )
	end
	def self.renderSlim(filename,path)
		begin
			eval File.read("#{Dir.pwd}/each.rb")
			tilt_result = Tilt.new(filename).render self
			File.write(path,tilt_result)
		rescue Exception => e
			puts e.message
		end
	end
end