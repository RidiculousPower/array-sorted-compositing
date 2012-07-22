
module ::Array::Sorted::Compositing::ArrayInterface
  
  include ::Array::Sorted::ArrayInterface
  include ::Array::Compositing::ArrayInterface

  ##############
  #  reverse!  #
  ##############

  def reverse!
    
    super
    
    @sub_composite_arrays.each do |this_sub_array|
      this_sub_array.instance_eval do
        parent_reversed!
      end
    end
    
  end

  ######################################################################################################################
      private ##########################################################################################################
  ######################################################################################################################

  ##############################
  #  update_for_parent_insert  #
  ##############################

  def update_for_parent_insert( requested_parent_index, parent_index, object )
    
    # if requested index is not the same as sorted index we want to delete requested index
    # that means if child doesn't have it to delete we don't want to do anything for child
    
    unless requested_parent_index != parent_index and
           @parent_index_map.replaced_parent_element_with_parent_index?( requested_parent_index )
      super
    end
    
  end
        
end
