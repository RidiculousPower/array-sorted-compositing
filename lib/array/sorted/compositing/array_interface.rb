# -*- encoding : utf-8 -*-

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
    
    return self
    
  end

  ##############################
  #  update_for_parent_insert  #
  ##############################

  def update_for_parent_insert( parent_array, requested_parent_index, parent_index, object )
    
    # if requested index is not the same as sorted index we want to delete requested index
    # that means if child doesn't have it to delete we don't want to do anything for child
    
    super unless requested_parent_index != parent_index and
                 ! @cascade_controller.parent_controls_parent_index?( parent_array, requested_parent_index )
    
  end
        
end
