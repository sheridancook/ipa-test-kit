require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module IpaTestKit
  class PractitionerIdentifierSearchTest < Inferno::Test
    include IpaTestKit::SearchTest

    title 'Server returns valid results for Practitioner search by identifier'
    description %(
A server SHALL support searching by
identifier on the Practitioner resource. This test
will pass if resources are returned and match the search criteria. If
none are returned, the test is skipped.

[IPA Server CapabilityStatement](https://build.fhir.org/ig/HL7/fhir-ipa/CapabilityStatement-ipa-server.html)

    )

    id :ipa_010_practitioner_identifier_search_test
    def self.properties
      @properties ||= SearchTestProperties.new(
        resource_type: 'Practitioner',
        search_param_names: ['identifier'],
        token_search_params: ['identifier']
      )
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:practitioner_resources] ||= {}
    end

    run do
      run_search_test
    end
  end
end
