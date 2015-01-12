class Cat < ActiveRecord::Base

  validates :name, :desc,   presence: true,
                            uniqueness: { case_sensitive: false },
                            length: { minimum: 1,
                              message: "Please enter name and description." }
end
