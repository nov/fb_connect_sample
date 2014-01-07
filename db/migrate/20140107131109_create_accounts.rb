class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :fb_uid
      t.timestamps
    end
  end
end
