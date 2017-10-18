feature "add a link" do
  scenario "user adds a link" do
    visit ('/links/new')
    fill_in :title, with: "Rogue Mallards"
    fill_in :url, with: "www.therouguestmallards.comp"
    click_button "Submit"
    expect(page).to have_current_path('/links')
    expect(page).to have_content("Rogue Mallards")
  end
  end
