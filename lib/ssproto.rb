require 'filewatcher'
class SSProto
	def self.create
		require 'fileutils'
		FileUtils.cp_r(Dir["#{File.expand_path('../../template/',__FILE__)}/*"],Dir.pwd)
		self.watch
	end
	def self.watch
		begin
		compass =Process.spawn("compass watch")
		Process.detach compass
		coffee = Process.spawn("coffee -o js -cw coffee")
		Process.detach coffee
		SSProto::Slim.setSlimOptions :pretty => true,:sort_attrs => false
		directories_to_watch = ["index.slim","each.rb","css/","js/"]
		puts "Watching:\n         #{directories_to_watch.join("\n         ")}\n"
		FileWatcher.new(directories_to_watch).watch do |f|
			puts "Rendering index.html"
			SSProto::Slim.renderSlim("#{Dir.pwd}/index.slim","#{Dir.pwd}/index.html")
			puts "	finished"
		end
		rescue SystemExit, Interrupt
			Process.kill "SIGINT",compass
			Process.kill "SIGINT",coffee
		end
	end
end
require 'slim/slim.rb'