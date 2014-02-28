class CreateCrms < ActiveRecord::Migration
  def change
    create_table :crms do |t|
      t.string :title
      t.string :summary
      t.integer :rating

      t.timestamps
    end
  end
end
