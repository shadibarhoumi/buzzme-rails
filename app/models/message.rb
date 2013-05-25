class Message < ActiveRecord::Base
  attr_accessible :body, :likes

  belongs_to :target

  validates :body, presence: true
  
  has_many :comments, dependent: :destroy
end
