require_relative '../../read_test'

module IpaTestKit
  class ProcedureReadTest < Inferno::Test
    include IpaTestKit::ReadTest

    title 'Server returns correct Procedure resource from Procedure read interaction'
    description 'A server SHALL support the Procedure read interaction.'

    id :ipa_010_procedure_read_test

    def resource_type
      'Procedure'
    end

    def scratch_resources
      scratch[:procedure_resources] ||= {}
    end

    run do
      perform_read_test(all_scratch_resources)
    end
  end
end
