@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Root Airport'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zcds_root_airpot_dnavas
  as select from /dmo/airport
  association [1..1] to ZCDS_CITY_ASSOC_DNAVAS as _CityAssoc on _CityAssoc.City = $projection.City
{
  key /dmo/airport.airport_id as AirportId,
      /dmo/airport.name       as Name,
      /dmo/airport.city       as City,
      /dmo/airport.country    as Country,
      _CityAssoc
}
