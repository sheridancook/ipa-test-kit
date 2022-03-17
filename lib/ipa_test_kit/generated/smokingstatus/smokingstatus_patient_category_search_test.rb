require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module IpaTestKit
  class SmokingstatusPatientCategorySearchTest < Inferno::Test
    include IpaTestKit::SearchTest

    title 'Server returns valid results for Observation search by patient + category'
    description %(
A server SHALL support searching by
patient + category on the Observation resource. This test
will pass if resources are returned and match the search criteria. If
none are returned, the test is skipped.

[IPA Server CapabilityStatement](http://hl7.org/fhir/uv/ipa/STU3.1.1/CapabilityStatement-ipa-server.html)

    )

    id :ipa_010_smokingstatus_patient_category_search_test
    optional

    input :patient_ids,
      title: 'Patient IDs',
      description: 'Comma separated list of patient IDs that in sum contain all MUST SUPPORT elements'

    def self.properties
      @properties ||= SearchTestProperties.new(
        resource_type: 'Observation',
        search_param_names: ['patient', 'category'],
        possible_status_search: true,
        token_search_params: ['category']
      )
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:smokingstatus_resources] ||= {}
    end

    run do
      run_search_test
    end
  end
end
