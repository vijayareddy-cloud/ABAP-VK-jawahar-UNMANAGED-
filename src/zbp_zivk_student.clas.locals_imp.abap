CLASS lhc_ZZIVK_STUDENT DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zzivk_student RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zzivk_student RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR zzivk_student RESULT result.

    METHODS setadmitted FOR MODIFY
      IMPORTING keys FOR ACTION zzivk_student~setadmitted RESULT result.

ENDCLASS.

CLASS lhc_ZZIVK_STUDENT IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD get_instance_features.

    READ ENTITIES OF zzivk_student IN LOCAL MODE
    ENTITY Student
    FIELDS ( Status ) WITH CORRESPONDING #( keys )
    RESULT DATA(Studentadmitted)
    FAILED failed.

    result =
    VALUE #(
    FOR stud IN Studentadmitted
    LET statusval = COND #( WHEN stud-Status = abap_true
                            THEN if_Abap_behv=>fc-o-disabled
                            ELSE if_Abap_behv=>fc-o-enabled    )

                            IN ( %tky = stud-%tky
                            %action-setAdmitted = statusval )
        ).

  ENDMETHOD.

  METHOD setAdmitted.

    MODIFY ENTITIES OF zzivk_student IN LOCAL MODE
    ENTITY Student
    UPDATE
    FIELDS ( Status )
    WITH VALUE #( FOR key IN keys ( %tky = key-%tky status = abap_true ) )
    FAILED failed
    REPORTED reported.

*//    get the response updated Record
    READ ENTITIES OF zzivk_student IN LOCAL MODE
    ENTITY Student
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(Studentdata).
    result = VALUE #( FOR Studentrec IN Studentdata
    ( %tky = Studentrec-%tky %param = Studentrec )
    ).

  ENDMETHOD.

ENDCLASS.
