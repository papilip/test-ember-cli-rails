class CreatePlatforms < ActiveRecord::Migration[5.1]
  def change
    create_table :platforms do |t|
      t.string :name
      t.integer :licence
      t.string :api_key
      t.text :comment

      t.timestamps
    end
  end
end
