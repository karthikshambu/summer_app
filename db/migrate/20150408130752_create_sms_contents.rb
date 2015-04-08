class CreateSmsContents < ActiveRecord::Migration
  def change
    create_table :sms_contents do |t|
      t.text :content

      t.timestamps
    end
  end
end
