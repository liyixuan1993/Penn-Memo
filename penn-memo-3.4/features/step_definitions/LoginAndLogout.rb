Given (/^I'm on the login page$/) do 
	visit '/users/sign_up'
	fill_in "Email", :with => "chenw4@seas.upenn.edu"
	fill_in "Password", :with => "1990525"
	fill_in "Password confirmation", :with => "1990525"
  	click_button "Sign up"
  	visit '/users/sign_out'	# logout url is ‘/users/sign_out’
	visit '/users/sign_in'
end

When (/^I login with every needed information$/) do
	fill_in "Email", :with => "chenw4@seas.upenn.edu"
	fill_in "Password", :with => "1990525"
  	click_button "Log in"
end

Then (/^I should be able to see the main page of my account$/) do
	expect(page).to have_content "Signed in successfully"
end

When (/^I log out$/) do
	visit '/users/sign_out'
end 

Then (/^I should return to the welcome page$/) do
	expect(page).to have_content "Welcome to Penn Memo"
end



