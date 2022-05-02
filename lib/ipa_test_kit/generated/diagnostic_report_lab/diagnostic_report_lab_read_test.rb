require_relative '../../read_test'

module IpaTestKit
  class DiagnosticReportLabReadTest < Inferno::Test
    include IpaTestKit::ReadTest

    title 'Server returns correct DiagnosticReport resource from DiagnosticReport read interaction'
    description 'A server SHALL support the DiagnosticReport read interaction.'

    id :ipa_010_diagnostic_report_lab_read_test

    def resource_type
      'DiagnosticReport'
    end

    def scratch_resources
      scratch[:diagnostic_report_lab_resources] ||= {}
    end

    run do
      perform_read_test(all_scratch_resources)
    end
  end
end