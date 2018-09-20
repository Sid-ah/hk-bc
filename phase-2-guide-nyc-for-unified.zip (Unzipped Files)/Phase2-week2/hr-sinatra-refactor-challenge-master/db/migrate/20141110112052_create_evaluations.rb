class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.belongs_to :position
      t.text :summary
      t.boolean :probation
    end
  end
end
