require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module IpaTestKit
  class GoalPatientTargetDateSearchTest < Inferno::Test
    include IpaTestKit::SearchTest

    title 'Server returns valid results for Goal search by patient + target-date'
    description %(
A server SHOULD support searching by
patient + target-date on the Goal resource. This test
will pass if resources are returned and match the search criteria. If
none are returned, the test is skipped.

[IPA Server CapabilityStatement](https://build.fhir.org/ig/HL7/fhir-ipa/CapabilityStatement-ipa-server.html)

    )

    id :ipa_010_goal_patient_target_date_search_test
    optional

    input :patient_ids,
      title: 'Patient IDs',
      description: 'Comma separated list of patient IDs that in sum contain all MUST SUPPORT elements'

    def self.properties
      @properties ||= SearchTestProperties.new(
        resource_type: 'Goal',
        search_param_names: ['patient', 'target-date'],
        possible_status_search: true,
        params_with_comparators: ['target-date']
      )
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:goal_resources] ||= {}
    end

    run do
      run_search_test
    end
  end
end
