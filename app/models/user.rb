class User < ActiveRecord::Base
  validates :user_name, :uniqueness => true, :presence => true

  has_many :authored_polls,
    class_name: 'Poll',
    foreign_key: :author_id,
    primary_key: :id

  has_many :responses,
    class_name: 'Response',
    foreign_key: :user_id,
    primary_key: :id



  has_many :answer_choice_responses

  def not_duplicate_response(question)
    question
  end


end
