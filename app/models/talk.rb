class Talk < ActiveRecord::Base
  validates :title, :date, presence: true, uniqueness: true
end
