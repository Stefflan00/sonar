class PagesController < ApplicationController
   http_basic_authenticate_with :name => "frodo", :password => "thering"  
  def startpage
  end
end
