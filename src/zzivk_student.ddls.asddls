@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Entity view for student'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZZIVK_STUDENT
  as select from zvk_rap
  association to ZI_VK_GENDER as _gender on $projection.Gender = _gender.Value
{
  key id                  as Id,
      firstname           as Firstname,
      lastname            as Lastname,
      age                 as Age,
      course              as Course,
      courseduration      as Courseduration,
      status              as Status,
      gender              as Gender,
      dob                 as Dob,
      lastchangedat       as Lastchangedat,
      locallastchangedat  as Locallastchangedat,
      _gender,
      _gender.Description as Genderdesc
}
