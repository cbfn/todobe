class Todo < ApplicationRecord
  before_save :set_completed

  def set_completed
    self.completed = false
  end
end
