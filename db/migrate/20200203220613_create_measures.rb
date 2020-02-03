class CreateMeasures < ActiveRecord::Migration[6.0]
  def change
    create_table :measures do |t|
      t.float :height
      t.float :weight
      t.float :bmi
      t.float :bicep
      t.float :chest
      t.float :waist
      t.float :hips
      t.float :thigh
      t.float :calf
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
