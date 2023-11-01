@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ödev 2 cds'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZNPEKER_CDSODEV2
 as select from vbrp 
inner join vbrk on vbrk.vbeln = vbrp.vbeln
inner join mara on mara.matnr = vbrp.matnr
left outer join vbak on vbak.vbeln = vbrp.aubel
left outer join kna1 on kna1.kunnr = vbak.kunnr
left outer join makt on makt.matnr = vbrp.matnr
{
vbrp.vbeln ,
vbrp.posnr ,
vbrp.aubel ,
vbrp.aupos ,
vbak.kunnr ,
vbrk.waerk as waerk,
concat_with_space(kna1.name1,kna1.name2,1)  as kunnrAd,
@Semantics.amount.currencyCode: 'waerk'
vbrp.netwr as netwr,
@Semantics.amount.currencyCode: 'waerk'
currency_conversion( amount => vbrp.netwr,
                    source_currency => vbrk.waerk,
                    target_currency => cast('EUR' as abap.cuky) ,
                    exchange_rate_date => vbrk.fkdat ) as conversion_netwr,
substring(kna1.kunnr , 1,3 )  as left_kunnr,
length(vbrp.matnr) as matnr_length,
case vbrk.fkart 
    when 'FAS' then 'Peşinat talebi iptali'
    when 'FAZ' then 'Peşinat talebi'
    else 'Fatura'
 end as faturalama_turu,
 vbrk.fkdat,
 vbrk.inco2_l as inco2
}
