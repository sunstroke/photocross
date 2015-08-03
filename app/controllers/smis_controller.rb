# -*- encoding : utf-8 -*-
class SmisController < ApplicationController
  # GET /smis
  # GET /smis.xml
  def index
    @smis = Smi.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @smis }
    end
  end

  # GET /smis/1
  # GET /smis/1.xml
  def show
    @smi = Smi.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @smi }
    end
  end

  # GET /smis/new
  # GET /smis/new.xml
  def new
    @smi = Smi.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @smi }
    end
  end

  # GET /smis/1/edit
  def edit
    @smi = Smi.find(params[:id])
  end

  # POST /smis
  # POST /smis.xml
  def create
    @smi = Smi.new(params[:smi])

    respond_to do |format|
      if @smi.save
        flash[:notice] = 'Smi was successfully created.'
        format.html { redirect_to(@smi) }
        format.xml  { render :xml => @smi, :status => :created, :location => @smi }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @smi.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /smis/1
  # PUT /smis/1.xml
  def update
    @smi = Smi.find(params[:id])

    respond_to do |format|
      if @smi.update_attributes(params[:smi])
        flash[:notice] = 'Smi was successfully updated.'
        format.html { redirect_to(@smi) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @smi.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /smis/1
  # DELETE /smis/1.xml
  def destroy
    @smi = Smi.find(params[:id])
    @smi.destroy

    respond_to do |format|
      format.html { redirect_to(smis_url) }
      format.xml  { head :ok }
    end
  end
end
