class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments, dependent: :destroy
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  def manager?
    position == 'manager'
  end

  def cs_rep?
    position == 'csrep'
  end
end
