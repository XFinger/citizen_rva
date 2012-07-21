class Salad < ActiveRecord::Base
  belongs_to :useable, :polymorphic => true
end
