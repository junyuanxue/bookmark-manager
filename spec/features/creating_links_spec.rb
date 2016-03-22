

feature "Add links" do
  scenario "user can submit a new link" do
    visit "/links/new"
    fill_in(:title, with: "Makers Academy")
    fill_in(:url, with: "http://www.makersacademy.com/")
    click_button("add link")
    within "ul#links" do
      expect(page).to have_content("Makers Academy")
    end
  end
end
