class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
     t.references :follower, foreign_key: { to_table: :end_users }
      t.references :followed, foreign_key: { to_table: :end_users }

      t.timestamps
    end
  end
end
