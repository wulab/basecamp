class TasksController < ApplicationController
  def index
    @tickets = Ticket.order("created_at")
  end

  # TODO: Migrate actions from tickets controller to here.
  
end
