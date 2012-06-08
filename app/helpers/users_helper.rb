module UsersHelper


  # Retourner un titre basé sur la page.
  def logo
    image_tag("logo.png", :alt => "Application exemple", :class => "round") 
  end

end
