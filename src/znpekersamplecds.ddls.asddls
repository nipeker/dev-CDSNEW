@AbapCatalog.sqlViewName: 'ZNPEKERSAMPLE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Egitim Sample CDS'
define view ZNPEKERSAMPLECDS 
as select from ekko 
inner join ekpo on ekpo.ebeln = ekko.ebeln
inner join mara on mara.matnr = ekpo.matnr
inner join makt on makt.matnr = mara.matnr
inner join lfa1 on lfa1.lifnr = ekko.lifnr
{
ekpo.ebeln as ebeln,
ekpo.ebelp as ebelp,
ekpo.matnr as matnr,
makt.maktx as maktx,
ekpo.werks as werks,
ekpo.lgort as lgort,
ekpo.meins as meins,
lfa1.lifnr as lifnr,
lfa1.name1 as name1,
concat(lfa1.stras,lfa1.mcod3) as satici_adresi
} where makt.spras = $session.system_language
