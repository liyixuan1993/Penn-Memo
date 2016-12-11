### UTILITY METHODS ###

def create_visitor
  @visitor ||= { :name => "Wei-An Chen", :email => "chenw4@seas.upenn.edu",
    :password => "1990525", :password_confirmation => "1990525" }
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, @visitor)
end

def create_admin
  create_visitor
  delete_user
  @user = FactoryGirl.create(:admin, @visitor)
end	


def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "user_name", :with => @visitor[:name]
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  find_user
end

def sign_in
  visit '/users/sign_in'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  click_button "Log in"
end


Given (/^I'm on the add New Tag page$/) do 
	create_admin
	sign_in
	expect(page).to have_content "Signed in successfully"
	# save_and_open_page
	visit '/memos/new'
	click_link 'Add Tag'
	# visit 'tags/new'
end

When (/^I add a new Tag$/) do
	
	fill_in 'Name', :with => "# 14th floor"
	click_button "Create Tag"

end

Then (/^I should be able to see a successfully created tag message$/) do
	expect(page).to have_content "Tag was successfully created"
	
	expect(page).to have_content "# 14th floor"

end

Then (/^I can choose the tag exists in the new memo creation page$/) do 
	click_link('Edit')
end

Given (/^I'm on the add new post page$/) do 
	create_admin
	sign_in
	expect(page).to have_content "Signed in successfully"
	visit 'tags/new'
	fill_in 'Name', :with => "# 14th floor"
	click_button "Create Tag"
end


When (/^I add a new post$/) do
	visit(new_memo_path)
	fill_in 'Author', :with => "Wei-An"
	fill_in 'Title', :with => "project meeting"
	fill_in 'Content', :with => "Today we are going to have a project meeting about iteration1."
	click_button "Create Memo"
end

Then (/^I create a new post successfully$/) do
	expect(page).to have_content "Memo was successfully created"
end


When (/^I add a new post without author$/) do
	visit(new_memo_path)
	fill_in 'Title', :with => "project meeting"
	fill_in 'Content', :with => "Today we are going to have a project meeting about iteration1."
	click_button "Create Memo"

end

Then (/^I can't create a new post without author$/) do
	expect(page).to have_content "Author can't be blank"
	# page.should have_content "Author can't be blank"
end


When (/^I add a new priority post$/) do
	visit(new_memo_path)
	check('Priority') # check in checkbox
	fill_in 'Author', :with => "Wei-An"
	fill_in 'Title', :with => "project meeting"
	fill_in 'Content', :with => "Today we are going to have a project meeting about iteration1."
	click_button "Create Memo"

end

Then (/^I should be able to see a priority post$/) do
	click_link 'Back'
	expect(page).to have_content "Priority Memos"
	# page.should have_content "Priority Memos"

end

Given (/^I'm on the add comment page$/) do 
	  create_admin
	  sign_in
	  visit '/memos/new'
	  click_link 'Add Tag'
	  fill_in 'Name', :with => "# 14th floor"
	  click_button "Create Tag"
	  visit(new_memo_path)
	  fill_in 'Author', :with => "Wei-An"
	  fill_in 'Title', :with => "project meeting"
	  fill_in 'Content', :with => "Today we are going to have a project meeting about iteration1."
	  check('Priority')
	  click_button "Create Memo"
	  click_link 'Back'
	  visit '/memos'
	  visit '/user_tags/new'
	  click_button 'Create User tag'
	  click_link 'Back'
	  click_button 'you have 1 priority memos'
end

When (/^I respond to a memo$/) do
	
	click_link 'Show'
	fill_in 'Content', :with => 'Good Morning Everyone'
	click_button 'Create Response'

end

Then (/^I should be able to see a successfully created response message$/) do
	expect(page).to have_content "User1 : Good Morning Everyone"
end

Given (/^I'm on the edit response page$/) do 
	  create_admin
	  sign_in
	  visit '/memos/new'
	  click_link 'Add Tag'
	  fill_in 'Name', :with => "# 14th floor"
	  click_button "Create Tag"
	  visit(new_memo_path)
	  fill_in 'Author', :with => "Wei-An"
	  fill_in 'Title', :with => "project meeting"
	  fill_in 'Content', :with => "Today we are going to have a project meeting about iteration1."
	  check('Priority')
	  click_button "Create Memo"
	  click_link 'Back'
	  visit '/memos'
	  visit '/user_tags/new'
	  click_button 'Create User tag'
	  click_link 'Back'
	  click_button 'you have 1 priority memos'
	  click_link 'Show'
	  fill_in 'Content', :with => 'Good Morning Everyone'
	  click_button 'Create Response'
	  click_link 'Back'
	  visit '/memos'
end

When (/^I edit a certain response$/) do
	visit '/responses'
	click_link 'Show'
	click_link 'Edit'
	fill_in 'Content', :with => 'Hi there. What is the time?'
	click_button 'Update Response'

end

Then (/^I should be able to update the response$/) do
	expect(page).to have_content "Response was successfully updated"
	expect(page).to have_content "Hi there. What is the time?"
end


