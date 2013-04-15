# -*- encoding : utf-8 -*-

require 'array/sorted'
require 'array/compositing'

# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

class ::Array::Sorted::Compositing < ::Array::Hooked

  include ::Array::Sorted::Compositing::ArrayInterface

end
