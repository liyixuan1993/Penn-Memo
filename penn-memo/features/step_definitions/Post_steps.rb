Given (/^I'm on the add New Post page$/) do 
	visit(new_admin_path)
end

When (/^I add a new post$/) do
	fill_in 'Author', :with => "Wei-An"
	fill_in 'Title', :with => "project meeting"
	# fill_in 'date', :with => "2016-10-28"
	fill_in 'Tag', :with => "#CIS557"
	fill_in 'Content', :with => "Today we are going to have a project meeting about iteration1."
	click_button "Create Admin"
end

Then (/^I should be able to see a new post has been successfully created$/) do
	assert page.has_content?("Your post was successfully created.")
end

When (/^I add a new post without author$/) do
	# fill_in 'Author', :with => "Wei-An"
	fill_in 'Title', :with => "project meeting"
	# fill_in 'date', :with => "2016-10-28"
	fill_in 'Tag', :with => "#CIS557"
	fill_in 'Content', :with => "Today we are going to have a project meeting about iteration1."
	click_button "Create Admin"
end

Then (/^I can't create a new post without author$/) do
	assert page.has_content?("Author can't be blank")
end


When (/^I add a new post without title$/) do
	fill_in 'Author', :with => "Wei-An"
	# fill_in 'Title', :with => "project meeting"
	# fill_in 'date', :with => "2016-10-28"
	fill_in 'Tag', :with => "#CIS557"
	fill_in 'Content', :with => "Today we are going to have a project meeting about iteration1."
	click_button "Create Admin"
end

Then (/^I can't create a new post without title$/) do
	assert page.has_content?("Title can't be blank")
end


When (/^I add a new post without content$/) do
	fill_in 'Author', :with => "Wei-An"
	fill_in 'Title', :with => "project meeting"
	# fill_in 'date', :with => "2016-10-28"
	fill_in 'Tag', :with => "#CIS557"
	# fill_in 'Content', :with => "Today we are going to have a project meeting about iteration1."
	click_button "Create Admin"
end

Then (/^I can't create a new post without content$/) do
	assert page.has_content?("Content can't be blank")
end

When (/^I add a new post with content smaller than 10 characters$/) do
	fill_in 'Author', :with => "Yimeng"
	fill_in 'Title', :with => "Go to van pelt lib today"
	fill_in 'Tag', :with => "Dinner"
	fill_in 'Content', :with => "Hi"
	click_button "Create Admin"
end

Then (/^I can't create a new post$/) do 
	assert page.has_content?("minimum is 10 characters")
end


