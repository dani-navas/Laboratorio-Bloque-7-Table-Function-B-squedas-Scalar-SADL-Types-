@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS City Association Customer'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MIXED }
@Search.searchable: true
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE,
                                      #CDS_MODELING_ASSOCIATION_TARGET,
                                      #CDS_MODELING_DATA_SOURCE,
                                      #LANGUAGE_DEPENDENT_TEXT]
define view entity ZCDS_CITY_ASSOC_DNAVAS
  as select from /dmo/customer as Customer
  association [1..1] to ZCDS_CITY_TEXT_dnavas as _CityText on _CityText.City = $projection.City
{
  key Customer.customer_id   as CustomerId,
      Customer.first_name    as FirstName,
      Customer.last_name     as LastName,
      Customer.title         as Title,
      Customer.street        as Street,
      Customer.postal_code   as PostalCode,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Semantics.text: true
      @ObjectModel.text.association: '_CityText'
      Customer.city          as City, 
      Customer.country_code  as CountryCode,
      Customer.phone_number  as PhoneNumber,
      Customer.email_address as EmailAddress,
      _CityText
}
