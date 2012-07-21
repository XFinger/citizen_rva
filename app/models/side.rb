class Side < ActiveRecord::Base
  belongs_to :useable, :polymorphic => true
end
