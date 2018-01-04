defmodule CaptchaTest do
  use ExUnit.Case
  doctest Captcha

  describe "Captcha.calc/1" do

    test "example 1" do
      assert 3 == Captcha.calc("1122")
    end

    test "example 2" do
      assert 4 == Captcha.calc("1111")
    end

    test "example 3" do
      assert 0 == Captcha.calc("1234")
    end

    test "example 4" do
      assert 9 == Captcha.calc("91212129")
    end

  end
end
