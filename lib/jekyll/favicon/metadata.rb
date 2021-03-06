module Jekyll
  module Favicon
    # Extended Page that generate files from ERB templates
    class Metadata < Jekyll::Page
      def initialize(site, base, dir, name)
        @site = site
        @base = base
        @dir = dir
        @name = name

        process @name
        prepend_path = @site.baseurl || ''
        template = File.read File.join Favicon.templates, "#{name}.erb"
        self.content = ERB.new(template, nil, '-').result binding
        self.data = { 'name' => name, 'layout' => nil }
      end
    end
  end
end
