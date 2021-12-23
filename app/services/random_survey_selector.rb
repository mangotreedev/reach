class RandomSurveySelector
  class << self
    def call(cookie)
      voted_surveys = Survey.joins(choices: :votes).where(choices: { votes: {cookie: cookie}})
      Survey.includes([:photo_attachment, :choices]).published.approved.where.not(id: voted_surveys.map(&:id)).with_choices.sample
    end
  end
end
