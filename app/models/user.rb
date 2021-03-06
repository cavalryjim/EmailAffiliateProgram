# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email         :string
#  referral_code :string
#  referrer_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'users_helper'

class User < ActiveRecord::Base
  belongs_to :referrer, class_name: 'User', foreign_key: 'referrer_id'
  has_many :referrals, class_name: 'User', foreign_key: 'referrer_id'

  validates :email, presence: true, uniqueness: true, format: {
    with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
    message: 'Invalid email format.'
  }
  validates :referral_code, uniqueness: true

  before_create :create_referral_code
  after_create :send_welcome_email

  REFERRAL_STEPS = [
    {
      'count' => 5,
      'html' => 'Shave<br>Cream',
      'class' => 'two',
      'image' =>  ActionController::Base.helpers.asset_path(
        'refer/cream-tooltip@2x.png')
    },
    {
      'count' => 10,
      'html' => 'Truman Handle<br>w/ Blade',
      'class' => 'three',
      'image' => ActionController::Base.helpers.asset_path(
        'refer/truman@2x.png')
    },
    {
      'count' => 25,
      'html' => 'Winston<br>Shave Set',
      'class' => 'four',
      'image' => ActionController::Base.helpers.asset_path(
        'refer/winston@2x.png')
    },
    {
      'count' => 50,
      'html' => 'One Year<br>Free Blades',
      'class' => 'five',
      'image' => ActionController::Base.helpers.asset_path(
        'refer/blade-explain@2x.png')
    }
  ]

  private

  def create_referral_code
    self.referral_code = UsersHelper.unused_referral_code
  end

  def send_welcome_email
    # JDavis: Modifying to use Mail Chimp.
    if ENV['LIST_ID']
      MailchimpHelper.add_to_list self
    else
      UserMailer.signup_email(self).deliver
    end 
    
    # JDavis: Delete my statement above and uncomment the line below if you want to buffer production emails.
    #Rails.env.production? ? UserMailer.delay.signup_email(self) : UserMailer.signup_email(self).deliver
  end
end
