require 'rails_helper'

describe "As a Visitor" do
  it "I can see obituaries from database", :vcr do
    user = create(:user)
    obituary = create(:obituary, user_id: user.id)
    obituary2 = create(:obituary, user_id: user.id)

    visit '/'
    click_on "Recently Published"

    expect(current_path).to eq('/obituaries/recent')

  end
  it "I can see the recent obituaries from the api", :vcr do
    visit '/obituaries/recent'

    within(first("#obituary_by_name")) do
      expect(page).to have_css("#headline")
      headline = find("#headline").text
      expect(headline).not_to be_empty

      expect(page).to have_css("#abstract")
      abstract = find("#abstract").text
      expect(abstract).not_to be_empty

      expect(page).to have_css("#web_url")
      web_url = find("#web_url").text
      expect(web_url).not_to be_empty

      expect(page).to have_css("#pub_date")
      pub_date = find("#pub_date").text
      expect(pub_date).not_to be_empty

      expect(page).to have_css("#word_count")
      word_count = find("#word_count").text
      expect(word_count).not_to be_empty

      expect(page).to have_css("#image")
    end
  end
end
