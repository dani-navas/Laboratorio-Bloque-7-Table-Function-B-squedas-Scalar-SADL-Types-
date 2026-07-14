CLASS zcl_calc_discount_dnavas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.
    CLASS-METHODS get_discount FOR SCALAR FUNCTION ZSF_CALC_DISCOUNT_dnavas.
    CLASS-METHODS geT_real_price FOR SCALAR FUNCTION zsf_din_calc_discount_dn.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calc_discount_dnavas IMPLEMENTATION.
  METHOD get_discount BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT
                      OPTIONS READ-ONLY.

    IF pClientCucky = 'EUR' THEN
        result = pDiscount * 0.10;
    else
        result = pDiscount * 0.05;
    end if ;

  endmethod.

  METHOD get_real_price BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT
                      OPTIONS READ-ONLY.
    result  = p1 - p2;
  ENDMETHOD.

ENDCLASS.
