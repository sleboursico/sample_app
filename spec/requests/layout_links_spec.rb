require 'spec_helper'

describe "LayoutLinks" do

  it "devrait trouver une page Accueil a '/'" do
    get '/'
    response.should have_selector('title', :content => "Accueil")
  end

  it "devrait trouver une page Contact at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "should have an a Propos page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "A propos")
  end

  it "devrait trouver une page Iade a '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Aide")
  end

  it "devrait y avoir une page a '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Inscription")
  end

   it "devrait avoir le bon lien sur le layout" do
    visit root_path
    click_link "A propos"
    response.should have_selector('title', :content => "A propos")
    click_link "Aide"
    response.should have_selector('title', :content => "Aide")
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")
    click_link "Accueil"
    response.should have_selector('title', :content => "Accueil")
    click_link "S'inscrire !"
    response.should have_selector('title', :content => "Inscription")
  end
end