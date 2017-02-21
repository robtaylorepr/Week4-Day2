require 'rack'
require_relative 'picksum'
require_relative 'samuel'
require_relative 'hip'
require 'pry'

app = Proc.new do |env|
  # Finds the num of paragraphs requested, or sets it to 1
  @num = env["REQUEST_PATH"].sub(/\/\w+[|\/]/, "").to_i
  @num = 1 if @num.zero?
  @path = env["PATH_INFO"]
  @headers = {'Content-Type' => 'text/html'}

  #['200', {'Content-Type' => 'text/html'}, [env.inspect]]

  def response
    if @path == '/lipsums'
      show_lipsum_list
    elsif @path.start_with?('/picsum')
      show_picksum
    elsif @path.start_with?('/samuel')
      show_samuel
    elsif @path.start_with?('/hip')
      show_hip
    else
      four_oh_four
    end
  end

  def show_lipsum_list
    ['200', @headers, %w(picksum,samuel,hip)]
  end

  def show_picksum
    ['200', @headers, Picksum.call(@num)]
  end

  def show_samuel
    ['200', @headers, Samuel.call(@num)]
  end

  def show_hip
    ['200', @headers, Hip.call(@num)]
  end

  def four_oh_four
    ['404', @headers, ["That ain't here"]]
  end

  response
end

Rack::Handler::WEBrick.run app
