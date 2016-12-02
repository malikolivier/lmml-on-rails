class AddFileToPhotographs < ActiveRecord::Migration[5.0]
  def change
      add_attachment :photographs, :picture
  end
end
