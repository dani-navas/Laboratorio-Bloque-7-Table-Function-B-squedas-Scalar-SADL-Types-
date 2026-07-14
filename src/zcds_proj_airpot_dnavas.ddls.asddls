@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Projection Airport'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define root view entity zcds_proj_airpot_dnavas
  provider contract transactional_query
  as projection on zcds_root_airpot_dnavas
{

  key AirportId,
      Name,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'City' ]
      @Consumption.valueHelpDefinition: [{entity: { name: 'zcds_city_vh_dnavas',
                                                    element: 'City' },
                                         useForValidation: true }]                                                                                                                                     
      City,
      Country,
      /* Associations */
      _CityAssoc.City as CityText
}
