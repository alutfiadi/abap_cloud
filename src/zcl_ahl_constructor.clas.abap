CLASS zcl_ahl_constructor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ahl_constructor IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: conn  TYPE REF TO lcl_connection,
          conns TYPE TABLE OF REF TO lcl_connection.

*  Constuctor for class lcl_connection
*  consistency check inside constructor
*  no forgetting or repeating for same instance8
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    TRY.
        conn = NEW #( carrier_id = 'AL' connection_id = '0400' ).
        append conn to conns.

        CATCH cx_abap_invalid_value.
            out->write( 'Creating instance failed!' ).
    ENDTRY.

    TRY.
        conn = NEW #( carrier_id = 'AZ' connection_id = '0401' ).
        append conn to conns.

        CATCH cx_abap_invalid_value.
            out->write( 'Creating instance failed!' ).
    ENDTRY.


    " output
    LOOP AT conns INTO conn.
      out->write( conn->get_output( ) ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
