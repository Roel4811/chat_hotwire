class Message < ApplicationRecord
  belongs_to :room

  has_rich_text :content

  after_create_commit :broadcast_append_to_room
  after_update_commit :broadcast_replace_to_room
  after_destroy_commit :broadcast_remove_to_room

  private

  def broadcast_append_to_room
    room = self.room
    broadcast_append_to "room-#{room.id}" 
  end

  def broadcast_replace_to_room
    room = self.room
    broadcast_replace_to "room-#{room.id}" 
  end

  def broadcast_remove_to_room
    room = self.room
    broadcast_remove_to "room-#{room.id}" 
  end
end
