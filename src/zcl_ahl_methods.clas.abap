CLASS zcl_ahl_methods DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ahl_methods IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lv_carrid TYPE /dmo/carrier_id,
          lv_connid TYPE /dmo/connection_id,
          lcl_conn  TYPE REF TO lcl_connection, "Intance
          lcl_conns TYPE TABLE OF REF TO lcl_connection. "Instance Iternal Table

    "Create Instance
    lcl_conn = NEW #(  ).
    lv_carrid = 'AL'.
    lv_connid = '0400'.
    TRY.
        lcl_conn->set_attributes(
          i_carrier_id    = lv_carrid
          i_connection_id = lv_connid
        ).
        APPEND lcl_conn TO lcl_conns.

      CATCH cx_abap_invalid_value.
    ENDTRY.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Create Instance
    lcl_conn = NEW #(  ).
    lv_carrid = 'AL'.
    lv_connid = '0401'.
    TRY.
        lcl_conn->set_attributes(
          i_carrier_id    = lv_carrid
          i_connection_id = lv_connid
        ).
        APPEND lcl_conn TO lcl_conns.

      CATCH cx_abap_invalid_value.
    ENDTRY.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "Create Instance
    lcl_conn = NEW #(  ).
    lv_carrid = 'AL'.
    lv_connid = '0402'.
    TRY.
        lcl_conn->set_attributes(
          i_carrier_id    = lv_carrid
          i_connection_id = lv_connid
        ).
        APPEND lcl_conn TO lcl_conns.

      CATCH cx_abap_invalid_value.
    ENDTRY.



    "Calling Functional Method
    " in a value assignment (with inline declaration for result)
    DATA(result) = lcl_conn->get_output( ).
    out->write( data = result
                name = 'Hasil Inline Declaration' ).

    " Loop
    LOOP AT lcl_conns INTO lcl_conn.
      out->write( lcl_conn->get_output( ) ).
    ENDLOOP.

    "  to supply input parameter of another method
*    out->write( data = connection->get_output( )
*                name = `Hasil` ).


  ENDMETHOD.
ENDCLASS.
