require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @chef = Chef.new(name: "name", email: "test@foobar.com")
    @chef1 = Chef.new(name: "chef1", email: "chef1@foobar.com")
    #code
  end

  test "chef should be valid" do
    assert @chef.valid?
  end

  test "name should be present" do
    @chef.name = ""
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email = ""
    assert_not @chef.valid?
  end

  test "email should be less than 255 characters" do
    @chef.email = "test@email.#{"a" * 250}"
    assert_not @chef.valid?
  end

  test "email should be unique" do
    @chef.save
    @chef1.email = "test@foobar.com"
    assert_not @chef1.valid?
  end

  test "name should be less than 30 characters" do
    @chef.name = "a" * 31
    assert_not @chef.valid?
  end

  test "email should accept correct format" do
    valid_emails = %w[user@example.com SHAFRAZI@GMAIL.COM M.first@yahoo.ca john+smith@co.uk.org]
    valid_emails.each do |valid_email|
      @chef.email = valid_email
      assert @chef.valid?, "#{valid_email.inspect} should be valid"
    end
  end

  test "should reject invalid email addresses" do
    invalid_emails = %w[shafrazi@example shafrazi@example,com shafrazi.name@gmail joe@bar+foo.com]
    invalid_emails.each do |invalid_email|
      @chef.email = invalid_email
      assert_not @chef.valid?, "#{invalid_email.inspect} should be invalid"
    end
  end

  test "email should be lower case before hitting database" do
    mixed_email = "John@Example.com"
    @chef.email = mixed_email
    @chef.save
    assert_equal mixed_email.downcase, @chef.reload.email
  end
end
