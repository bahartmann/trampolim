#given
Given(/^I do not exist as a user$/) do
  create_visitor
  delete_user
end

Given(/^I exist as a user$/) do
  create_user
end

Given(/^I am not logged in$/) do
  visit '/users/sign_out'
end

Given(/^I am logged in$/) do
  create_user
  sign_in
end

#when
When(/^I sign in with valid credentials$/) do
  create_visitor
  sign_in
end

When(/^I return to the site$/) do
  visit '/'
end

When(/^I sign in with a wrong email$/) do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When(/^I sign in with a wrong password$/) do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When(/^I sign out$/) do
  visit '/users/sign_out'
end

When(/^I sign up with valid user data$/) do
  create_visitor
  sign_up
end

When(/^I sign up with an invalid email$/) do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end

When(/^I sign up without a password$/) do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  sign_up
end

When(/^I sign up without a password confirmation$/) do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When(/^I sign up with a mismatched password confirmation$/) do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "changeme123")
  sign_up
end

When(/^I edit my account details with valid data$/) do
  click_link "Alterar Conta"
  fill_in "user_email", with: "newemail@mail.com"
  fill_in "user_current_password", with: @visitor[:password]
  click_button "Atualizar"
end

When(/^I edit my profile details with valid data$/) do
  click_link "Alterar Perfil"
  fill_in "user_profile_name", with: "New Name"
  fill_in "user_profile_about", with: "Curabitur dignissim non enim quis mollis."
  click_button "Atualizar Perfil"
end

#then
Then(/^I see an invalid login message$/) do
  expect(page).to have_content "Email ou senha inválidos."
end

Then(/^I should be signed out$/) do
  page.should have_content "Entrar"
  page.should_not have_content "Conta"
end

Then(/^I see a successful sign in message$/) do
  page.should have_content "Logado com sucesso."
end

Then(/^I should be signed in$/) do
  page.should have_content "Conta"
  page.should_not have_content "Entrar"
end

Then(/^I should see a signed out message$/) do
  page.should have_content "Saiu com sucesso."
end

Then(/^I should see a successful sign up message$/) do
  page.should have_content "Bem-vindo! Você se registrou com sucesso."
end

Then(/^I should see an invalid email message$/) do
  page.should have_content "Email não é válido"
end

Then(/^I should see a missing password message$/) do
  page.should have_content "Senha não pode ficar em branco"
end

Then(/^I should see a missing password confirmation message$/) do
  page.should have_content "Confirmação de senha não é igual a Senha"
end

Then(/^I should see a mismatched password message$/) do
  page.should have_content "Confirmação de senha não é igual a Senha"
end

Then(/^I should see an account edited message$/) do
  page.should have_content "Você atualizou sua conta com sucesso."
end

Then(/^I should see the new profile data$/) do
  page.should have_content "New Name"
  page.should have_content "Curabitur dignissim non enim quis mollis."
end

def create_visitor
  @visitor ||= { :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
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

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  click_button "Cadastrar"
  find_user
end

def sign_in
  visit '/users/sign_in'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  click_button "Entrar"
end