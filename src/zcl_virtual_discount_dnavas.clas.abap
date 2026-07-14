CLASS zcl_virtual_discount_dnavas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_virtual_discount_dnavas IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

    CASE iv_entity.
      WHEN 'ZCDS_VIRTUAL_DISCOUNT_DNAVAS'.
        LOOP AT it_requested_calc_elements INTO DATA(LS_requested_calc_elements).
          IF ls_requested_calc_elements = 'REALPRICE'.
            APPEND 'CURRENCYCODE' TO et_requested_orig_elements.
            APPEND 'PRICE'        TO et_requested_orig_elements.
          ENDIF.
        ENDLOOP.
    ENDCASE.

  ENDMETHOD.
  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA lt_original TYPE STANDARD TABLE OF zcds_virtual_discount_dnavas WITH DEFAULT KEY.

    lt_original = CORRESPONDING #( it_original_data ).

    LOOP AT lt_original ASSIGNING FIELD-SYMBOL(<fs_original>).
      IF <fs_original>-CurrencyCode = 'EUR'.
        <fs_original>-realprice = <fs_original>-Price * '0.10'.
      ELSE.
        <fs_original>-realprice = <fs_original>-Price * '0.05'.
      ENDIF.
    ENDLOOP.
    ct_calculated_data = CORRESPONDING #( lt_original ).
  ENDMETHOD.
ENDCLASS.
