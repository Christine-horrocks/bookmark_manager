
feature 'display tags' do

  scenario 'see a tag separate from a link' do
    Tag.create(tag: 'Pets')
    visit ('/links')

    expect(page.status_code).to eq 200

    within 'ul#tags' do
      expect(page).to have_content 'Pets'
    end
  end
end
