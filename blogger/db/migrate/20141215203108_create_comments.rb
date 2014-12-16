class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author_name
      t.text :body
			#An article might have zero, five, or one hundred comments. But a comment only belongs to one article.  
			#the objects on the "many" end should have a foreign key referencing the "one" object. 
			#that foreign key should be titled with the name of the "one" object, then an underscore, then "id". 
      t.references :article, index: true

      t.timestamps
    end
  end
end
