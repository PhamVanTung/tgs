class StaticPagesController < ApplicationController
  def home
  		@entry = Entry.new if logged_in?
  		@feed_all = Entry.paginate( page: params[:page], per_page: 10 )
  end

  def help
  end

  def about
  end

  def contact
  end
end
