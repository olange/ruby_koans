require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutNil < EdgeCase::Koan
  def test_nil_is_an_object
    assert_equal true, nil.is_a?(Object), "Unlike NULL in other languages"
  end

  def test_you_dont_get_null_pointer_errors_when_calling_methods_on_nil
    # What happens when you call a method that doesn't exist.  The
    # following begin/rescue/end code block captures the exception and
    # makes some assertions about it.
    begin
      nil.some_method_nil_doesnt_know_about
    rescue Exception => ex
      # What exception has been caught?
      assert_equal NoMethodError, ex.class

      # What message was attached to the exception?
      # (HINT: replace __ with part of the error message.)
      assert_match(/undefined method/, ex.message)
    end
  end

  def test_nil_has_a_few_methods_defined_on_it
    assert_equal true, nil.nil?
    assert_equal "", nil.to_s
    assert_equal "nil", nil.inspect

    # THINK ABOUT IT:
    #
    # Is it better to use
    #    obj.nil?
    # or
    #    obj == nil
    # Why?
    #
    # I would favor obj.nil?, as it is more explicit about its intent:
    # check if it IS the nil singleton that we have at hand. And as
    # only the nil singleton object should ever respond true to nil?(),
    # its outcome is unlikely to exhibit an unexpected behavior.
    #
    # At the Object level, obj == nil will behave the same as obj.nil?:
    # the ==() will call equal() to compare object equality (this
    # behavior being inherited from BasicObject).
    # 
    # Yet it is common to override ==(). Numeric types for instance
    # perform type conversion across ==(). Although improbable, some
    # objects might exhibit an unexpected behavior when comparing
    # themselves to nil, if the author forgets to compare object
    # equality, or converts its operand to nil beforehand. This
    # would be another reason to favor obj.nil() over obj == nil.
    #
    # I wonder if anyone would ever want to implement ==() so that
    # an object would consider itself similar to nil in some case?
    # In that case, that one would use obj.nil? to test for strict
    # nil equality and ==() for nil « similarity ».
  end

end