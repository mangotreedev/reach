class RandomSurveySelector
  class << self
    def call(cookie)
      Survey.joins(choices: :votes)
    end
  end

  private
end
