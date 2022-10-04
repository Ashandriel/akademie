class User < ApplicationRecord
  include Clearance::User
  ROLES = %w[admin student].freeze
  has_many :task_articles
  has_many :tasks, :through => :task_articles
end
