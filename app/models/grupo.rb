class Grupo < ActiveRecord::Base
    #attr_accessible :nome
    has_many :grupo_emails
    accepts_nested_attributes_for :grupo_emails, allow_destroy: true
end
