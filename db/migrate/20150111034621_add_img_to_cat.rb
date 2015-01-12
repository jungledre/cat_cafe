class AddImgToCat < ActiveRecord::Migration
  def change
    add_column :cats, :img, :string
  end
end
