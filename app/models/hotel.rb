class Hotel < ActiveRecord::Base
  attachment :image
  has_many :room_categories, dependent: :destroy


  has_many :shares
  has_many :grupos,  :through => :shares

  #has_and_belongs_to_many :grupos


  cattr_accessor :current_user

  accepts_nested_attributes_for :grupos, :shares, allow_destroy: true

  accepts_nested_attributes_for :room_categories,  reject_if: proc { |attributes| attributes['name'].blank? }
  validates :name,
            presence: true



  def initialized_shares # this is the key method
    [].tap do |o|
      Grupo.find_by_sql(["

            select * from grupos where user_id = :user or id in(
                  select grupo_id from contatos_grupos where contato_id in (
                        select id from contatos where email = :email
                  )
             )
        ",{:email => Hotel.current_user.email, :user => Hotel.current_user}]).each do |grupo|
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