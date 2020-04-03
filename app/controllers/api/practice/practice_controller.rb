class Api::Practice::PracticeController < ApplicationController
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


  private

  def child_values
    [
      {
        name: "jack",
        age: 100,
        introduction: "he is jack"
      },
      {
        name: "bob",
        age: 100,
        introduction: "he is bob"
      }
    ]
  end

end

