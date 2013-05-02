require 'date'

Gem::Specification.new do |spec|

  spec.name                      =  'array-sorted-compositing'
  spec.rubyforge_project         =  'array-sorted-compositing'
  spec.version                   =  '1.1.0'

  spec.summary                   =  "Provides Array::Sorted::Compositing."
  spec.description               =  "An implementation of Array that permits chaining, where children inherit changes to parent and where parent settings can be overridden in children, and that retains sorted order."

  spec.authors                   =  [ 'Asher' ]
  spec.email                     =  'asher@ridiculouspower.com'
  spec.homepage                  =  'http://rubygems.org/gems/array-sorted-compositing'

  spec.add_dependency            'array-compositing'
  spec.add_dependency            'array-sorted'

  spec.date                      =  Date.today.to_s
  
  spec.files                     = Dir[ '{lib,lib_ext,spec}/**/*',
                                        'README*', 
                                        'LICENSE*',
                                        'CHANGELOG*' ]

end
