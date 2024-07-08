class Fighter < ApplicationRecord
  belongs_to :gym

  def self.only_true
    Fighter.where(active: :true)
  end
end