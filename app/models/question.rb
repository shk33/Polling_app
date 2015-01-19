class Question < ActiveRecord::Base
  has_many :possible_answers
  belongs_to :poll
  accepts_nested_attributes_for :possible_answers, reject_if: proc { |attributes| attributes['title'].blank? }
end
