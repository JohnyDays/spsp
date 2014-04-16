	@javascript_files = Dir.entries( "#{Dir.pwd}/js/" ) - ["..","."]
	@css_files = Dir.entries( "#{Dir.pwd}/css/" ) - ["..","."]
