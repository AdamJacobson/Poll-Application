class Response < ApplicationRecord
  validates :answer_choice_id, :user_id, presence: true
  validate :not_duplicate_response
  validate :not_own_poll

  def not_duplicate_response
    if respondent_already_answered?
      errors[:user] << "has already answered question"
    end
  end

  def not_own_poll
    if own_poll?
      errors[:user] << "cannot answer their own question"
    end
  end

  def sibling_responses
    # self.question.responses.where.not("responses.id = ?", self.id)
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: respondent.id)
  end

  def own_poll?
    self.question.poll.author.id == respondent.id
  end

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question

end
