class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :leave_events
  has_many :leaves_to_approve, :class_name => "leave_events", :foreign_key => "manager_id"


  ROLES = %i(
    manager employee contractor   pending admin
  ).freeze

  def admin?
    role == 'admin'
  end

  def manager?
    role == 'manager'
  end

  def employee?
    role == 'employee'
  end
end
