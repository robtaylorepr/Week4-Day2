
class Picksum

  @pick = %q(Do you feel lucky, punk?)

  def self.call(num=1)
    return [@pick * num]
  end

end
