class RequestsController < ApplicationController

    def index
        @requests = Request.all
    end

    def show
        @request = Request.find(params[:id])
    end

    def new
        @request = Request.new
    end

    def create
        @request = Request.new(request_params)
        @request.save
        redirect_to request_path(@request)
    end

    def edit
        @request = Request.find_by(id: params[:id])
    end

    def update
        @request = Request.find_by(id: params[:id])
        @request.update(request_params)
        redirect_to request_path(@request)
    end

    def destroy
        @request = Request.find_by(id: params[:id])
        @request.destroy
        redirect_to requests_path, alert: "Feature request deleted!"
    end


    private

    def request_params
        params.require(:request).permit(:name, :description, :category_id, :creator_id)
    end


end