class MessagesController < ApplicationController
    def new
        @message = Message.new
    end
    
    def create
        @message = Message.new(message_params)
        if @message.save
            reset_session
            flash[:success] = "Successfully added new message"
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
    end

    def destroy
    end

    private

        def message_params
            params.require(:message).permit(:title, :content)
        end
  end
  