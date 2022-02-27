RSpec.describe "Site", js: true do
  subject { page }

  context "without authenticating" do
    it "shows the navigation" do
      visit "/#/"
      expect(subject).to have_content "Microbrewers"
      expect(subject).to have_link "Shop"
      expect(subject).to have_link "Brauende"
      expect(subject).to have_link "Login"
      expect(subject).to have_link "Registrierung"
    end
  end
end
