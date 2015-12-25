class Share < ActiveRecord::Base
    belongs_to :hotel
    belongs_to :grupo

   #accepts_nested_attributes_for :grupo, :hotel


   attr_accessor :enable

end
