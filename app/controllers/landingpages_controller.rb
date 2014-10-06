class LandingpagesController < ApplicationController


layout 'ios_landingpage', :only => [:games]

def games

@apps = App.all

end





end
