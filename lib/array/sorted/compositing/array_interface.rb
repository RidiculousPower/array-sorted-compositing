
module ::Array::Sorted::Compositing::ArrayInterface
  
  include ::Array::Sorted::ArrayInterface
  include ::Array::Compositing::ArrayInterface

  ##############
  #  reverse!  #
  ##############

  def reverse!
    
    super
    
    @children.each do |this_sub_array|
      this_sub_array.instance_eval do
        parent_reversed!
      end
    end
    
  end
  
  ##############
  #  shuffle!  #
  ##############
  
  def shuffle!( random_number_generator = nil )
    
    return false
    
  end

  ######################################################################################################################
      private ##########################################################################################################
  ######################################################################################################################

  ##############################
  #  update_for_parent_insert  #
  ##############################

  def update_for_parent_insert( parent_instance, requested_parent_index, parent_index, object )
    
    # if requested index is not the same as sorted index we want to delete requested index
    # that means if child doesn't have it to delete we don't want to do anything for child
    
    unless requested_parent_index != parent_index and
           @parent_index_map.replaced_parent_element_with_parent_index?( parent_instance, requested_parent_index )
      super
    end
    
  end
        
end
