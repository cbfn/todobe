class Todo < ApplicationRecord
  before_save :set_completed
  validates :title, presence: true, allow_blank: false

  self.per_page = 3

  def set_completed
    self.completed = false
  end
end
