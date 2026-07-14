@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Projeccion Virtual Discount'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zcds_proj_virtual_disc_DNAVAS
  provider contract transactional_query
  as projection on zcds_virtual_discount_dnavas
{
  key      CarrierId,
  key      ConnectionId,
  key      FlightDate,
           @Semantics.amount.currencyCode: 'CurrencyCode'
           Price,
           @Semantics.amount.currencyCode: 'CurrencyCode'
           @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRTUAL_DISCOUNT_DNAVAS'
  virtual  RealPrice : abap.curr( 16, 2 ),
           CurrencyCode,
           PlaneTypeId,
           SeatsMax,
           SeatsOccupied
}
