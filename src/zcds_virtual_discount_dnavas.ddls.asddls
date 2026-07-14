@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Virtual Discount'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zcds_virtual_discount_dnavas
  as select from /dmo/flight
{
  key carrier_id                      as CarrierId,
  key connection_id                   as ConnectionId,
  key flight_date                     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                           as Price,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast( 0 as abap.curr( 16, 2 ) ) as RealPrice,
      currency_code                   as CurrencyCode,
      plane_type_id                   as PlaneTypeId,
      seats_max                       as SeatsMax,
      seats_occupied                  as SeatsOccupied
}
