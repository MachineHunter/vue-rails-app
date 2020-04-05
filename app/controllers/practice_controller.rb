class PracticeController < ApplicationController
  def index
  end

  def index2
    @title = "Practice3"
    @description = "Practice without api"
    @contents = get_contents
  end

  def index3
  end

  private

  def get_contents
    {
      outer_links: [
        {
          name: "Mary",
          text: "she is mary"
        },
        {
          name: "God",
          text: "oh my god!!!!"
        }
      ]
    }
  end
end
