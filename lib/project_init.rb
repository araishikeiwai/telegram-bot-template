class ProjectInit

  def self.start
    system("mv lib/init_folder lib/#{$namespace}")
    system("mv lib/init_class.rb lib/#{$namespace}.rb")
  end
end
