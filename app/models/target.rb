class Target < ActiveRecord::Base
  attr_accessible :name, :messages_attributes

  # this has to be done before target.update_attribs and target.where
  # so that we find the right target when we lookup by name
  # and we update it without adding spaces to the name
  auto_strip_attributes :name

  belongs_to :school

  has_many :messages, order: "created_at DESC", dependent: :destroy

  validates :name, presence: true # { message: "" }

  accepts_nested_attributes_for :messages, allow_destroy: true
end
