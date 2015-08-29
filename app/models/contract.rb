class Contract < ActiveRecord::Base
  belongs_to :item
  belongs_to :owner, class_name: "User"
  belongs_to :renter, class_name: "User"
end
