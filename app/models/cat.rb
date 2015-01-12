class Cat < ActiveRecord::Base

  validates :name, presence: true,
                          uniqueness: { case_sensitive: false },
                          length: { minimum: 1,
                                    maximum: 15,
                                    message: "Please enter a name." },
                          format: { with: /\A[a-zA-Z\d\s'"]+\z/,
                                    message: "Please enter only letters"}
  validates :desc, presence: true,
                          length: { minimum: 5,
                                    maximum: 255,
                                    message: "Please enter a description." },
                          format: { with: /\A[a-zA-Z\d\s'"&*]+\z/,
                                    message: "Please enter only letters"}
end
