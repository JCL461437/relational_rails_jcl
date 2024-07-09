class Gym < ApplicationRecord
  has_many :fighters

  def self.order_by_most_recently_created
    Gym.order(created_at: :desc)
  end
end