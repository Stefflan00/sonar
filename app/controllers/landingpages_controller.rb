class LandingpagesController < ApplicationController
require 'open-uri'
require 'json'

layout 'ios_landingpage', :only => [:games]

def games

@object = JSON.parse(open("https://itunes.apple.com/lookup?id=774751518").read)
#@new_object = ActiveSupport::JSON.decode(@object)

end





end
