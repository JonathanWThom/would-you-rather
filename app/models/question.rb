class Question < ActiveRecord::Base
  validates :content, :option_1, :option_2, :presence => true
  has_many :responses
end
