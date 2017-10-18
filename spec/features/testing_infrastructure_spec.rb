require 'pry'

feature 'display links' do

  scenario 'see a link to an internet webpage' do
    binding.pry
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit ('/links')

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content 'Makers Academy'
    end
  end
end
