class AddAttachmentColumnsToCard < ActiveRecord::Migration[5.0]
  def up
  add_attachment :cards, :image
end

def down
  remove_attachment :cards, :image
end
end
