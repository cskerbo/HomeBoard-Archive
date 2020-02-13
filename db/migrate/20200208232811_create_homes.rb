class CreateHomes < ActiveRecord::Migration[6.0]
  def change
    create_table :homes do |t|
      t.string :name
      t.integer :zip_code
      t.string :street
      t.string :city
      t.string :state
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
