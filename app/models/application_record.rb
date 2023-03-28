class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def search_for_name(model_name)
    model_name.where()
  end

  def self.search
    self.where('create_at > somedate')
  end
end
