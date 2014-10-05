# -*- encoding: utf-8 -*-

class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :fetch_parameters, only: [:index]
  before_action :get_event, only: [:edit, :show, :update, :confirm]
  before_action :authorize_user!, only: [:edit, :update]

  def authorize_user!
    unless @event.user_profile.id == current_user.user_profile.id
      flash[:alert] = "Você deve ser dono desse evento para editá-lo."
      redirect_to event_path(@event)
    end
  end

  def get_event
    @event = Event.find(params[:id])
  end

  def fetch_parameters
    @category = params[:category]
    @price = params[:price]
  end

  # GET /
  def index
    @events = apply_filters Event.all
  end

  def apply_filters events
    events = events.with_category @category if @category
    events = events.within_price_range_of @price if @price
    events
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def show
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
    if @event.update_attributes(event_params)
      redirect_to @event
    else
      render "edit"
    end
  end

  def confirm
    unless @event.confirmed_guests.include? current_user.user_profile
      @event.confirmed_guests << current_user.user_profile
    end
    redirect_to @event
  end

  private

  def event_params
    params
      .require(:event)
      .permit(:title, :about, :category, :datetime, :price, :poster, :poster_cache)
  end
end
