class CreateStaticpages < ActiveRecord::Migration[5.2]
  def change
    create_table :staticpages do |t|

      t.timestamps
    end
  end
end
