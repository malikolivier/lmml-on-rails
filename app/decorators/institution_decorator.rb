class InstitutionDecorator < ApplicationDecorator
  def autopsy_room_address
    t('.autopsy_room_address', address: model.address,
                               autopsy_room: model.autopsy_room)
  end
end
