module Api
  module Practice
    class PracticeController < ApplicationController
      def index
        practice = ::Practice.find(params[:id])
        id = practice.id
        title = practice.title
        description = practice.description
        contents = child_values

        result_values = {
          id: id,
          title: title,
          description: description,
          contents: contents
        }

        render json: result_values
      end

      def index3
        @practices = ::Practice.all
      end

      def image_show
        @images = Dir.glob("#{Rails.root}/app/assets/images/*")
        @images.map! do |image|
          File.basename(image)
        end
        render json: @images, status: :ok
      end

      def create
        practice = ::Practice.new(practice_params)
        if practice.save
          practice.eyecatch = practice_params[:image]
          render json: practice, status: :created
        else
          render json: { errors: practice.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        practice = ::Practice.find(params[:id])
        practice.update(practice_params)
        if practice.save
          render json: practice, status: :accepted
        else
          render json: { errors: practice.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        id_list = params[:id_list]
        begin
          id_list.each do |id|
            ::Practice.destroy id.to_i
          end
          render json: { message: 'destroy succeeded' }, status: :accepted
        rescue StandardError
          render json: { errors: 'error during destroy' }, status: :unprocessable_entity
        end
      end

      private

      def child_values
        [
          {
            name: 'jack',
            age: 100,
            introduction: 'he is jack'
          },
          {
            name: 'bob',
            age: 100,
            introduction: 'he is bob'
          }
        ]
      end

      def practice_params
        params.permit(:title, :description, :contents, :image)
      end
    end
  end
end
