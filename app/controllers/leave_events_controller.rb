class LeaveEventsController < BaseController
  skip_load_resource except: [:create, :new]

  def index
    @leave_events = LeaveEvent.where(sign_date: nil)
  end

  def create
    @leave_event = current_user.leave_events.build(leave_event_params)

    if @leave_event.save
      redirect_to leave_events_path
    else
      render :new
    end
  end
 def edit
   @leave_event = LeaveEvent.find_by_token(params[:id])
 end
  def update
    @leave= LeaveEvent.find_by_token(params[:id])
    @leave.attributes = params[:leave]
    @leave.user_id = current_user.id
    @leave.manager_id = current_user.manager
    @leave.status = "pending"
    if @leave.valid?
      @leave.save
      redirect_to leaves_path
    else
      render 'edit'
    end
  end
  def show
    @leave_event = LeaveEvent.find_by_token(params[:id])
  end

  def verify
    obj = LeaveEvent.find_by_token(params[:id])

    if obj.verify(current_user)
      redirect_to leave_events_path
    else
      redirect_to leave_events_path
    end
  end

  def reject
    obj = LeaveEvent.find_by_token(params[:id])

    if obj.reject(current_user)
      redirect_to leave_events_path
    else
      redirect_to leave_events_path
    end
  end

  private

  def leave_event_params
    params.require(:leave_event).permit(
      :start_time, :end_time, :leave_type, :description
    )
  end
end
