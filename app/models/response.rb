class Response < ActiveRecord::Base
  validates :user_id, :answer_choice_id, :presence => true
  validates :user_id, uniqueness: { scope: :answer_choice_id }
  validate :not_duplicate_response
  validate :illegal_respondent

  belongs_to :respondent,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id

  belongs_to :answer_choice,
    class_name: 'AnswerChoice',
    foreign_key: :answer_choice_id,
    primary_key: :id

  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll

  private

  def respondent_authored_this_poll?
    question.poll.author_id == user_id
  end

  def illegal_respondent
    if respondent_authored_this_poll?
      errors[:user_id] << "Can't answer your own poll, dumbass. "
    end
  end

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: user_id)
  end

  def not_duplicate_response
    if respondent_already_answered?
      errors[:user_id] << "Respondent already answered, dumbass. "
    end
  end

end
