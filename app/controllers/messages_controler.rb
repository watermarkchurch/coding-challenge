class PagesController < ApplicationController
    def create
    end

    def edit
    end

    def destroy
    end

    private

        def message_params
            params.require(:message).permit(:content)
        end
  end
  