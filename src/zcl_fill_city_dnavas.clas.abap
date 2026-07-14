CLASS zcl_fill_city_dnavas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_fill_city_dnavas IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DELETE FROM zcity_texts_dn.
    MODIFY zcity_texts_dn FROM ( SELECT  airport_id AS airport_id,
                                         city       AS city
                                         FROM /dmo/airport ).
   out->write( |Registros insertados: { sy-dbcnt }| ).
  ENDMETHOD.
ENDCLASS.
