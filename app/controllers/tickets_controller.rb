class TicketsController < ApplicationController

  before_action :authenticate_user!

  helper_method :collection

  def index
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_creation_params)
    if @ticket.save
      redirect_to @ticket, notice: 'ok!'
    else
      render :new
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update!(ticket_creation_params)
    redirect_to @ticket
  end

  def edit
    @ticket = Ticket.find(params[:id])
    @ticket.save!
  end

  protected

  def collection
    @tickets ||= Ticket.all
  end

  def ticket_creation_params
    permitted_params.merge({
      user_id: current_user.id,
      label_id: params.fetch(:ticket, {})[:label]
    })
  end

  def permitted_params
    params.require(:ticket).permit(:title, :description, :user_id, :label)
  end
end