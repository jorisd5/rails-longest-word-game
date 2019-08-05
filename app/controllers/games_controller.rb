class GamesController < ApplicationController
  require 'net/http'
  require 'json'
  def new
    @letters = ('A'..'Z').to_a.shuffle
    @letters_random = ''
  end

  def score
    @word = params[:word].split('')
    @generated_letters = params[:letters].split('')

    url = 'https://wagon-dictionary.herokuapp.com/' + params[:word]
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @response = JSON.parse(response)
  end
end
