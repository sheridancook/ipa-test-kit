require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module IpaTestKit
  class EncounterIdentifierSearchTest < Inferno::Test
    include IpaTestKit::SearchTest

    title 'Server returns valid results for Encounter search by identifier'
    description %(
A server SHOULD support searching by
identifier on the Encounter resource. This test
will pass if resources are returned and match the search criteria. If
none are returned, the test is skipped.

[IPA Server CapabilityStatement](http://hl7.org/fhir/uv/ipa/STU3.1.1/CapabilityStatement-ipa-server.html)

    )

    id :ipa_010_encounter_identifier_search_test
    optional

    def self.properties
      @properties ||= SearchTestProperties.new(
        resource_type: 'Encounter',
        search_param_names: ['identifier'],
        possible_status_search: true,
        token_search_params: ['identifier']
      )
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:encounter_resources] ||= {}
    end

    run do
      run_search_test
    end
  end
end
