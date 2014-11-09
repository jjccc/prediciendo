class PredictionsController < ApplicationController

  def index
    @paginable_predictions = Prediction.where(:is_pending => @is_pending_predictions_list).
                             order("created_at desc").
                             page(params[:page])
                             
    @predictions = PredictionDecorator.decorate_collection(@paginable_predictions, :context => { :is_admin => @is_admin })
  end
  
  def new
    @prediction = Prediction.new
    @authors = Author.order(:name).all
  end
  
  def create
    @prediction = Prediction.new(params[:prediction])
    if @prediction.save
      redirect_to author_path(@prediction.author), notice: "Se ha creado la nueva predicción <b>#{@prediction.description}</b>".html_safe and return
    else
      render action: "new"
    end
  end
  
  def edit
    @prediction = Prediction.find(params[:id])
    @authors = Author.order(:name).all
  end
  
  def update
    @prediction = Prediction.find(params[:id])
    @prediction.update_attributes(params[:prediction])
    redirect_to @prediction.author, notice: "#{@prediction.description} modificada correctamente." and return
  end
  
  def show
    @prediction = PredictionDecorator.decorate(Prediction.find(params[:id]))
    gon.url = @prediction.url
    gon.tweet = @prediction.tweet
  end
  
end
