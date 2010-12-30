# debug steps
Given /^show me the page$/ do
  save_and_open_page
end

# customs steps
Given /^I am on the index page$/ do
  visit('/')
end

Given /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, text|
  fill_in field, :with => text
end

Given /^a user "([^"]*)" with password "([^"]*)" exists$/ do |user, password|
  unless user.nil? or user.empty? or password.nil? or password.empty?
    visit "/"
    click_link "Signup"
    fill_in "name", :with => user
    fill_in "password", :with => password
    click_button "Signup"
    click_link "Logout?"
  end
end

When /^I click "([^"]*)"$/ do |button_text|
  click_button button_text
end

When /^(?:|I )follow "([^"]*)"(?: within "([^"]*)")?$/ do |link, selector|
  with_scope(selector) do
    click_link(link)
  end
end

Then /^I should see "([^"]*)"$/ do |text|
  page.has_content? text
end

