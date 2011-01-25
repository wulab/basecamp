class TicketsController < ApplicationController
  # GET /tickets
  # GET /tickets.xml
  def index
    @tickets = Ticket.order(:created_at).reverse

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tickets }
    end
  end

  # GET /tickets/admin
  def admin
    @tickets = Ticket.all
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /tickets/1
  # GET /tickets/1.xml
  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.xml
  def new
    @task = Task.find(params[:task_id])
    @ticket = Ticket.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.xml
  def create
    @task = Task.find(params[:task_id])
    @ticket = @task.tickets.build(params[:ticket])
    
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to(params[:redirect_to] || :back, :notice => 'Ticket was successfully created.') }
        format.js   { @current_ticket = @ticket }
        format.xml  { render :xml => @ticket, :status => :created, :location => @ticket }
      else
        format.html { redirect_to(params[:redirect_to] || :back) }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.xml
  def update
    @ticket = Ticket.find(params[:id])
    
    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to(params[:redirect_to] || :back, :notice => 'Ticket was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.xml
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    
    respond_to do |format|
      if request.referer.end_with?(ticket_path(@ticket))
        # request comes from 'show' action, can't redirect back
        format.html { redirect_to(params[:redirect_to] || tickets_path) }
        format.xml  { head :ok }        
      else
        format.html { redirect_to(params[:redirect_to] || :back) }
        format.xml  { head :ok }        
      end
    end
  end
end
