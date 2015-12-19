class Share < ActiveRecord::Base
    belongs_to :hotel
    belongs_to :grupo

   #accepts_nested_attributes_for :grupo, :hotel

   validates_presence_of :hotel
   validates_presence_of :grupo

   attr_accessor :enable

end
