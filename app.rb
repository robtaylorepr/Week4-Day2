
class App

  attr_accessor :env, :path

  def initialize(env)
    @env = env
    @path = env["PATH_INFO"]
    # puts env.inspect
  end

end
