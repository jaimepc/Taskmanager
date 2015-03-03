class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      # t.string :email JP: Se comentarea porque ya esto lo hace el devise, se usa rake db:rollback STEP=2

      t.timestamps
    end
  end
end
