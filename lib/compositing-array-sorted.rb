
if $__compositing_array__spec__development
  require_relative '../../compositing-array/lib/compositing-array.rb'
else
  require 'compositing-array'
end

class ::CompositingArray::Sorted < ::CompositingArray
end

require_relative 'compositing-array-sorted/CompositingArray/Sorted/Interface.rb'
require_relative 'compositing-array-sorted/CompositingArray/Sorted.rb'

