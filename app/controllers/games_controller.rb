require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = (0...10).map { ('a'..'z').to_a.sample }
  end

  def score
    raise
    @score = params[:word]
    @letters = params[:letters]
    @english_word = english_word?(params[:word])
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
