
module ::CompositingArray::Sorted::Interface
  
  include ::SortedArray::Interface
  include ::CompositingArray::Interface

  ##############
  #  reverse!  #
  ##############

  def reverse!
    
    super
    
    @sub_composite_arrays.each do |this_sub_array|
      this_sub_array.reverse!
    end
    
  end
    
  ##################################################################################################
      private ######################################################################################
  ##################################################################################################

  ###############################
  #  perform_set_between_hooks  #
  ###############################

  def perform_set_between_hooks( index, object )
    
    super( index, object )
    
    @parent_and_interpolated_object_count += 1
    
  end
      
end
