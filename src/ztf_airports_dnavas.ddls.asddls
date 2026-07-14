@EndUserText.label: 'Table Function Airports'
@AccessControl.authorizationCheck: #NOT_REQUIRED 
@ClientHandling.type: #CLIENT_DEPENDENT
@ClientHandling.algorithm: #SESSION_VARIABLE
define table function ztf_airports_DNAVAS
  with parameters
    @Environment.systemField: #CLIENT
    pClient : abap.clnt,
    pCity   : /dmo/city
returns
{

  key client     : abap.clnt;
  key AIRPORT_ID : /dmo/airport_id;
      name       : /dmo/airport_name;
      city       : /dmo/city;
      COUNTRY    : land1;

}
implemented by method 
  zcl_amdp_airport_dnavas=>get_airports;