require_relative '../../read_test'

module IpaTestKit
  class EncounterReadTest < Inferno::Test
    include IpaTestKit::ReadTest

    title 'Server returns correct Encounter resource from Encounter read interaction'
    description 'A server SHALL support the Encounter read interaction.'

    id :ipa_010_encounter_read_test

    def resource_type
      'Encounter'
    end

    def scratch_resources
      scratch[:encounter_resources] ||= {}
    end

    run do
      perform_read_test(scratch.dig(:references, 'Encounter'))
    end
  end
end