require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module IpaTestKit
  class DiagnosticReportNoteProvenanceRevincludeSearchTest < Inferno::Test
    include IpaTestKit::SearchTest

    title 'Server returns Provenance resources from DiagnosticReport search by patient + category + revInclude:Provenance:target'
    description %(
      A server SHALL be capable of supporting _revIncludes:Provenance:target.

      This test will perform a search by patient + category + revInclude:Provenance:target and
      will pass if a Provenance resource is found in the response.
    %)

    id :ipa_010_diagnostic_report_note_provenance_revinclude_search_test

    input :patient_ids,
      title: 'Patient IDs',
      description: 'Comma separated list of patient IDs that in sum contain all MUST SUPPORT elements'

    def properties
      @properties ||= SearchTestProperties.new(
        fixed_value_search: true,
        resource_type: 'DiagnosticReport',
        search_param_names: ['patient', 'category'],
        possible_status_search: true
      )
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def self.provenance_metadata
      @provenance_metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, '..', 'provenance', 'metadata.yml')))
    end

    def scratch_resources
      scratch[:diagnostic_report_note_resources] ||= {}
    end

    def scratch_provenance_resources
      scratch[:provenance_resources] ||= {}
    end

    run do
      run_provenance_revinclude_search_test
    end
  end
end
