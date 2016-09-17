module Api::V1
  class TodosController < ApiController
    before_action :set_todo, only: [:show, :update, :destroy]

    # GET /todos
    def index

      @todos = Todo.all
      #todos = Todo.page(params[:page] ? params[:page][:number] : 1)
      render json: @todos
      #render json: todos, meta: pagination_meta(todos)
    end

    # GET /todos/1
    def show
      render json: @todo
    end

    # POST /todos
    def create
      @todo = Todo.new(todo_params)

      if @todo.save
        render json: @todo, status: :created
      else
        render json: @todo.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /todos/1
    def update
      if @todo.update(todo_params)
        render json: @todo
      else
        render json: @todo.errors, status: :unprocessable_entity
      end
    end

    # DELETE /todos/1
    def destroy
      @todo.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_todo
        @todo = Todo.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def todo_params
        params.require(:todo).permit(:title, :completed, :order)
      end

      def pagination_meta(object)
        {
          current_page: object.current_page,
          next_page: object.next_page,
          prev_page: object.previous_page,
          total_pages: object.total_pages,
          total_count: object.total_entries
        }
      end

  end
end
