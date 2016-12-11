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




Given (/^I'm on the main page of penn memo$/) do 
  create_admin
  sign_in
  # save_and_open_page
  visit '/memos/new'
  click_link 'Add Tag'
  fill_in 'Name', :with => "# 14th floor"
  click_button "Create Tag"
  visit(new_memo_path)
  fill_in 'Author', :with => "Wei-An"
  fill_in 'Title', :with => "project meeting"
  fill_in 'Content', :with => "Today we are going to have a project meeting about iteration1."
  click_button "Create Memo"
  click_link 'Back'
  visit '/memos'
  visit '/user_tags/new'
  click_button 'Create User tag'
  click_link 'Back'
  
end

When (/^I click on delete link of a certain memo$/) do
  
  expect(page).to have_content "project meeting"
	click_link 'Destroy'

end

Then (/^I should be able to see a successfully deleted memo message$/) do
  
	expect(page).to have_content "Memo was successfully destroyed"
	
	expect(page).to have_content "# 14th floor"

end