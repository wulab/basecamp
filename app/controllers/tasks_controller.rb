class TasksController < ApplicationController
  def index
    @tickets = Ticket.order("created_at desc")
  end

end