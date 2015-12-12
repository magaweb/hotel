class Hotel < ActiveRecord::Base
  attachment :image
  has_many :room_categories, dependent: :destroy
  has_and_belongs_to_many :grupos
  accepts_nested_attributes_for :grupos, :room_categories,
                                reject_if: proc { |attributes| attributes['name'].blank? },
                                allow_destroy: true
  validates :name,
            presence: true

  #attr_accessible :grupos_attributes
  def to_s
    name
  end
end