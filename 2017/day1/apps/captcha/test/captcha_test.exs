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

  describe "Captcha.calc2/1" do
    test "example 1" do
      assert 6 == Captcha.calc2("1212")
    end

    test "example 2" do
      assert 0 == Captcha.calc2("1221")
    end

    test "example 3" do
      assert 4 == Captcha.calc2("123425")
    end

    test "example 4" do
      assert 12 == Captcha.calc2("123123")
    end

    test "example 5" do
      assert 4 == Captcha.calc2("12131415")
    end
  end
end
