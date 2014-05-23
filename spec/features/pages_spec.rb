require "spec_helper"


describe "Pages" do
  context "Landing page should render with correct content" do
    it "should render the correct landing page" do
      visit root_path
      expect(page).to have_content("Please search for an artist")
    end

    it "should have a field for the user to type in an artist" do
      visit root_path
      expect(page).to have_field("band")
    end
  end

  context "Landing page should allow a user to submit a search" do

    it "should render a flash error message if a user submits an empty search" do
      visit root_path
      click_on "Submit"
      expect(page).to have_content("Please actually type something in the search field. We can't raise this baby alone.")
    end

    context "a User submits valid search terms" do
      it "should render the search results page" do
        visit root_path
        fill_in "Band", with: "LCD Soundsystem"
        click_on "Submit"
        expect(page).to have_content("Concerts for LCD Soundsystem")
      end

      it "should render the most recent concerts from the setlist api by that artist" do
        visit root_path
        fill_in "Band", with: "LCD Soundsystem"
        click_on "Submit"
        expect(page).to have_content("April 2 2011, NYC Farewell Shows, Madison Square Garden, New York, New York")
      end
    end

  end

end