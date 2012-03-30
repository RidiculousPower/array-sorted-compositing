require 'date'

Gem::Specification.new do |spec|

  spec.name                      =  'compositing-array-sorted'
  spec.rubyforge_project         =  'compositing-array-sorted'
  spec.version                   =  '1.0.4'

  spec.summary                   =  "Provides CompositingArray::Sorted."
  spec.description               =  "An implementation of Array that permits chaining, where children inherit changes to parent and where parent settings can be overridden in children, and that retains sorted order."

  spec.authors                   =  [ 'Asher' ]
  spec.email                     =  'asher@ridiculouspower.com'
  spec.homepage                  =  'http://rubygems.org/gems/compositing-array-sorted'

  spec.add_dependency            'compositing-array'

  spec.date                      =  Date.today.to_s
  
  spec.files                     = Dir[ '{lib,spec}/**/*',
                                        'README*', 
                                        'LICENSE*' ]

end
