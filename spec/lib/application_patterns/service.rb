require "spec_helper"

RSpec.describe ApplicationPatterns::Service do
  class TestServiceWithCustomResultClass < described_class
    class Result < ApplicationPatterns::Service::Result
      attr_reader :additional_information
    end

    def initialize(expect_success:)
      @expect_success = expect_success
    end

    def call
      if expect_success
        success(additional_information: "service_call succeeded")
      else
        failure(additional_information: "service_call failed", message: "an error message")
      end
    end

    private

    attr_reader :expect_success
  end

  class TestServiceWithoutCustomResultClass < described_class
    def call
      success(message: "a success message")
    end
  end

  context "with a custom result class" do
    context "call" do
      it "returns a success" do
        result = TestServiceWithCustomResultClass.call(expect_success: true)
        expect(result.success?).to eq(true)
        expect(result.additional_information).to eq("service_call succeeded")
        expect(result.message).to be_nil
      end

      it "returns a failure" do
        result = TestServiceWithCustomResultClass.call(expect_success: false)
        expect(result.success?).to eq(false)
        expect(result.additional_information).to eq("service_call failed")
        expect(result.message).to eq("an error message")
      end
    end

    context "call!" do
      it "returns a success" do
        result = TestServiceWithCustomResultClass.call!(expect_success: true)
        expect(result.success?).to eq(true)
      end

      it "raises an error on failure" do
        expect do
          TestServiceWithCustomResultClass.call!(expect_success: false)
        end.to raise_error(described_class::ServiceCallFailed, 'TestServiceWithCustomResultClass failed with message "an error message".')
      end
    end
  end

  context "without a custom result class" do
    context "call" do
      it "returns a success" do
        result = TestServiceWithoutCustomResultClass.call
        expect(result.success?).to eq(true)
        expect(result.message).to eq("a success message")
      end
    end
  end
end
