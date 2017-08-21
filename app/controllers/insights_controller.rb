class InsightsController < ApplicationController
  def summary
    authorize current_user, :insight?
  end
end
