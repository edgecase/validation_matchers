require 'spec_helper'
require 'active_model'
require 'validation_matchers/active_model' 

class ExampleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value == "valid value"
      record.errors[attribute] << "not valid value"
    end
  end
end

describe ExampleValidator do
  include ValidationMatchers::ActiveModel
  subject { ExampleValidator.new({:attributes=>{}}) }

  it "allows a valid value" do
    subject.should pass_validate_each(:attr, "valid value") 
  end
  
  it "does not allow an invalid value" do
    subject.should_not pass_validate_each(:attr, "invalid value")
  end

  it "rejects an invalid value" do
    subject.should fail_validate_each(:attr, "invalid value")
  end  

  it "does not reject a valid value" do
    subject.should_not fail_validate_each(:attr, "valid value")
  end   
end
