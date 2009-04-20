# We only want to remove the generated files
desc "Delete the website"
override_task :clobber do |t|
  Dir.chdir(Webby.site.output_dir) do
    Dir['*'].entries.reject {|entry| entry == '_webby'}.each {|entry| rm_rf entry}
  end
end
 
desc "Clobber, then build the website"
task :clean_build => [:clobber, :build]
