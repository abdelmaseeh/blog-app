require "rails_helper"

RSpec.feature "Ceating article" do
  scenario "A user creating new article" do
    visit "/"
    click_link "New Article"

    fill_in "Title", with: "Creating a blog"
    fill_in "Body", with: "This is a body"

    click_button "Create Article"

    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
  end

  scenario "A user fail to create article" do
    visit "/"
    click_link "New Article"

    fill_in "Title", with: "Creating a blog"
    fill_in "Body", with: "This is a body"

    click_button "Create Article"

    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")

  end
end
