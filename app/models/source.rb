require 'net/http'

class Source < ActiveRecord::Base


  # Get src from the properties attribute in source as a hash
  def getProperties
    logger.debug("properties = #{properties}")
    prop_hash = ActiveSupport::JSON.decode(properties)
    logger.debug("prop_hash = #{prop_hash}")

    return prop_hash["src"]
  end


  # Get data from the data source
  def getData
    logger.debug("properties = #{properties}")
    prop_hash = ActiveSupport::JSON.decode(properties)
    logger.debug("prop_hash = #{prop_hash}")
    

    # TBD: This is hardcode, to be removed
    # Add user name to data_str (for table view widget)
    data_str = Hash.new
    if prop_hash["user"].nil? then
      logger.debug("user val not present")
    else
      logger.debug("user val present")
      data_str["user"] = prop_hash["user"]
    end

    # TBD: This is ThingSpeak specific
    # TBD: Error catch, timeout
    json_str = Net::HTTP.get(URI.parse(prop_hash["url"]))
    # data_str = Hash.new {"NA"}# TBD: Crude initialiser
    logger.debug("json_str = #{json_str}")
    #logger.debug("data_str = #{data_str}")
    data_str.merge!(ActiveSupport::JSON.decode(json_str))
    # Catch null, create empty string. Redundant? After addition of above Hash.new
    if data_str.nil? then 
      data_str = Hash.new 
    end
    logger.debug("data_str = #{data_str}")
    

    # TBD: This is map specific, should go elsewhere
    # Add "icon" entry to hash, Get related icon, locally	
    # Hardcoded, should get it from source properties
    #data_str["icon"] = "../../assets/glyphicons_003_user.png"
    logger.debug("data_str = #{data_str}")
    return data_str
  end
end
