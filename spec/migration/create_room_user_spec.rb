require 'spec_helper'
# type test 1
require_migration!
require_migration!('create_room_user')

RSpec.describe CreateRoomsUser do
  it 'migrates successfully' do
    # ... pre-migration expectations
  
    migrate!
  
    # ... post-migration expectations
  end
end

# type test 2
#require Rails.root.join(
#  'db',
#  'migrate',
#  '20211204100620_create_rooms_users'
#)

#describe CreateRoomsUsers do
#  subject(:migration) { described_class.new }

#  it 'creates room user' do
#    create_list :ad_account, 3, identity_id: create(:identity).id

#    expect { suppress_output { migration.up } }
#      .to change { IdentitiesAdAccount.count }.from(0).to(3)
#  end
#end

#type test 3
#describe CreateRommUser do
#  it { should have_column :room, :type => :string }
#  it { should have_column :user, :type => :string }
#  it { should validate_presence_of :name}       
#end