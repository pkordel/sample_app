class PagesController < ApplicationController
  def home
    @title = "Ruby on Rails Tutorial Sample App | Home"
  end

  def contact
    @title = "Ruby on Rails Tutorial Sample App | Contact"
  end
  
  def about
    @title = "Ruby on Rails Tutorial Sample App | About"
  end

end
