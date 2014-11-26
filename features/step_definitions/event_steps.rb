#given
Given (/^I have no events$/) do
  Event.delete_all
end

Given (/^I have an event$/) do
  create_event 'Evento Antigo'
end

#when
When (/^I create a new event$/) do
  create_event 'Super Show!!'
end

When (/^I update the event$/) do
  visit "/"
  find('.event-title h3', text: 'Evento Antigo').click
  fill_basic_event 'Novo Evento'
  click_button 'Atualizar Evento'
end

#then
Then (/^I should see the new event page$/) do
  page.should have_content "Super Show!!"
  page.should have_content "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
end

And (/^I should see the event in index page$/) do
  visit '/'
  page.should have_content "Super Show!!"
end

Then (/^I should see the event page with new data$/) do
  page.should have_content "Novo Evento"
end

def create_event title
  visit '/events/new'
  fill_basic_event title
  click_button 'Criar Evento'
end

def fill_basic_event title
  fill_in "event_title", with: title
  select "concert", from: 'event[category]'
  fill_in "event_datetime", with: '14/11/27 03:00'
  find(:xpath, "//input[@id='event_datetime']").click
  
  fill_in "event_about", with: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
end
