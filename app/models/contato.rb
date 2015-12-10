class Contato < ActiveRecord::Base
  attr_accessible :nome
  has_and_belongs_to_many :grupos
end

