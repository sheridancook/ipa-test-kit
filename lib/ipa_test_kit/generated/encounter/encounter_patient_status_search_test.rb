require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module IpaTestKit
  class EncounterPatientStatusSearchTest < Inferno::Test
    include IpaTestKit::SearchTest

    title 'Server returns valid results for Encounter search by patient + status'
    description %(
A server SHOULD support searching by
patient + status on the Encounter resource. This test
will pass if resources are returned and match the search criteria. If
none are returned, the test is skipped.

[IPA Server CapabilityStatement](https://build.fhir.org/ig/HL7/fhir-ipa/CapabilityStatement-ipa-server.html)

    )

    id :ipa_010_encounter_patient_status_search_test
    optional

    input :patient_ids,
      title: 'Patient IDs',
      description: 'Comma separated list of patient IDs that in sum contain all MUST SUPPORT elements'

    def self.properties
      @properties ||= SearchTestProperties.new(
        resource_type: 'Encounter',
        search_param_names: ['patient', 'status']
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
