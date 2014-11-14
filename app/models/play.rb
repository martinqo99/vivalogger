class Play < ActiveRecord::Base
  belongs_to :song, counter_cache: true
end
