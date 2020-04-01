class Api::Practice::PracticeController < ApplicationController
  def index
    id = ::Practice.first.id
    title = ::Practice.first.title
    description = ::Practice.first.description
    contents = child_values

    result_values = {
    id: id,
    title: title,
    description: description,
    contents: contents
    }

    render json: result_values
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

