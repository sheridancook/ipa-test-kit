require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module IpaTestKit
  class CareTeamPatientStatusSearchTest < Inferno::Test
    include IpaTestKit::SearchTest

    title 'Server returns valid results for CareTeam search by patient + status'
    description %(
A server SHALL support searching by
patient + status on the CareTeam resource. This test
will pass if resources are returned and match the search criteria. If
none are returned, the test is skipped.

This test verifies that the server supports searching by reference using
the form `patient=[id]` as well as `patient=Patient/[id]`. The two
different forms are expected to return the same number of results. IPA
requires that both forms are supported by IPA responders.

Because this is the first search of the sequence, resources in the
response will be used for subsequent tests.

Additionally, this test will check that GET and POST search methods
return the same number of results. Search by POST is required by the
FHIR R4 specification, and these tests interpret search by GET as a
requirement of IPA v0.1.0.

[IPA Server CapabilityStatement](https://build.fhir.org/ig/HL7/fhir-ipa/CapabilityStatement-ipa-server.html)

    )

    id :ipa_010_care_team_patient_status_search_test
    input :patient_ids,
      title: 'Patient IDs',
      description: 'Comma separated list of patient IDs that in sum contain all MUST SUPPORT elements'

    def self.properties
      @properties ||= SearchTestProperties.new(
        first_search: true,
        fixed_value_search: true,
        resource_type: 'CareTeam',
        search_param_names: ['patient', 'status'],
        saves_delayed_references: true,
        test_reference_variants: true,
        multiple_or_search_params: ['status'],
        test_post_search: true
      )
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:care_team_resources] ||= {}
    end

    run do
      run_search_test
    end
  end
end