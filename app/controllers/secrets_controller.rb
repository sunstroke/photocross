# -*- encoding : utf-8 -*-
class SecretsController < ApplicationController
  # GET /secrets
  # GET /secrets.xml
  def index
    @secrets = Secret.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @secrets }
    end
  end

  # GET /secrets/1
  # GET /secrets/1.xml
  def show
    @secret = Secret.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @secret }
    end
  end

  # GET /secrets/new
  # GET /secrets/new.xml
  def new
    @secret = Secret.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @secret }
    end
  end

  # GET /secrets/1/edit
  def edit
    @secret = Secret.find(params[:id])
  end

  # POST /secrets
  # POST /secrets.xml
  def create
    @secret = Secret.new(params[:secret])

    respond_to do |format|
      if @secret.save
        flash[:notice] = 'Secret was successfully created.'
        format.html { redirect_to(@secret) }
        format.xml  { render :xml => @secret, :status => :created, :location => @secret }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @secret.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /secrets/1
  # PUT /secrets/1.xml
  def update
    @secret = Secret.find(params[:id])

    respond_to do |format|
      if @secret.update_attributes(params[:secret])
        flash[:notice] = 'Secret was successfully updated.'
        format.html { redirect_to(@secret) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @secret.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /secrets/1
  # DELETE /secrets/1.xml
  def destroy
    @secret = Secret.find(params[:id])
    @secret.destroy

    respond_to do |format|
      format.html { redirect_to(secrets_url) }
      format.xml  { head :ok }
    end
  end
end
