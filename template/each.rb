	@javascript_files = Dir.entries( "#{Dir.pwd}/js/" ) - ["..","."]
	@css_files = Dir.entries( "#{Dir.pwd}/css/" ) - ["..","."]
	@javascript_files.select!{|e| File.extname( e ) == ".js"}
	@css_files.select!{|e| File.extname( e ) == ".css"}
