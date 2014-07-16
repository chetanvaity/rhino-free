class WidgetType < ActiveRecord::Base

  # TBD: Do this in a switch statement for various widget types
  def self.getMetaData(srcdata)
    # TBD: centerposition and zoom are sample values for now
    return {:centerposition => {:latitude => "12.971361", :longitude => "77.6263782"},
             :zoom => 14}
  end

end
