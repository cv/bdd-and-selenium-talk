require File.join File.dirname(__FILE__), 'lib', 'selenium'
require File.join File.dirname(__FILE__), 'lib', 'utils'

module Google
  class Page
    attr_reader :browser
    
    def initialize(browser)
      @browser = browser
    end
    
    def title
      browser.title
    end
  end

  class Home < Page
    def initialize(browser)
      super browser
      browser.go_to 'google.com'
      title.should be('Google')
    end
    
    def search_for(term)
      browser.find('q').type term
      browser.find('btnG').click
      Results.new term, browser
    end
  end

  class Results < Page
    def initialize(term, browser)
      super browser
      title.should be("#{term} - Pesquisa Google")
    end
  end
end

firefox do |b|
  g = Google::Home.new b
  r = g.search_for 'cookie'
  r.title.should be('cookie - Pesquisa Google')
  puts ':)'
end
