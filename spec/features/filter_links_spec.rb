feature 'filtering links' do
  before(:each) do
    Link.create(url: 'www.makersacademy.com', title: "Makers Academy", tags: [Tag.first_or_create(tag: 'school')])
    Link.create(url: 'www.hamsterdance.com', title: "Hamster Dance", tags: [Tag.first_or_create(tag: 'animal')])
    Link.create(url: 'www.bubble.com', title: "Bubbles", tags: [Tag.first_or_create(tag: 'bubbles')])
    Link.create(url: 'www.evillaugh.com', title: "Mwahhh", tags: [Tag.first_or_create(tag: 'bubbles')])
  end

  scenario 'I can filter links using tags' do
    visit '/tags/bubbles'

    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content("Makers Academy")
      expect(page).not_to have_content("Hamster Dance")
      expect(page).to have_content("Bubbles")
      expect(page).to have_content("Mwahhh")
    end
  end
end
