class Order < ActiveRecord::Base
  belongs_to :UserId
  belongs_to :AddressId
end
