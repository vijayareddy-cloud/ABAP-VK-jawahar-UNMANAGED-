@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Domain course read'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZIVK_COURSE as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T(p_domain_name:'ZVK_RAP_COURSE_DE')
{
    key domain_name,
    key value_position,
    @Semantics.language: true
    key language,
    value_low,
    @Semantics.text: true
    text
}
