class Cart < ApplicationRecord
  belongs_to :user
  has_many :items
  after_initialize :init

  def init
    self.total_amount  ||= 0.0
  end
end
