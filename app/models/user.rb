# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  is_admin               :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  has_one :store
  has_many :selling_orders, class_name: "Order", foreign_key: :seller_id

  has_many :order_items, foreign_key: :seller_id



  def role?(checking_role)
    self.role == checking_role.to_s
  end


  def is_seller_or_admin?
    is_seller? || is_admin?
  end

  def is_seller?
    self.role?(:seller)
  end

  def is_admin?
    self.role?(:admin)
  end


  def udpate_role!(new_role)
    self.update_columns(role: new_role.to_s)
  end

  # def admin?
  #   is_admin
  # end         

end
