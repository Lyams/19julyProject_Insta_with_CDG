class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :commentary

      t.timestamps
    end
  end
end
