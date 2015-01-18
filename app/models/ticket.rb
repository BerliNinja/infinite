class Ticket < ActiveRecord::Base

  belongs_to :label


  validates :label, presence: true
  validates :title, presence: true

end