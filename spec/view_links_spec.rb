require './app/models/link'

feature "View links" do
  scenario "see a list of links on the links page" do
    Link.create(title: "Makers Academy", url: "http://www.makersacademy.com/" )
    visit "/links"
    expect(page).to have_link("Makers Academy")
  end
end
