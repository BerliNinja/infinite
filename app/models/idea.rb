class Idea < ActiveRecord::Base

  belongs_to :category
  belongs_to :user
  belongs_to :label

  validates :title, presence: true
  validates :category, presence: true
  validates :label, presence: true

end