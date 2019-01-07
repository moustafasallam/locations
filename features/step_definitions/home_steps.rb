Given("query=") do
  @query = ""
end

When("I am on the homepage") do
  visit ("/?query=")
end

Then("result table should have column with title {string}") do |string|
  puts string
  expect(page).to have_content(string)
end