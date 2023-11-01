@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ödev2 cds 2'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity znpeker_cdsodev2_2 as select from ZNPEKER_CDSODEV2 
{
   vbeln,
 @Semantics.amount.currencyCode: 'waerk'
   sum(conversion_netwr) as toplam_net,
   waerk,
   kunnr as ad ,
   count(*) as toplam_adet,
   division(cast(sum(conversion_netwr) as abap.dec(17,2)), count(*), 2) as ortalama_miktar,
    left( fkdat, 4) as FaturalamaYili ,
    substring( fkdat, 5, 2) as FaturalamaAyi,
    substring( fkdat, 7, 2) as FaturalamaGun,
    substring( inco2, 1, 3 ) as Incoterms
    
}
group by vbeln ,kunnr , fkdat,inco2,waerk
