class AdminController < ApplicationController
layout 'admin'
http_basic_authenticate_with :name => "frodo", :password => "thering"  

end
