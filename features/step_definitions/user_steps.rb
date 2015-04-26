# Given(/^I press 'Sign up with Facebook'$/) do
#   pending # express the regexp above with the code you wish you had
# end

When(/^I fill in "(.*?)" with "(.*?)" and "(.*?)" with "(.*?)"$/) do |arg1, arg2, arg3, arg4|
  temp = User.find_by_id(arg1)
  assert temp.password
end


# When(/^I press 'Login'$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Given(/^I press 'Logout'$/) do
#   pending # express the regexp above with the code you wish you had
# end
