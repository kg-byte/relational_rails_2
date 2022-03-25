class CreateDentists < ActiveRecord::Migration[5.2]
  def change
    create_table :dentists do |t|
      t.string :name
      t.integer :max_patient_capacity
      t.boolean :accepting_new_patient
      t.string :hours
      t.float :rating

      t.timestamps
    end
  end
end
