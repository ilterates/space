class ScoresController < ApplicationController



  def index
    @scores = Score.all.limit(20).order('user_score DESC')
    @users = @scores.find(params[user_id])
  end
  def new
    @score = Score.new

  end
  def create
    @user = current_user
    score_params = params.permit(:user_score)
    @score = Score.new(score_params)
    @score.save
    @user.scores << @score
    render :nothing => true
  end
end
