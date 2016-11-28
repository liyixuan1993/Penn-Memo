Given (/^I'm on the sign up page$/) do 
	visit '/users/sign_up'
	
end

When (/^I sign up with every needed information$/) do
	fill_in "Email", :with => "chenw4@seas.upenn.edu"
	fill_in "Password", :with => "1990525"
	fill_in "Password confirmation", :with => "1990525"
  	click_button "Sign up"
end

Then (/^I should be able to create a new normal account$/) do
	expect(page).to have_content "Welcome! You have signed up successfully."
	# page.should have_content "Welcome! You have signed up successfully."
end


When (/^I sign up with wrong passwords$/) do
	fill_in "Email", :with => "chenw4@seas.upenn.edu"
	fill_in "Password", :with => "1990525"
	fill_in "Password confirmation", :with => "1990"
  	click_button "Sign up"
end

Then (/^I should not be able to create a new normal account$/) do
	expect(page).to have_content "Password confirmation doesn't match Password"
	# page.should have_content "Password confirmation doesn't match Password"
end

When (/^I sign up without Email$/) do
	# fill_in "Email", :with => "chenw4@seas.upenn.edu"
	fill_in "Password", :with => "1990525"
	fill_in "Password confirmation", :with => "1990525"
  	click_button "Sign up"
end

Then (/^I should not be able to create a new normal account without Email$/) do
	expect(page).to have_content "Email can't be blank"
	# page.should have_content "Email can't be blank"
end



