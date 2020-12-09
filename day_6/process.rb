require_relative 'passenger_answers'

answers = PassengerAnswers.new('input')
puts answers.answers_by_group.sum(&:count)
puts answers.unanimous_answers_by_group.sum(&:count)
