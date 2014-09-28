# -*- encoding: utf-8 -*-

class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_filter :fetch_category

  def fetch_category
    @category = params[:category]
  end

  # GET /
  def index
    if (@category)
      @events = Event.category(@category)
    else
      @events = Event.all
    end
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.user_profile = current_user.profile
    if @event.save
      redirect_to @event
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render "new"
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to @event
    else
      render "edit"
    end
  end

  private

  def event_params
    params
      .require(:event)
      .permit(:title, :about, :category, :datetime, :price, :poster, :poster_cache)
  end

end