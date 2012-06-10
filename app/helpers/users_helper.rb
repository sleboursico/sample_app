module UsersHelper


  # Retourner un titre basé sur la page.
  def logo
    image_tag("logo.png", :alt => "Application exemple", :class => "round") 
  end

   def gravatar_for(user, options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => user.nom,
                                            :class => 'gravatar',
                                            :gravatar => options)
   end

end
  