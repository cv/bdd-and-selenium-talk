require File.join File.dirname(__FILE__), 'lib', 'selenium'
require File.join File.dirname(__FILE__), 'lib', 'utils'

firefox do |b|
  b.go_to 'google.com'
  b.find('q').type 'cookie'
  b.find('btnG').click
  b.title.should be('cookie - Pesquisa Google')
  
  puts ':)'
end
