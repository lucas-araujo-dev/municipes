class CreateMunicipes < ActiveRecord::Migration[7.0]
  def change
    create_table :municipes do |t|
      t.string :full_name
      t.string :cpf, index: { unique: true }
      t.string :cns, index: { unique: true }
      t.string :email, index: { unique: true }
      t.date :birthdate
      t.string :phone
      t.string :picture
      t.string :status

      t.timestamps
    end
  end
end
