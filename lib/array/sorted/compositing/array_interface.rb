
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
        
end
