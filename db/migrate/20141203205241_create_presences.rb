class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.belongs_to :user, index: true
      t.belongs_to :picture, index: true

      t.timestamps
    end
  end
end
