module RhinoUtil
  # Given a comma seperated string, return a list of integers
  # "abc,def,ghi" => {abc, def, ghi}
  def str2lst(str)
    # TBD: Error checking
    return str.split(",").map {|s| s.to_i}
  end
end
