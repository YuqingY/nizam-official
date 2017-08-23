class InsightsController < ApplicationController
  def summary
    authorize current_user, :insight?
  end

  def calls
    authorize current_user, :insight?
  end

  def tickets
    authorize current_user, :insight?
  end

  def users
    authorize current_user, :insight?
  end

end
