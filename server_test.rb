require 'minitest/autorun'
require 'minitest/pride'
require "rack/test"
require_relative 'app'

class TestThing < Minitest::Test

  include Rack::Test::Methods

  def app
    App
  end

  def test_show_picksum
    get "/picksum"
    p last_response
    assert last_response.ok?
    assert_equal "Do you feel lucky, punk?",
      last_response.body
  end

  def test_show_samuel
    text = %q(
    You think water moves fast?
    You should see ice.
    It moves like it has a mind.
    Like it knows it killed the world once and got a taste for murder.
    After the avalanche, it took us a week to climb out.
    Now, I don't know exactly when we turned on each other, but I know that seven of us survived the slide... and only five made it out. Now we took an oath, that I'm breaking now. We said we'd say it was the snow that killed the other two, but it wasn't. Nature is lethal but it doesn't hold a candle to man.
    )
    get "/samuel"
    p last_response
    assert last_response.ok?
    assert_equal text,
      last_response.body
  end

  def test_show_hip
    text = %q(
    Your hip, man
    Real hip
    This is a ipsum text on being hip ...
    and so it just goes on and on and on ..
    )
    get "/hip"
    p last_response
    assert last_response.ok?
    assert_equal text,
      last_response.body
  end

end
