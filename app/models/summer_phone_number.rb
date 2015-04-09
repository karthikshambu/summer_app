class SummerPhoneNumber < ActiveRecord::Base
  attr_accessible :phone_number
  validates :phone_number, format: { with: /[0-9]{10}/,
    message: "Phone Number should be valid." }
  # validates :phone_number, length: { is: 10 }
end
