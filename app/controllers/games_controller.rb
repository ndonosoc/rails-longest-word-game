class GamesController < ApplicationController
  # metodo que me devuelva un string de 9 letras RANDOM
  def generate_code
    charset = Array('A'..'Z')
    Array.new(9) { charset.sample }.join
  end

  def question
    @code = generate_code
    @starting_time = Time.now.to_i
  end

  def answer
    @answer = params[:answer]
    @starting_time = params[:startingtime].to_i
    @length = @answer.length
    # length = (Scrapear el value de length del url)
    @ending_time = Time.now.to_i
    @total_time = @ending_time - @starting_time
    @score = @total_time / @length
    @return = if @score < 5 && english_word?(@answer)
                'Well done!'
              elsif @score < 10 && english_word?(@answer)
                'There is room for improvement, try again!'
              else
                'You should try again!'
              end
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end
end
