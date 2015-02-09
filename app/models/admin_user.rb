class AdminUser < ActiveRecord::Base

  # To configure a different table name:
  # self.table_name = "admin_users"

  has_secure_password

  #has_and_belongs_to_many :products
 

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  #FORBIDDEN_USERNAMES = ['littlebopeep','humptydumpty','marymary']

  # shortcut validations, aka "sexy validations"
  # validates :first_name, :presence => true,
  #                        :length => { :maximum => 25 }
  # validates :last_name, :presence => true,
  #                       :length => { :maximum => 50 }
  validates :username, :length => { :within => 4..25 },
                       :uniqueness => true
  # validates :email, :presence => true,
  #                   :length => { :maximum => 100 },
  #                   :format => EMAIL_REGEX,
  #                   :confirmation => true



  scope :sorted, lambda { order("username ASC") }

  #def name
    #{}"#{first_name} #{last_name}"
    # Or: first_name + ' ' + last_name
    # Or: [first_name, last_name].join(' ')
  #end
end
