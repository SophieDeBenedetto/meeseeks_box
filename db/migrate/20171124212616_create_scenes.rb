class CreateScenes < ActiveRecord::Migration[5.0]
  def change
    create_table :scenes do |t|
      t.string :season
      t.string :episode
      t.string :title
      t.string :dialogue
    end
  end
end
