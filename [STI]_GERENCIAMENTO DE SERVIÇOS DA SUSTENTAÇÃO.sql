SELECT 
  SOS.CD_OS ,
  TRUNC(SOS.DT_PEDIDO) AS DT_INTEGRA,
  SOS.DT_PEDIDO ,
  DECODE (SOS.tp_situacao,'S','SOLICITACAO','F','AGENDADO','L','EM ATENDIMENTO','M','EM MATUENÇÃO','N','NÃO ATENDIDO','C','CONCLUIDO','D','CANCELADO','E','EXTERNO') AS STATUS ,
  SOS.DT_USUARIO_FECHA_OS ,
  MSV.CD_SERVICO ,
  MSV.NM_SERVICO ,
  SOS.DS_SERVICO ,
  CASE WHEN OFI.CD_SETOR IN (324,458) THEN 'UNIDADE BOA VIAGEM'
    WHEN OFI.CD_SETOR IN (18,24) THEN 'UNIDADE AGAMENON'
  END AS EMPRESA,
  SOS.CD_SETOR ,
  STR.NM_SETOR ,
  SOS.CD_OFICINA ,
  OFI.DS_OFICINA ,
  IOS.HR_INICIO ,
  IOS.HR_FINAL ,
  CASE
    WHEN MSV.CD_SERVICO = 10072 THEN 'CONFIG. IMPRESSORA'
    WHEN MSV.CD_SERVICO = 10077 THEN 'CONFIG. IMPRESSORA'
    WHEN MSV.CD_SERVICO = 11352 THEN 'CONFIG. IMPRESSORA'
    WHEN MSV.CD_SERVICO = 11354 THEN 'CONFIG. IMPRESSORA'
    WHEN MSV.CD_SERVICO = 10074 THEN 'CONFIG. PROGRAMA'
    WHEN MSV.CD_SERVICO = 10092 THEN 'CONFIG. PROGRAMA'
    WHEN MSV.CD_SERVICO = 10118 THEN 'CONFIG. PROGRAMA'
    WHEN MSV.CD_SERVICO = 11358 THEN 'CONFIG. PROGRAMA'
    WHEN MSV.CD_SERVICO = 11570 THEN 'CONFIG. PROGRAMA'
    WHEN MSV.CD_SERVICO = 11577 THEN 'CONFIG. PROGRAMA'
    WHEN MSV.CD_SERVICO = 11589 THEN 'CONFIG. PROGRAMA'
    WHEN MSV.CD_SERVICO = 11591 THEN 'CONFIG. PROGRAMA'
    WHEN MSV.CD_SERVICO = 11592 THEN 'CONFIG. PROGRAMA'
    WHEN MSV.CD_SERVICO = 11593 THEN 'CONFIG. PROGRAMA'
    WHEN MSV.CD_SERVICO = 11343 THEN 'CONFIG. SCANNER'
    WHEN MSV.CD_SERVICO = 10058 THEN 'MANUT. DESKTOP'
    WHEN MSV.CD_SERVICO = 10079 THEN 'MANUT. DESKTOP'
    WHEN MSV.CD_SERVICO = 10113 THEN 'MANUT. DESKTOP'
    WHEN MSV.CD_SERVICO = 11335 THEN 'MANUT. DESKTOP'
    WHEN MSV.CD_SERVICO = 11338 THEN 'MANUT. DESKTOP'
    WHEN MSV.CD_SERVICO = 10060 THEN 'ORIENTAÇÃO'
    WHEN MSV.CD_SERVICO = 11369 THEN 'OUTROS'
    WHEN MSV.CD_SERVICO = 10070 THEN 'PERIFÉRICOS'
    WHEN MSV.CD_SERVICO = 10071 THEN 'PERIFÉRICOS'
    WHEN MSV.CD_SERVICO = 10073 THEN 'PERIFÉRICOS'
    WHEN MSV.CD_SERVICO = 10119 THEN 'PERIFÉRICOS'
    WHEN MSV.CD_SERVICO = 11291 THEN 'PERIFÉRICOS'
    WHEN MSV.CD_SERVICO = 11345 THEN 'PERIFÉRICOS'
    WHEN MSV.CD_SERVICO = 11345 THEN 'PERIFÉRICOS'
    WHEN MSV.CD_SERVICO = 11374 THEN 'PERIFÉRICOS'
    WHEN MSV.CD_SERVICO = 11375 THEN 'PERIFÉRICOS'
    WHEN MSV.CD_SERVICO = 11377 THEN 'PERIFÉRICOS'
    WHEN MSV.CD_SERVICO = 11590 THEN 'PERIFÉRICOS'
    WHEN MSV.CD_SERVICO = 11339 THEN 'REDE TELEFONIA'
    WHEN MSV.CD_SERVICO = 11572 THEN 'RETORNO OS'
    WHEN MSV.CD_SERVICO = 10087 THEN 'TOTEM & PAINEL'
    WHEN MSV.CD_SERVICO = 10088 THEN 'TOTEM & PAINEL'
    WHEN MSV.CD_SERVICO = 11342 THEN 'TOTEM & PAINEL'
    WHEN MSV.CD_SERVICO = 11571 THEN 'TOTEM & PAINEL'
    ELSE 'NÃO MAPEADO'
  END DS_AGRUPAMENTO
  
FROM
  DBAMV.SOLICITACAO_OS SOS,
  DBAMV.ITSOLICITACAO_OS IOS,
  DBAMV.OFICINA OFI,
  DBAMV.SETOR STR,
  DBAMV.MANU_SERV MSV
  
WHERE SOS.CD_OFICINA   = OFI.CD_OFICINA
AND SOS.CD_SETOR       = STR.CD_SETOR
AND MSV.CD_SERVICO (+) = IOS.CD_SERVICO
AND IOS.CD_OS (+)      = SOS.CD_OS

AND SOS.DT_PEDIDO BETWEEN To_Date('01/01/2023', 'dd/mm/yyyy') AND sysdate
AND (SOS.CD_OFICINA IN (162,158,157,160,161,188,187) --UNIDADE AGAMENOM
OR SOS.CD_OFICINA IN (100,101,102,165,172)) --UNIDADE BV

ORDER BY STR.NM_SETOR ASC, MSV.NM_SERVICO ASC;