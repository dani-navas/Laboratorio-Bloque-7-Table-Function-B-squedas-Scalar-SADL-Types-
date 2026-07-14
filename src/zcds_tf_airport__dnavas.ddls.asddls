@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Consuming Table Function Airports'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_tf_airport__dnavas
  with parameters
    pClient : abap.clnt,
    pCity   : /dmo/city
  as select from /dmo/customer   as customer
    inner join   ztf_airports_DNAVAS(pCity : $parameters.pCity  ,
                                     pClient : $parameters.pClient ) as airports on airports.city = customer.city
{

  airports.AIRPORT_ID as AirportId,
  airports.name       as Name,
  airports.city       as City,
  customer.first_name as FirstName,
  airports.COUNTRY
}
