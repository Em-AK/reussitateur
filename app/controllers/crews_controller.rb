class CrewsController < ApplicationController
  before_action :set_crew, only: [:show, :edit, :update, :destroy]

  def index
    @crews = Crew.all
  end

  def show
  end

  def new
    @crew = Crew.new
  end

  def create
    @crew = Crew.new(crew_params)
    if associate_sailors && @crew.save
      redirect_to @crew, notice: "L'équipage a bien été créé."
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if associate_sailors && @crew.update(crew_params)
      redirect_to @crew, notice: "L'équipage à bien été mis à jour."
    else
      render action: 'edit'
    end
  end

  def destroy
    @crew.destroy
    redirect_to crews_url
  end

  private

    def set_crew
      @crew = Crew.find(params[:id])
      @sailors_ids = @crew.sailors.map { |s| s.id }
    end

    # associate sailors to the crew in the joint table
    def associate_sailors
      params[:crew][:sailor_ids].each do |email|
        @crew.sailors << Sailor.find_by_email(email) if email != ""
      end
    end

    def crew_params
      params.require(:crew).permit(:title, :description )
    end
end
