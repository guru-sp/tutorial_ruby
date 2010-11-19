module Webby
  class Renderer
    
    def self.index_pages
      @index ||= {}
      if @index.empty?
        page = "Ruby - Mais um tutorial?"
        File.foreach("lib/index.txt") do |line|
          regexp = line.match(/\"(.*)\":(.*)/)
          @index[page] = [ regexp[1], regexp[2] ]
          page = regexp[1]
        end
      end
      @index
    end
    
    def next_page
      Renderer.index_pages[@page.title] || ["Início", "index.html"]
    end

  end  
end

