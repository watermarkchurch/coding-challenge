class TagsController < ApplicationController
    def show
        @tag = Tag.find(params[:id])
    end

    # def index
    #     @messages = Message.find_by(params[:tag:id])
    # end
end
