class CreateInvites < ActiveRecord::Migration[7.0]
  def change
    create_table :invites do |t|
      t.belongs_to :event
      t.belongs_to :user

      t.timestamps
    end
  end
end
