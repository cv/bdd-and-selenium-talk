require File.join File.dirname(__FILE__), 'lib', 'selenium'
require File.join File.dirname(__FILE__), 'lib', 'utils'

b = Browser.new
b.go_to 'google.com'
b.find('q').type 'qcon'
b.find('btnG').click
b.title.should be('qcon - Pesquisa Google')

b.quit
