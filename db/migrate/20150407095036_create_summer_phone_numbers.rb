class CreateSummerPhoneNumbers < ActiveRecord::Migration
  def change
    create_table :summer_phone_numbers do |t|
      t.string :phone_number

      t.timestamps
    end
  end
end
