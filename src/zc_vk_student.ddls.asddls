@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for student'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZC_VK_STUDENT
  as projection on ZZIVK_STUDENT as STUDENT
{
      @EndUserText.label: 'Student ID'
  key Id,
      @EndUserText.label: 'Firstname'
      Firstname,
      @EndUserText.label: 'Lastname'
      Lastname,
      @EndUserText.label: 'Age'
      Age,
      @EndUserText.label: 'Course'
      Course,
      @EndUserText.label: 'Courseduration'
      Courseduration,
      @EndUserText.label: 'Status'
      Status,
      @EndUserText.label: 'Gender'
      Gender,

      Genderdesc,
      @EndUserText.label: 'Dob'
      Dob,
      @EndUserText.label: 'Lastchangedat'
      Lastchangedat,
      @EndUserText.label: 'Locallastchangedat'
      Locallastchangedat
}
