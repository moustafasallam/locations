namespace :group_events do

  desc "add new group_event"
  task :create => :environment do
    conductor = AmqpConductor.new
    data = conductor.receive
    data.each do |params|
      e = GroupEvent.new
      e.name =  params[:group_event][:name]
      e.description = params[:group_event][:description]
      e.state = params[:group_event][:state_date]
      e.start = params[:group_event][:start_date]
      e.end = params[:group_event][:end]
      e.save!
    end
    conductor.close
  end

end
