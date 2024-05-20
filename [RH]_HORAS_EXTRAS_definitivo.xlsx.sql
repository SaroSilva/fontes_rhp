SELECT
    substr (AHV.Identificador,29) Cd_registro,
    AHT.NAME_ AS DESCRICAO_ETAPA,
    AHT.ASSIGNEE_ AS ATRIBUIDO,
    TO_CHAR (AHT.START_TIME_, 'DD/MM/YYYY HH24:MI:ss') AS DT_INICIO,
    TO_CHAR (AHT.END_TIME_, 'DD/MM/YYYY HH24:MI:ss') AS DT_FINAL,
    TRUNC(AHT.DURATION_ / (1000 * 60 * 60)) || ':' || LPAD(TRUNC(AHT.DURATION_ / (1000 * 60)), 2, '0') || ':' || LPAD(MOD(AHT.DURATION_, (1000 * 60)), 2, '0') AS SLA,
    --AHV.Identificador,
    AHV.DRT,
    AHV.Nome_Colaborador,
    --AHV.Data_Solicitacao,
    AHV.Cargo_Colaborador,
    AHV.Setor,
    AHV.Periodo,
    AHV.Id_solicitante,
    AHV.Cargo_Solicitante,
    AHV.Email_Solicitante,
    AHV.Email_Gestor_Imediato,
    AHV.Email_Superintendente,
    AHV.Total_HR_ExtPer,
    AHV.Resp_Imediato,
    AHV.Justificativa_Recusa,
    AHV.Resp_Superintendente,
    AHV.Justificativa_Recusa_Sup,
    AHV.DIA01,
    AHV.D01HI,
    AHV.D01HS,
    AHV.D01JUS,
    AHV.DIA02,
    AHV.D02HI,
    AHV.D02HS,
    AHV.D02JUS,
    AHV.DIA03,
    AHV.D03HI,
    AHV.D03HS,
    AHV.D03JUS,
    AHV.DIA04,
    AHV.D04HI,
    AHV.D04HS,
    AHV.D04JUS,
    AHV.DIA05,
    AHV.D05HI,
    AHV.D05HS,
    AHV.D05JUS,
    AHV.DIA06,
    AHV.D06HI,
    AHV.D06HS,
    AHV.D06JUS,
    AHV.DIA07,
    AHV.D07HI,
    AHV.D07HS,
    AHV.D07JUS,
    AHV.DIA08,
    AHV.D08HI,
    AHV.D08HS,
    AHV.D08JUS,
    AHV.DIA09,
    AHV.D09HI,
    AHV.D09HS,
    AHV.D09JUS,
    AHV.DIA10,
    AHV.D10HI,
    AHV.D10HS,
    AHV.D10JUS,
    AHV.DIA11,
    AHV.D11HI,
    AHV.D11HS,
    AHV.D11JUS,
    AHV.DIA12,
    AHV.D12HI,
    AHV.D12HS,
    AHV.D12JUS,
    AHV.DIA13,
    AHV.D13HI,
    AHV.D13HS,
    AHV.D13JUS,
    AHV.DIA14,
    AHV.D14HI,
    AHV.D14HS,
    AHV.D14JUS,
    AHV.DIA15,
    AHV.D15HI,
    AHV.D15HS,
    AHV.D15JUS,
    AHV.DIA16,
    AHV.D16HI,
    AHV.D16HS,
    AHV.D16JUS,
    AHV.DIA17,
    AHV.D17HI,
    AHV.D17HS,
    AHV.D17JUS,
    AHV.DIA18,
    AHV.D18HI,
    AHV.D18HS,
    AHV.D18JUS,
    AHV.DIA19,
    AHV.D19HI,
    AHV.D19HS,
    AHV.D19JUS,
    AHV.DIA20,
    AHV.D20HI,
    AHV.D20HS,
    AHV.D20JUS
FROM
    (
        select
            *
        from
            (
                select
                    PROC_INST_ID_,
                    name_,
                    TEXT_
                from
                    engine.act_hi_varinst
                order by
                    2
            ) ahv PIVOT (
                MAX(TEXT_) FOR name_ IN (
                    'BUSINESS_KEY_CASE_INSENSITIVE' as Identificador,
                    'MATRICULA389' as DRT,
                    'NOME_DO_SUBSTITUIDO_OU_DESLIGADO837' as Nome_Colaborador,
                    'DARA916' as Data_Solicitacao,
                    'CARGO979' as Cargo_Colaborador,
                    'SETOR47' as Setor,
                    'PERIODO558' as Periodo,
                    'INSTANCE_USER' as Id_solicitante,
                    'TIPO_SOLICITANTE68' as Cargo_Solicitante,
                    'EMAIL_SOLICI_HEEXT783' as Email_Solicitante,
                    'EMAIL_GERENTE_IMEDIATO704' as Email_Gestor_Imediato,
                    'EMAIL_DO_APROV' as Email_Superintendente,
                    'HORAS_EXTRAS937' as Total_HR_ExtPer,
                    'APROVA_HORAS_EXTRAS303' as Resp_Imediato,
                    'JUSTIFICATIVA_NAO_HE258' as Justificativa_Recusa,
                    'APROVACAO_DE_HORAS_EXTRAS261' as Resp_Superintendente,
                    'JUSTIFICATIVA_NAO_APRO_HORAS_EXTRAS620' as Justificativa_Recusa_Sup,
                    'DIAS928' as DIA01,
                    'HORA_INICIO1776' as D01HI,
                    'HORA_SAIDA1658' as D01HS,
                    'JUSTIFICATIVA1264' as D01JUS,
                    'DIA_2604' as DIA02,
                    'HORA_INICIO417' as D02HI,
                    'HORA_SAIDA843' as D02HS,
                    'JUSTIFICATIVA12142' as D02JUS,
                    'DIA_HORA_EXTRA1156' as DIA03,
                    'HORA2931' as D03HI,
                    'HORAS2732' as D03HS,
                    'JUSTIFICATIVA4192' as D03JUS,
                    'DIA4295' as DIA04,
                    'HORA_479' as D04HI,
                    'HORAS4297' as D04HS,
                    'JUSTIFICATIVA4458' as D04JUS,
                    'DIA5824' as DIA05,
                    'HORA5361' as D05HI,
                    'HORAS5210' as D05HS,
                    'JUSTIFICATIVA5365' as D05JUS,
                    'DIA6949' as DIA06,
                    'HORA6989' as D06HI,
                    'HORAS6225' as D06HS,
                    'JUSTIFICATIVA6436' as D06JUS,
                    'DIA7662' as DIA07,
                    'HORA7718' as D07HI,
                    'HORAS7354' as D07HS,
                    'JUSTIFICATIVA7804' as D07JUS,
                    'DIA8302' as DIA08,
                    'HORA8497' as D08HI,
                    'HORAS8832' as D08HS,
                    'JUSTIFICATIVA874' as D08JUS,
                    'DIA9148' as DIA09,
                    'HORA9598' as D09HI,
                    'DIAS9153' as D09HS,
                    'JUSTIFICATIVA9163' as D09JUS,
                    'DIA10332' as DIA10,
                    'HORA10975' as D10HI,
                    'HORAS10460' as D10HS,
                    'JUSTIFICATIVA10417' as D10JUS,
                    'DIA_11563' as DIA11,
                    'HORA_11159' as D11HI,
                    'HR_1146' as D11HS,
                    'JUSTIFICATIVA11949' as D11JUS,
                    'DIA_12501' as DIA12,
                    'HORA_12154' as D12HI,
                    'HR2575' as D12HS,
                    'JUT12471' as D12JUS,
                    'DIA_13318' as DIA13,
                    'HORA_13450' as D13HI,
                    'HR_3588' as D13HS,
                    'JUT13977' as D13JUS,
                    'DIA_14490' as DIA14,
                    'HORA_14922' as D14HI,
                    'HR14275' as D14HS,
                    'JUST14792' as D14JUS,
                    'DIA_15765' as DIA15,
                    'HORA_15610' as D15HI,
                    'HR1535' as D15HS,
                    'JUST15729' as D15JUS,
                    'DIA_16815' as DIA16,
                    'HORA_16365' as D16HI,
                    'HR16164' as D16HS,
                    'JUST16887' as D16JUS,
                    'DIA_1785' as DIA17,
                    'HORA_17192' as D17HI,
                    'HR17951' as D17HS,
                    'JUST1761' as D17JUS,
                    'DIA_18304' as DIA18,
                    'HORA_18617' as D18HI,
                    'HR18371' as D18HS,
                    'JUST18901' as D18JUS,
                    'DIA_19314' as DIA19,
                    'HORA_19445' as D19HI,
                    'HRR1912' as D19HS,
                    'JUST19904' as D19JUS,
                    'DIA_20689' as DIA20,
                    'HORA_20539' as D20HI,
                    'HR20322' as D20HS,
                    'JUST20586' as D20JUS
                )
            )
        where
            UPPER (identificador) like UPPER ('solicitação de horas extras-%')
    ) AHV,
    ENGINE.ACT_HI_TASKINST AHT
WHERE
    AHT.PROC_INST_ID_ = AHV.PROC_INST_ID_
    AND TRUNC (AHT.START_TIME_) BETWEEN TO_DATE ('01/03/2024', 'DD/MM/YYYY')
    AND TRUNC (SYSDATE)+1 
    --AND (AHV.Id_solicitante = '%' OR '%'='%')
    --AND (AHV.DRT = '29335%' OR '%'='%')
    AND AHV.DRT LIKE '%29335%'
    --  AND AHV.Id_solicitante = '28403'

ORDER BY
    AHT.START_TIME_ DESC
    ;