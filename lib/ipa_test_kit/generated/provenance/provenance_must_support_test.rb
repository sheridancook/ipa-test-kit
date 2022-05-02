require_relative '../../must_support_test'

module IpaTestKit
  class ProvenanceMustSupportTest < Inferno::Test
    include IpaTestKit::MustSupportTest

    title 'All must support elements are provided in the Provenance resources returned'
    description %(
      IPA Responders SHALL be capable of populating all data elements as
      part of the query results as specified by the IPA Server Capability
      Statement. This test will look through the Provenance resources
      found previously for the following must support elements:

      * Provenance.agent
      * Provenance.agent.onBehalfOf
      * Provenance.agent.type
      * Provenance.agent.type.coding.code
      * Provenance.agent.type.coding.code
      * Provenance.agent.who
      * Provenance.agent:ProvenanceAuthor
      * Provenance.agent:ProvenanceTransmitter
      * Provenance.recorded
      * Provenance.target
    )

    id :ipa_010_provenance_must_support_test

    def resource_type
      'Provenance'
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:provenance_resources] ||= {}
    end

    run do
      perform_must_support_test(all_scratch_resources)
    end
  end
end