@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Real Price'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_real_price_dnavas
  as select from zcds_flight_discount_dnavas
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Discount                                                                as FlightDiscount,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      ZSF_DIN_CALC_DISCOUNT_DN( p1 => cast( Price as abap.dec( 16, 2 ) ) ,
                                p2 => cast( Discount as abap.dec( 16, 2 ) ) ) as RealPrice,
      CurrencyCode,
      PlaneTypeId,
      SeatsMax,
      SeatsOccupied

}
