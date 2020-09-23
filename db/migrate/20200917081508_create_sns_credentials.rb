class CreateSnsCredentials < ActiveRecord::Migration[6.0]
  def change
    create_table :sns_credentials do |t|
      t.string :provider, null: false
      t.string :uid, null: false  # uid(略: user id)とは、ユーザーを識別するIDのこと
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
