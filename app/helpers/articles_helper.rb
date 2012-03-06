module ArticlesHelper

  def status(current_state)
    
    if current_state == 0 
      return "Read"
    else
      return "Unread"
    end
  end

end
