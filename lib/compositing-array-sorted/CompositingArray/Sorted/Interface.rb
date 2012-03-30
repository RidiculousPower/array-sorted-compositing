
# We keep the interface for our sorted compositing array separate because it can be combined
# with the unique compisiting array.
module ::CompositingArray::Sorted::Interface

  ##############
  #  reverse!  #
  ##############

  def reverse!
    
    @sort_order_reversed = ! @sort_order_reversed
    
    super
    
    @sub_composite_arrays.each do |this_sub_array|
      this_sub_array.reverse!
    end
    
    return self
    
  end
  
  ##############
  #  collect!  #
  #  map!      #
  ##############

  def collect!
    
    return to_enum unless block_given?
    
    replacement_array = [ ]
    self.each_with_index do |this_object, index|
      replacement_object = yield( this_object )
      replacement_array[ index ] = replacement_object
    end
    
    replace( replacement_array )
    
    return self
    
  end
  alias_method :map!, :collect!
  
  ###########
  #  sort!  #
  ###########

  def sort!( & block )

    if block_given?
      self.each_with_index do |this_member, index|
        unless index + 1 == count
          yield( this_member, self[ index + 1 ] )
        end
      end
    end
    
    return self

  end

  ##############
  #  sort_by!  #
  ##############

  def sort_by!( & block )

    return to_enum unless block_given?
  
    self.each do |this_member|
      yield( this_member )
    end
    
    return self
    
  end
  
  ##################################################################################################
      private ######################################################################################
  ##################################################################################################

  #######################
  #  non_cascading_set  #
  #######################

  def non_cascading_set( index, object )
    
    # we ignore the index and insert in sorted order
    
    # if index matches an existing index we remove it and insert
    
    # otherwise we simply insert
    
    unless index >= count
      delete_at( index )
    end
    
    @parent_and_interpolated_object_count += 1
    
    non_cascading_insert( index, object )
    
  end
  
  ##########################
  #  non_cascading_insert  #
  ##########################

  def non_cascading_insert( index, *objects )
    
    # we ignore the index and insert in sorted order

    # we have to have at least one member for comparison-based insert (to retain sorted order)

    objects.each do |this_object|

      insert_occurred = false

      if this_object.nil?
        if @sort_order_reversed
          super( count, this_object )
        else
          super( 0, this_object )
        end
        next
      end
      
      self.each_with_index do |this_member, this_index|
        
        if @sort_order_reversed

          case this_object <=> this_member
            when 0, 1
              super( this_index, this_object )
              insert_occurred = true
              break
          end
          
        else
          
          case this_object <=> this_member
            when 0, -1
              super( this_index, this_object )
              insert_occurred = true
              break
          end
          
        end
        
      end
    
      unless insert_occurred
        super( count, this_object )
      end
      
    end

  end
    
end
