
require 'array/sorted'
require 'array/compositing'
#require_relative '../../../../../hooked_objects/array-sorted/lib/array-sorted.rb'
#require_relative '../../../../array-compositing/lib/array-compositing.rb'

# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

class ::Array::Sorted::Compositing < ::Array::Hooked

  include ::Array::Sorted::Compositing::ArrayInterface

end
