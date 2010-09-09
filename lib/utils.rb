class Element
  def initialize selenium, expr
    @selenium = selenium
    @expr = expr
  end
  
  def type text
    @selenium.type @expr, text
  end
  
  def click
    @selenium.click @expr
    @selenium.wait_for_page_to_load
  end
end

class Browser
  def initialize(host='localhost', port=4444, browser='*firefox')
    @selenium = Selenium::SeleniumDriver.new host, port, browser, 'http://'
    @selenium.start
  end
  
  def go_to url
    @selenium.open url
    @selenium.wait_for_page_to_load
  end
  
  def find expr
    Element.new @selenium, expr
  end
  
  def quit
    @selenium.close
    @selenium.stop
  end

  def title
    @selenium.get_title
  end
end

def be(value)
  Matcher.new(value)
end

class Matcher
  def initialize(value)
    @value = value
  end
  def matches(other)
    @value == other
  end
  def to_s
    @value
  end
end

class Object
  def should(matcher)
    raise "'#{self}' should have been '#{matcher}'" unless matcher.matches(self)
  end
end
