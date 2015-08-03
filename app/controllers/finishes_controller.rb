# -*- encoding : utf-8 -*-
class FinishesController < ApplicationController
  # GET /finishes
  # GET /finishes.xml
  def index
    @finishes = Finish.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @finishes }
    end
  end

  # GET /finishes/1
  # GET /finishes/1.xml
  def show
    @finish = Finish.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @finish }
    end
  end

  # GET /finishes/new
  # GET /finishes/new.xml
  def new
    @finish = Finish.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @finish }
    end
  end

  # GET /finishes/1/edit
  def edit
    @finish = Finish.find(params[:id])
  end

  # POST /finishes
  # POST /finishes.xml
  def create
    @finish = Finish.new(params[:finish])

    respond_to do |format|
      if @finish.save
        flash[:notice] = 'Finish was successfully created.'
        format.html { redirect_to(@finish) }
        format.xml  { render :xml => @finish, :status => :created, :location => @finish }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @finish.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /finishes/1
  # PUT /finishes/1.xml
  def update
    @finish = Finish.find(params[:id])

    respond_to do |format|
      if @finish.update_attributes(params[:finish])
        flash[:notice] = 'Finish was successfully updated.'
        format.html { redirect_to(@finish) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @finish.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /finishes/1
  # DELETE /finishes/1.xml
  def destroy
    @finish = Finish.find(params[:id])
    @finish.destroy

    respond_to do |format|
      format.html { redirect_to(finishes_url) }
      format.xml  { head :ok }
    end
  end
end
