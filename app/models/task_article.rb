class TaskArticle < ApplicationRecord
  belongs_to :user
  belongs_to :task

  paginates_per 10

  default_scope { order(task_id: :desc)}  
end