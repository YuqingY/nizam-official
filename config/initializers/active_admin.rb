def authenticate_admin!
  redirect_to new_user_session_path unless current_user && current_user.admin
end



ActiveAdmin.setup do |config|
  # == Site Title
  #
  # Set the title that is displayed on the main layout
  # for each of the active admin pages.
  #
#   config.namespace :admin do |admin|
#   admin.build_menu do |menu|
#     menu.add :label => 'Back to Home', :url => :root_path
#   end
# end

  config.site_title = "Nizam Energy"
  # [...]
  config.authentication_method = :authenticate_admin!
  # [...]
  config.current_user_method = :current_user
  # [...]
  config.logout_link_path = :root_path
  # [...]
  config.logout_link_method = :get

end
