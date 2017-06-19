class User < ApplicationRecord
  belongs_to :team, required: false
  has_many :chores
  has_many :categories, through: :chores

  def team_attributes=(team_attributes)
    team = Team.find_or_create_by(team_attributes)
    self.build_team(team_attributes)
    self.save
  end
end

<h2>Sign up</h2>

<%= form_for(resource, as: resource_name, url: registration_path(resource_name)) do |f| %>
  <%= devise_error_messages! %>

    <%= f.fields_for :team, @user.build_team do |team| %>
    <div class="field">
      <%= team.label :name, 'Team' %><br />
      <%= team.text_field :name %>
    </div>
    <% end %>

  <div class="field">
    <%= f.label :email %><br />
    <%= f.email_field :email, autofocus: true %>
  </div>

  <div class="field">
    <%= f.label :password %>
    <% if @minimum_password_length %>
    <em>(<%= @minimum_password_length %> characters minimum)</em>
    <% end %><br />
    <%= f.password_field :password, autocomplete: "off" %>
  </div>

  <div class="field">
    <%= f.label :password_confirmation %><br />
    <%= f.password_field :password_confirmation, autocomplete: "off" %>
  </div>

  <div class="actions">
    <%= f.submit "Sign up" %>
  </div>
<% end %>

<%= render "devise/shared/links" %>
