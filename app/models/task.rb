class Task < ApplicationRecord
  belongs_to :project

  def completed?
    !completed_at.blank?
  end
  
end
