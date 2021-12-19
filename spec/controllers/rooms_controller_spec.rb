require_relative '../../app/controllers/application_controller.rb'
require_relative '../../app/controllers/rooms_controller.rb'

RSpec.describe RoomsController, type: :controller do
    it '#new room' do
        @roomcontroller = RoomsController.new
        expect(@roomcontroller.new).to be_valid
    end
    it '#indexes room' do
        @roomcontroller = RoomsController.new
        expect(@roomcontroller.index).to eq Room.all
    end   
    it '#create room' do
        room = Room.create(name: "testRoom")
        expect(room.id).to eq 1
        expect(room.name).to eq "testRoom"
    end
    it '#update room' do
        room = Room.create(name: "testRoom")
        expect(room.update(name: "testRoom2")).to be_truthy
    end
end