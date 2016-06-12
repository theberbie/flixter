class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, only: [:show]


  def show
  end

  private
  helper_method :current_lesson

  def require_authorized_for_current_course
     if !current_user && current_user.enrolled_in?(current_course) != true
        redirect_to course_path(current_course), alert: 'Please sign in or sign up for this course.'
    end
  end

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end