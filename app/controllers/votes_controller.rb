class VotesController < ApplicationController

    before_action :has_voted?, only: [:new, :create]
    def new
        create
        redirect_to requests_path
    end

    def create
        vote = Vote.new(vote_params)
        vote.user_id = current_user.id
        vote.save
    end

    private

    def vote_params
        params.permit(:vote_type, :user_id, :request_id)
    end

    def has_voted?
        if Vote.where(user_id: current_user.id, request_id: params[:request_id]).any?
            redirect_to requests_path, alert: "You have already voted on this feature request!"
        end
    end


end