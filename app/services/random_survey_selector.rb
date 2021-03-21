class RandomSurveySelector
  class << self
    def call(cookie)
      voted_surveys = Survey.joins(choices: :votes).where(choices: { votes: {cookie: cookie}})

      surveys = Survey.published.where.not(id: voted_surveys.map(&:id)).count
    end
  end
end
