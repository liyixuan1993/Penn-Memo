Given (/^I'm on the sign up page$/) do 
	visit(new_user_registration_path)
end

When (/^I sign up$/) do
	fill_in 'Email', :with => "test@gmail.com"
	fill_in 'Password', :with => "1234567"
	fill_in 'Password confirmation', :with => "1234567"
	click_button "Sign up"
end

Then (/^I should be able to create a new account$/) do
	assert page.has_content?("Welcome! You have signed up successfully.")
end



