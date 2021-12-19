# frozen_string_literal: true
require 'spec_helper'
# type test 1
#require Rails.root.join('db', 'migrate', '20211204100620_create_rooms_users.rb')
#File.join(Rails.root, 'db/migrate/20211204100620_create_rooms_users')
#require "./db/migrate/20211204100620_create_rooms_users"
require Rails.root.join(*%w( db migrate 20211204100620_create_rooms_users.rb))

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