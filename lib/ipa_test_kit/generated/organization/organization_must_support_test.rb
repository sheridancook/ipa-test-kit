require_relative '../../must_support_test'

module IpaTestKit
  class OrganizationMustSupportTest < Inferno::Test
    include IpaTestKit::MustSupportTest

    title 'All must support elements are provided in the Organization resources returned'
    description %(
      IPA Responders SHALL be capable of populating all data elements as
      part of the query results as specified by the IPA Server Capability
      Statement. This test will look through the Organization resources
      found previously for the following must support elements:

      * Organization.active
      * Organization.address
      * Organization.address.city
      * Organization.address.country
      * Organization.address.line
      * Organization.address.postalCode
      * Organization.address.state
      * Organization.identifier
      * Organization.identifier.system
      * Organization.identifier.value
      * Organization.identifier:NPI
      * Organization.name
      * Organization.telecom
    )

    id :ipa_010_organization_must_support_test

    def resource_type
      'Organization'
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:organization_resources] ||= {}
    end

    run do
      perform_must_support_test(all_scratch_resources)
    end
  end
end