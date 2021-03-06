defmodule AuthTest do
  use ExUnit.Case
  doctest Auth

  describe "Auth.passphrase_valid?/1" do
    test "example 1" do
      assert true == Auth.passphrase_valid?("aa bb cc dd ee")
    end

    test "example 2" do
      assert false == Auth.passphrase_valid?("aa bb cc dd aa")
    end

    test "example 3" do
      assert true == Auth.passphrase_valid?("aa bb cc dd aaa")
    end
  end

  describe "Auth.passphrase_valid2?/1" do
    test "example 1" do
      assert true == Auth.passphrase_valid2?("abcde fghij")
    end

    test "example 2" do
      assert false == Auth.passphrase_valid2?("abcde xyz ecdab")
    end

    test "example 3" do
      assert true == Auth.passphrase_valid2?("a ab abc abd abf abj")
    end

    test "example 4" do
      assert true == Auth.passphrase_valid2?("iiii oiii ooii oooi oooo")
    end

    test "example 5" do
      assert false == Auth.passphrase_valid2?("oiii ioii iioi iiio")
    end
  end

  describe "Auth.count_valid/1" do
    test "single correct passphrase" do
      assert 1 == Auth.count_valid("aa bb cc dd ee")
    end

    test "single incorrect passphrase" do
      assert 0 == Auth.count_valid("aa bb cc dd aa")
    end

    test "trailing newline is trimmed" do
      assert 1 == Auth.count_valid("aa bb cc dd ee\n")
      assert 0 == Auth.count_valid("aa bb cc dd aa\n")
    end

    test "multiple passphrases, one correct" do
      phrases = "aa bb cc\naa bb aa\n cc dd dd"
      assert 1 == Auth.count_valid(phrases)
    end

    test "multiple passphrases, zero correct" do
      phrases = "aa aa\nbb aa bb\ncc cc cc\nhi hello hi"
      assert 0 == Auth.count_valid(phrases)
    end

    test "multiple passphrases, multiple correct" do
      phrases = "aa aa\naa bb cc\nhi hello howdy\naa bb cc dd aa\naa bb cc dd ee"
      assert 3 == Auth.count_valid(phrases)
    end
  end

  describe "Auth.count_valid2/1" do
    test "all examples" do
      phrases =
        "abcde fghij\nabcde xyz ecdab\na ab abc abd abf abj\niiii oiii ooii oooi oooo\noiii ioii iioi iiio"

      assert 3 == Auth.count_valid2(phrases)
    end
  end
end
