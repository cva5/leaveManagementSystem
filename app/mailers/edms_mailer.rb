class EdmsMailer < ActionMailer::Base
  default from: 'admin@test.com'
  layout 'mailer'

  def applied_for_leave(leave, user)
    @leave = leave
    @user = user
    mail(:to => user.manager.email, :subject => "Leave request", :from => user.email)
  end

  def leave_approved(leave,user, status)
    @leave = leave
    @user = user
    @status = status
    mail(:to => leave.user.email, :subject => "Leave request", :from => user.email)
  end
end
