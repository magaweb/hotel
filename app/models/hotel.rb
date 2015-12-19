class Hotel < ActiveRecord::Base
  attachment :image
  has_many :room_categories, dependent: :destroy


  has_many :shares
  has_many :grupos,  :through => :shares

  #has_and_belongs_to_many :grupos




  accepts_nested_attributes_for :grupos, :shares, allow_destroy: true

  accepts_nested_attributes_for :room_categories,  reject_if: proc { |attributes| attributes['name'].blank? }
  validates :name,
            presence: true





  def initialized_shares # this is the key method
    [].tap do |o|
      Grupo.all.each do |grupo|
        if c = shares.find { |c| c.grupo_id == grupo.id }
          o << c.tap { |c| c.enable ||= true }
        else
          o << Share.new(:grupo_id => grupo.id)
        end
      end
    end
  end

  #attr_accessible :grupos_attributes
  def to_s
    name
  end
end