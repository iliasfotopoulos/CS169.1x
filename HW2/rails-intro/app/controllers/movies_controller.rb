class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.pluck(:rating).uniq

    #if session not initialized, initialize using defaults
    session[:sort] ||= "id"
    session[:ratings] ||= @all_ratings

    session[:sort] = params[:sort] unless params[:sort].nil?
    session[:ratings] = params[:ratings].keys unless (params[:ratings].nil? || params[:commit] != 'Refresh')

    @movies = Movie.where('rating IN (?)', session[:ratings]).order(session[:sort])

    if params[:sort].nil? || params[:ratings].nil?
      redirect_to movies_path(:sort => session[:sort], :ratings => session[:ratings])
    end

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
