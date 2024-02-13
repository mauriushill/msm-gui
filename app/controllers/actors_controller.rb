class ActorsController < ApplicationController
  def update
      a_id = params.fetch("the_id")
      match = Actor.where({ :id => a_id })
      the_id = match.at(0)
      the_id.name = params.fetch("the_name")
      the_id.dob = params.fetch("the_dob")
      the_id.bio = params.fetch("the_bio")
      the_id.image = params.fetch("the_image")
      the_id.save

    redirect_to("/actors/#{the_id.id}")
  end

  def destroy
    the_id = params.fetch("an_id")
    matching_record = Actor.where({ :id => the_id})
    the_actor = matching_record.at(0)
    the_actor.destroy
    redirect_to("/actors")
  end

  def new
    a = Actor.new
    a.name = params.fetch("the_name")
    a.dob = params.fetch("the_dob")
    a.bio = params.fetch("the_bio")
    a.image = params.fetch("the_image")
    a.save

    redirect_to("/actors")
  end

  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
