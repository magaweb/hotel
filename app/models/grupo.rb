class Grupo < ActiveRecord::Base
    #attr_accessible :nome
    has_many :grupo_emails
    has_and_belongs_to_many :hotels
    accepts_nested_attributes_for :grupo_emails, allow_destroy: true
end
