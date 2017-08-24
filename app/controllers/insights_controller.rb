class InsightsController < ApplicationController
  def summary
    authorize current_user, :insight?
    @colors = [['#F5A29B', '#F9C7C3', '#FCE3E1'], ['#FBD1A2', '#FCDDBB', '#FDEEDD'], ['#FFE484', '#FFEDB0', '#FFF7DD'], ['#66CAAD', '#94DAC5', '#D1EFE6'], ['#87C7FF', '#B2DBFF', '#DEEFFF']]
  end

  def calls
    authorize current_user, :insight?
     @colors = [['#F5A29B', '#F9C7C3', '#FCE3E1'], ['#FBD1A2', '#FCDDBB', '#FDEEDD'], ['#FFE484', '#FFEDB0', '#FFF7DD'], ['#66CAAD', '#94DAC5', '#D1EFE6'], ['#87C7FF', '#B2DBFF', '#DEEFFF']]
  end

  def tickets
    authorize current_user, :insight?
     @colors = [['#F5A29B', '#F9C7C3', '#FCE3E1'], ['#FBD1A2', '#FCDDBB', '#FDEEDD'], ['#FFE484', '#FFEDB0', '#FFF7DD'], ['#66CAAD', '#94DAC5', '#D1EFE6'], ['#87C7FF', '#B2DBFF', '#DEEFFF']]

  end

  def users
    authorize current_user, :insight?
     @colors = [['#F5A29B', '#F9C7C3', '#FCE3E1'], ['#FBD1A2', '#FCDDBB', '#FDEEDD'], ['#FFE484', '#FFEDB0', '#FFF7DD'], ['#66CAAD', '#94DAC5', '#D1EFE6'], ['#87C7FF', '#B2DBFF', '#DEEFFF']]
  end

  def leaderboard
    authorize current_user, :insight?
     @colors = [['#F5A29B', '#F9C7C3', '#FCE3E1'], ['#FBD1A2', '#FCDDBB', '#FDEEDD'], ['#FFE484', '#FFEDB0', '#FFF7DD'], ['#66CAAD', '#94DAC5', '#D1EFE6'], ['#87C7FF', '#B2DBFF', '#DEEFFF']]
  end

  def mystats
    authorize current_user, :insight?
     @colors = [['#F5A29B', '#F9C7C3', '#FCE3E1'], ['#FBD1A2', '#FCDDBB', '#FDEEDD'], ['#FFE484', '#FFEDB0', '#FFF7DD'], ['#66CAAD', '#94DAC5', '#D1EFE6'], ['#87C7FF', '#B2DBFF', '#DEEFFF']]
  end
end
