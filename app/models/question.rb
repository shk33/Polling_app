class Question < ActiveRecord::Base
  has_many :possible_answers
  has_many :answers
  belongs_to :poll
  accepts_nested_attributes_for :possible_answers, reject_if: proc { |attributes| attributes['title'].blank? }

  def serialize_for_graph
    PollSerializer.answers_per_question(self).to_json
  end

end
