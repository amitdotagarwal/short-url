# encoding: utf-8
When /^user visit the website$/ do
  visit root_path
end
Then /^I should see the welcome message$/ do
 step %{user visit the website}
 expect(page).to have_content("Shrink your links!")
end

When("I insert url and click on submit button") do
 step %{user visit the website}
 fill_in 'url_original_url', :with => 'google.com'
click_button('Shorten!')
end

Then("I should be able to see final show page") do
 page.should have_content('Your shortened URL is')
end