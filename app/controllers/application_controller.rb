class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_message
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_message

    private

    def record_not_found_message(instance)
        render json: {errors: instance.message}, status: 404
    end

    def record_invalid_message(instance)
        render json: {errors: instance.message}, status: 422
    end
end
