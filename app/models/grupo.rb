class Grupo < ActiveRecord::Base
    #attr_accessible :nome
    has_many :grupo_emails #, -> { where(author_id: 1) }
    #has_and_belongs_to_many :hotels

    has_many :shares
    has_many :hotels, :through => :shares


    accepts_nested_attributes_for :grupo_emails, :shares, allow_destroy: true
end
