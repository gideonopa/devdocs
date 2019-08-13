module Docs
  class Jest < UrlScraper
    self.type = 'simple'
    self.release = '24.8.0'
    self.base_url = 'https://jestjs.io/docs/en/'
    self.root_path = 'getting-started'
    self.links = {
      home: 'https://facebook.github.io/jest/',
      code: 'https://github.com/facebook/jest'
    }

    html_filters.push 'jest/entries', 'jest/clean_html'

    options[:container] = '.docMainWrapper'

    options[:attribution] = <<-HTML
      &copy; 2014&ndash;present Facebook Inc.<br>
      Licensed under the BSD License.
    HTML

    def get_latest_version(opts)
      doc = fetch_doc('https://jestjs.io/docs/en/getting-started', opts)
      doc.at_css('header > a > h3').content
    end
  end
end
