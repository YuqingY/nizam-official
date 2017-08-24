class PagesController < ApplicationController
  def home
    if current_user.position == 'manager'
      redirect_to insights_path
    elsif current_user.position == 'csrep'
      redirect_to insights_leaderboard_path
    else
      redirect_to tickets_path
    end


  end
end
