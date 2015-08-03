# -*- encoding : utf-8 -*-
class PressrelisesController < ApplicationController
  # GET /pressrelises
  # GET /pressrelises.xml
  def index
    @pressrelises = Pressrelise.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pressrelises }
    end
  end

  # GET /pressrelises/1
  # GET /pressrelises/1.xml
  def show
    @pressrelise = Pressrelise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pressrelise }
    end
  end

  # GET /pressrelises/new
  # GET /pressrelises/new.xml
  def new
    @pressrelise = Pressrelise.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pressrelise }
    end
  end

  # GET /pressrelises/1/edit
  def edit
    @pressrelise = Pressrelise.find(params[:id])
  end

  # POST /pressrelises
  # POST /pressrelises.xml
  def create
    @pressrelise = Pressrelise.new(params[:pressrelise])

    respond_to do |format|
      if @pressrelise.save
        flash[:notice] = 'Pressrelise was successfully created.'
        format.html { redirect_to(@pressrelise) }
        format.xml  { render :xml => @pressrelise, :status => :created, :location => @pressrelise }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pressrelise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pressrelises/1
  # PUT /pressrelises/1.xml
  def update
    @pressrelise = Pressrelise.find(params[:id])

    respond_to do |format|
      if @pressrelise.update_attributes(params[:pressrelise])
        flash[:notice] = 'Pressrelise was successfully updated.'
        format.html { redirect_to(@pressrelise) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pressrelise.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pressrelises/1
  # DELETE /pressrelises/1.xml
  def destroy
    @pressrelise = Pressrelise.find(params[:id])
    @pressrelise.destroy

    respond_to do |format|
      format.html { redirect_to(pressrelises_url) }
      format.xml  { head :ok }
    end
  end
end
