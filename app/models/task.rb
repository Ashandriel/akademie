class Task < ApplicationRecord
  has_many :task_articles
  has_many :users, :through => :task_articles
end