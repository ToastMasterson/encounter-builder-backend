class CreateMonsterEncounters < ActiveRecord::Migration[5.2]
  def change
    create_table :monster_encounters do |t|
      t.references :monster, foreign_key: true
      t.references :encounter, foreign_key: true

      t.timestamps
    end
  end
end
