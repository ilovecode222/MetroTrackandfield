module ResultsHelper
  def convert_to_seconds(performance)
    return Float::INFINITY if performance.blank?

    if performance.include?(":")
      # Format: mm:ss.xx
      minutes, seconds = performance.split(":")
      minutes.to_i * 60 + seconds.to_f
    else
      performance.to_f
    end
  rescue
    Float::INFINITY
  end
end
