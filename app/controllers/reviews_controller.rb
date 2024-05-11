class ReviewsController < ApplicationController

  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user, only: [:create, :edit, :update, :destroy]

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end
  def edit
    @review = Review.find_by id:(params[:id])
  end

  def update
    @review = Review.find_by id:(params[:id])
    if @review.update(review_params)
      redirect_to reviews_path
    else
      flash[:alert] = "Проблема"
      render :new
    end
  end

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to reviews_path
    else
      redirect_to reviews_path
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def authorize_user
    unless @review.user == current_user
      redirect_to reviews_path
    end
  end

  def authenticate_user
    unless current_user
      redirect_to new_session_path
    end
  end

  def review_params
    params.require(:review).permit(:body)
  end
end
