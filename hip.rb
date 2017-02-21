
class Hip


  @hipslang = %q(
  Your hip, man
  Real hip
  This is a ipsum text on being hip ...
  and so it just goes on and on and on ..
  )


  def self.call(num=1)
    return [@hipslang * num]
  end

end
