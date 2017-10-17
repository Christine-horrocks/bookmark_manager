require 'capybara/rspec'
require_relative '../../lib/app'

feature 'display links' do

  scenario 'see a link to an internet webpage' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit ('/')

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content 'Makers Academy'
    end
  end
end
