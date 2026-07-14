@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help City'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@Search.searchable: true
@Consumption.ranked: true
define view entity zcds_city_vh_dnavas
  as select from ZCDS_CITY_ASSOC_DNAVAS
{
  key CustomerId,
      FirstName,
      LastName,
      Title,
      Street,
      PostalCode,
      @Search.ranking: #HIGH
      @Search.fuzzinessThreshold: 0.8
      @Search.defaultSearchElement: true
      City,
      @Search.ranking: #LOW
      @Search.fuzzinessThreshold: 0.8
      @Search.defaultSearchElement: true
      @Semantics.text: true
      _CityText.City as CityText,
      CountryCode,
      PhoneNumber,
      EmailAddress,
      /* Associations */
      _CityText
}
