require_relative '../../validation_test'

module IpaTestKit
  class CarePlanValidationTest < Inferno::Test
    include IpaTestKit::ValidationTest

    id :ipa_010_care_plan_validation_test
    title 'CarePlan resources returned during previous tests conform to the IPA CarePlan Profile'
    description %(
This test verifies resources returned from the first search conform to
the [IPA CarePlan Profile](http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-careplan).

It verifies the presence of mandatory elements and that elements with
required bindings contain appropriate values. CodeableConcept element
bindings will fail if none of their codings have a code/system belonging
to the bound ValueSet. Quantity, Coding, and code element bindings will
fail if their code/system are not found in the valueset.

    )
    output :dar_code_found, :dar_extension_found

    def resource_type
      'CarePlan'
    end

    def scratch_resources
      scratch[:care_plan_resources] ||= {}
    end

    run do
      perform_validation_test(scratch_resources[:all] || [], 'http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-careplan')
    end
  end
end