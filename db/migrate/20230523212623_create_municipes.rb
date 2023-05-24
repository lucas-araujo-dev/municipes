class CreateMunicipes < ActiveRecord::Migration[7.0]
  def change
    create_table :municipes do |t|
      t.string :full_name, null: false
      t.string :cpf, index: { unique: true }, null: false
      t.string :cns, index: { unique: true }, null: false
      t.string :email, index: { unique: true }, null: false
      t.date :birthdate, null: false
      t.string :phone, null: false
      t.string :picture
      t.string :status, null: false, default: 'active'

      t.timestamps
    end
  end
end
