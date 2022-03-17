require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module IpaTestKit
  class CarePlanPatientCategoryDateSearchTest < Inferno::Test
    include IpaTestKit::SearchTest

    title 'Server returns valid results for CarePlan search by patient + category + date'
    description %(
A server SHOULD support searching by
patient + category + date on the CarePlan resource. This test
will pass if resources are returned and match the search criteria. If
none are returned, the test is skipped.

[IPA Server CapabilityStatement](http://hl7.org/fhir/uv/ipa/STU3.1.1/CapabilityStatement-ipa-server.html)

    )

    id :ipa_010_care_plan_patient_category_date_search_test
    optional

    input :patient_ids,
      title: 'Patient IDs',
      description: 'Comma separated list of patient IDs that in sum contain all MUST SUPPORT elements'

    def self.properties
      @properties ||= SearchTestProperties.new(
        resource_type: 'CarePlan',
        search_param_names: ['patient', 'category', 'date'],
        possible_status_search: true,
        token_search_params: ['category'],
        params_with_comparators: ['date']
      )
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:care_plan_resources] ||= {}
    end

    run do
      run_search_test
    end
  end
end
