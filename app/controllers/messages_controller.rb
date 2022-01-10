class MessagesController < ApplicationController
    # before_action :correct_message, only: [:destroy]
    before_action :set_message, only: %i[ show edit update destroy ]
    def new
        @message = Message.new
    end

    def show
        @message = Message.find(params[:id])
        
        # respond_to do |format|
        #     format.html 
        #     format.xml {render :xml => @message}
        #     # format.json  {render :json => @message}
        # end
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

    def index
        params.each do |key,value|
            Rails.logger.warn "Param #{key}: #{value}"
            if key == "tag"
                @messages = Message.joins(:tags).where('tags.name' => value).group(:id)
            end
        end
        # @messages = Message.all
        # redirect_to controller: :tags, action: :show, :tag => 3
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

        # Use callbacks to share common setup or constraints between actions.
        def set_message
            @message = Message.find(params[:id])
        end

        def message_params
            params.require(:message).permit(:title, :content, :thumbnail, :video, :tag_list)
        end

        def correct_message
            @message = @messages.find_by(id: params[:id])
            redirect_to root_url if @message.nil?
        end
  end
  