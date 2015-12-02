class RoomCategory < ActiveRecord::Base
  attachment :arquivo
  belongs_to :hotel
  validates :name,
            presence: true
  def to_s
    name
  end
end