require 'open-uri'

class  GamesController < ApplicationController

  def new
  @letters = Array.new(10){('a'..'z').to_a.sample}
  end

  def score
  @word = params[:letters].split
  @word = params[:word].upcase
  @english_word = english_word?(@word)

  end

  private

  def valid_word?(word, letters)
  word.chars.all? do |letter|
    word.count(letter) <= letters.count(letter)
    end
  end
    def english_word?(word)
      response = URI.open("https://dictionary.lewagon.com/#{word}")
      json = JSON.parse(response.read)
      json['found']

    end
end
