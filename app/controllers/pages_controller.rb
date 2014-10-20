class PagesController < ApplicationController
  def startpage
  end


  require 'oauth2'

  @client = OAuth2::Client.new("640687540759-jhk718civcso5jb8r9tbnplsd349pg67.apps.googleusercontent.com","xkKsMIciJfOHsffVw-phjC4e", {
    :authorize_url => 'https://accounts.google.com/o/oauth2/auth',
    :token_url => 'https://accounts.google.com/o/oauth2/token'
  })








end
