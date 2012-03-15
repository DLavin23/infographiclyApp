module ArticlesHelper
  
  include ActsAsTaggableOn::TagsHelper
  
  def status(current_state)
    
    if current_state == 0 
      return "Unread"
    else
      return "Read"
    end
  end
  
  
end
