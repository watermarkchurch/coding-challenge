class MessagesController < ApplicationController
    # before_action :correct_message, only: [:destroy]
    def new
        @message = Message.new
    end
    
    def create
        @message = Message.new(message_params)
        @message.thumbnail.attach(params[:message][:thumbnail])
        @message.video.attach(params[:message][:video])
        if @message.save
            reset_session
            flash[:success] = "Successfully added new message"
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
        @message = Message.find(params[:id])
    end

    def update
        @message = Message.find(params[:id])
        # @message.thumbnail.purge
        # @message.video.purge
        if @message.update(message_params)
            flash[:success] = "Message updated"
            redirect_to root_path
        else
            render 'edit'
        end
    end

    def destroy
        @message = Message.find(params[:id])
        @message.destroy
        flash[:success] = "Message deleted"
        redirect_to root_path 
        # if request.referrer.nil? || request.referrer == root_url
        #     redirect_to root_url
        # else
        #     redirect_to request.referrer
        # end
    end

    private

        def message_params
            params.require(:message).permit(:title, :content, :thumbnail, :video)
        end

        def correct_message
            @message = @messages.find_by(id: params[:id])
            redirect_to root_url if @message.nil?
        end
  end
  