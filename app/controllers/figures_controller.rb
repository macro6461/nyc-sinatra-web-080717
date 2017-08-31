
class FiguresController < ApplicationController

 get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

   erb :'/figures/edit'
  end

 get '/figures/new' do
    #trying to render new page form
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

 get '/figures/:id' do

   @figure = Figure.find(params[:id])

   erb :'figures/show'
  end

 post '/figures/:id' do
    @figure = Figure.find(params[:id])
      @figure.update(params[:figure])

   if !params[:figure][:title_ids].empty?

       @title = Title.create(name: params[:title])
        @figure.titles << @title
   end

   if !params[:figure][:landmark_ids].empty?

     @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
   end

   @figure.save
    redirect to "figures/#{@figure.id}"
  end

 get '/figures' do
    @figures = Figure.all

   #this is able to display all figs
    erb :'figures/index'
  end

 post '/figures' do

   @figure = Figure.create(params[:figure])

   if !params[:landmark].empty?

     @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
   end

   if !params[:title].empty?

   @title = Title.create(params[:title])
    @figure.titles << @title
   end

   redirect to "/figures/#{@figure.id}"
  end

end
