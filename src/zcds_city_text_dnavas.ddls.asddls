@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS  City Text'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@ObjectModel.usageType: {
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MIXED }
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'AirportId'
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE,
                                      #CDS_MODELING_ASSOCIATION_TARGET,
                                      #CDS_MODELING_DATA_SOURCE,
                                      #LANGUAGE_DEPENDENT_TEXT]
define view entity ZCDS_CITY_TEXT_dnavas
  as select from zcity_texts_dn  
  association [1..1] to ZCDS_CITY_ASSOC_DNAVAS as _CityText on _CityText.City = $projection.City
{
      @Search.defaultSearchElement: true
  key airport_id as AirportId,
      @ObjectModel.text.association: '_CityText'
      city       as City,
      _CityText
}
