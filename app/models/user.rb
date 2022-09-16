class User < ApplicationRecord
  include Clearance::User
  ROLES = %w[admin student].freeze
end
