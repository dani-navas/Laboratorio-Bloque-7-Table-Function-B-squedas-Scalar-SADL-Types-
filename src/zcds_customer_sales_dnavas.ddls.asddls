@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Customer Sales'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_customer_sales_dnavas
  as select from /dmo/customer
{
  key customer_id                                       as CustomerId,
      first_name                                        as FirstName,
      last_name                                         as LastName,
      zty_enum_st_order_dnavas.#DELIVERED               as StatusSale,
      cast(    first_name  as zty_cds_st_order_dnavas ) as SaleName

}
