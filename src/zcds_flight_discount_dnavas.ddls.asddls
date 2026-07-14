@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Flight Discount'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_flight_discount_dnavas
  as select from /dmo/flight
{
  key carrier_id                                                                    as CarrierId,
  key connection_id                                                                 as ConnectionId,
  key flight_date                                                                   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                                                                         as Price,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      ZSF_CALC_DISCOUNT_dnavas( pClientCucky => currency_code, pDiscount => price ) as Discount,
      currency_code                                                                 as CurrencyCode,
      plane_type_id                                                                 as PlaneTypeId,
      seats_max                                                                     as SeatsMax,
      seats_occupied                                                                as SeatsOccupied

}
