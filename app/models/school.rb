class School < ActiveRecord::Base
  # TODO: normalize city, state, zipcode into address
  attr_accessible :city, :name, :state, :zipcode, :targets_attributes

  auto_strip_attributes :name

  has_many :targets, dependent: :destroy
  has_many :messages, through: :targets, order: "created_at DESC"

  accepts_nested_attributes_for :targets

  validates :name, presence: { message: "You must provide a school name." }
end