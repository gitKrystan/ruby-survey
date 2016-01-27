class Survey < ActiveRecord::Base
  has_many(:questions, dependent: :destroy)
  validates(:title, :presence => true)
  before_save(:capitalize)

  

private

  def capitalize
    self.title = title.split(" ").each { |w| w.capitalize! }.join(" ")
  end
end
