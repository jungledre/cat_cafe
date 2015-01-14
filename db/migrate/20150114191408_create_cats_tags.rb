class CreateCatsTags < ActiveRecord::Migration
  def change
    create_table :cats_tags do |t|
      t.references :cat, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
