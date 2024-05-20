/*CRIADO POR MASSARO J�NIO DE ACORDO COM A SOLICITA��O DO REDMINE 6548*/
SELECT 
CD_REGISTRO,
/*CD_ATENDIMENTO,
CD_DOC,
CD_USUARIO,
TRUNC (DH_FECHAMENTO) AS DT_FECHAMENTO,
DH_FECHAMENTO,
CASE 
  WHEN SN_BARREIRA_N = 'true' THEN 'N�O' 
  WHEN SN_BARREIRA_S = 'true' THEN 'SIM'
  ELSE 'S/ RESPOSTA'
END AS SN_IDBARREIRA,

--IDENTIFICA��O RELACIOANADAS A VISUAL
CASE 
  WHEN TP_CEGUEIRA = 'true' THEN 'SIM' ELSE 'N�O'         --WHEN TP_CEGUEIRA = 'false' THEN 'N�O'
END AS SN_VISAO_CEGUEIRA,
CASE  
  WHEN TP_DIMINUICAO = 'true' THEN 'SIM' ELSE 'N�O'       --WHEN TP_DIMINUICAO = 'false' THEN 'N�O'
END AS SN_VISAO_DIM,
CASE  
  WHEN TP_PROTESE_OCULAR = 'true' THEN 'SIM' ELSE 'N�O'   --WHEN TP_PROTESE_OCULAR = 'false' THEN 'N�O'
END AS SN_VISAO_PROTESE,

--IDENTIFICA��O RELACIOANADAS A AUDITIVA
CASE  
  WHEN TP_AUDICAO = 'true' THEN 'SIM' ELSE 'N�O'   --WHEN TP_AUDICAO = 'false' THEN 'N�O'
END AS SN_AUDICAO_SURDEZ,
CASE  
  WHEN TP_DIMINUICAO_1 = 'true' THEN 'SIM' ELSE 'N�O'   --WHEN TP_DIMINUICAO_1 = 'false' THEN 'N�O'
END AS SN_AUDICAO_DIM,

--IDENTIFICA��O RELACIOANADAS A FALA
CASE 
  WHEN TP_AFASICO = 'true' THEN 'SIM' ELSE 'N�O'          --WHEN TP_AFASICO = 'false' THEN 'N�O'
END AS SN_FALA_AFASICO,
CASE 
  WHEN TP_DIFASICO = 'true' THEN 'SIM' ELSE 'N�O'         --WHEN TP_DIFASICO = 'false' THEN 'N�O'
END AS SN_FALA_DIFASICO,

--IDENTIFICA��O RELACIOANADAS A OUTRAS BARREIRAS
CASE 
  WHEN TP_EMOCIONAL = 'true' THEN 'SIM' ELSE 'N�O'         --WHEN TP_EMOCIONAL = 'false' THEN 'N�O'
END AS SN_OUTRAS_EMOCIONAL,
CASE 
  WHEN TP_IDIOMA = 'true' THEN 'SIM' ELSE 'N�O'            --WHEN TP_IDIOMA = 'false' THEN 'N�O'
END AS SN_OUTRAS_CULT_IDIOMA,
CASE 
  WHEN TP_PSICOMOTORA = 'true' THEN 'SIM' ELSE 'N�O'       --WHEN TP_PSICOMOTORA = 'false' THEN 'N�O'
END AS SN_OUTRAS_PSICOMOTORA,
CASE 
  WHEN TP_PSICOMOTORA = 'true' THEN 'SIM' ELSE 'N�O'       --WHEN TP_PSICOMOTORA = 'false' THEN 'N�O'
END AS SN_OUTRAS_PSICOMOTORA,
CASE 
  WHEN TP_RELIGI�O = 'true' THEN 'SIM' ELSE 'N�O'          --WHEN TP_RELIGI�O = 'false' THEN 'N�O'
END AS SN_OUTRAS_RELIGAO,
TP_OUTRAS_BARREIRAS AS DS_OUTRAS_BARREIRAS,

--CRIT�RIOS DO PLANO DE ALTA HOSPITALAR
CASE 
  WHEN SN_AUX_AUTOCUIDADO = 'true' THEN 'SIM' ELSE 'N�O'          --WHEN SN_AUX_AUTOCUIDADO = 'false' THEN 'N�O'
END AS SN_AUX_AUTOCUIDADO,
CASE 
  WHEN TP_MOB_FISICA_PREJ = 'true' THEN 'SIM' ELSE 'N�O'          --WHEN TP_MOB_FISICA_PREJ = 'false' THEN 'N�O'
END AS SN_MOB_FISICA_PREJ,
CASE 
  WHEN SN_MED_CUID_CONTINUOS = 'true' THEN 'SIM' ELSE 'N�O'       --WHEN SN_MED_CUID_CONTINUOS = 'false' THEN 'N�O'
END AS SN_MED_CUID_CONTINUOS,
CASE 
  WHEN TP_CUIDADO_RN = 'true' THEN 'SIM' ELSE 'N�O'               --WHEN TP_CUIDADO_RN = 'false' THEN 'N�O'
END AS SN_CUIDADO_RN,

--NECESSIDADES IDENTIFICADAS PARA ALTA HOSPITALAR
TP_EQUIPAMENTOS AS DS_EQUIPAMETOS,
DS_OUTROS,

--INFORMA��ES REFERENTE AO GRUPO 01
TO_DATE (DH_PLANO_ALTA_01) AS DT_PLANO_ALTA_01,
DH_PLANO_ALTA_01,
NR_FOCO_EDUC_PLANO_01,
CASE 
  WHEN UPPER (TP_FOCO_EDUC_01) IN ('EPF','EAH') THEN DECODE (UPPER (TP_FOCO_EDUC_01), 'EPF','Educa��o de Pacientes e Familiares', 'EAH', 'Educa��o de Alta Hospitalar') 
  ELSE TO_CHAR (TP_FOCO_EDUC_01) END AS DS_FOCO_EDUC_01,

CASE
  WHEN UPPER (TP_CLIENTE_PLANO_01) IN ('PA','CD','F','C','O') THEN DECODE (UPPER (TP_CLIENTE_PLANO_01),'PA','Paciente','CD','Cuidador','F','Filho','C','C�njuge','O','Outros') 
  ELSE TO_CHAR (TP_CLIENTE_PLANO_01) END AS DS_CLIENTE_PLANO_01,

CASE 
  WHEN UPPER (SN_INFO_ALTA_HOSP_01) IN ('S','N') THEN DECODE(UPPER (SN_INFO_ALTA_HOSP_01),'S','Sim','N','N�o') 
  ELSE TO_CHAR (SN_INFO_ALTA_HOSP_01) END AS SN_INFO_ALTA_HOSP_01,

CASE 
  WHEN UPPER (DS_METODO_PLANO_01) IN ('D','M','F','V','A','O') THEN DECODE (UPPER (DS_METODO_PLANO_01),'D','Demonstra��o','M','Manual do Paciente','F','Folhetos','V','Verbal','A','Audio Visual','O','Outros') 
  ELSE TO_CHAR (DS_METODO_PLANO_01) END AS DS_METODO_PLANO_01,

CASE
  WHEN UPPER (SN_ENTENDIMENTO_PLANO_01) IN ('V','R','VN') THEN DECODE (UPPER (SN_ENTENDIMENTO_PLANO_01),'V','Verbaliza entendimento','R','Refor�o','VN','Verbaliza N�o entedimento')
  ELSE TO_CHAR (SN_ENTENDIMENTO_PLANO_01) END AS DS_ENTENDIMENTO_PLANO_01,
  
CASE 
  WHEN UPPER (TP_PROF_PLANO_01) IN ('E','FI','P','AS','FA','N','FO','O','OD','ME') THEN DECODE(UPPER (TP_PROF_PLANO_01),'E','Enfermeiro','FI','Fisioterapia','P','Psic�logo','AS','Assistencia Social','FA','Farmac�utico','N','Nutricionista','FO','Fonoaudiologo','O','Outros','OD','Odont�logo','ME','M�dicos')
  ELSE TO_CHAR(TP_PROF_PLANO_01) END AS DS_PROF_PLANO_01,
  NM_PRESTADOR_01,

--INFORMA��ES REFERENTE AO GRUPO 02
TO_DATE (DH_PLANO_ALTA_02) AS DT_PLANO_ALTA_02,
HR_PLANO_ALTA_02,
NR_FOCO_EDUC_PLANO_02,
CASE 
  WHEN UPPER (TP_FOCO_EDUC_02) IN ('EPF','EAH') THEN DECODE (UPPER (TP_FOCO_EDUC_02), 'EPF','Educa��o de Pacientes e Familiares', 'EAH', 'Educa��o de Alta Hospitalar') 
  ELSE TO_CHAR (TP_FOCO_EDUC_02) END AS DS_FOCO_EDUC_02,

CASE
  WHEN UPPER (TP_CLIENTE_PLANO_02) IN ('PA','CD','F','C','O') THEN DECODE (UPPER (TP_CLIENTE_PLANO_02),'PA','Paciente','CD','Cuidador','F','Filho','C','C�njuge','O','Outros') 
  ELSE TO_CHAR (TP_CLIENTE_PLANO_02) END AS DS_CLIENTE_PLANO_02,

CASE 
  WHEN UPPER (SN_INFO_ALTA_HOSP_02) IN ('S','N') THEN DECODE(UPPER (SN_INFO_ALTA_HOSP_02),'S','Sim','N','N�o') 
  ELSE TO_CHAR (SN_INFO_ALTA_HOSP_02) END AS SN_INFO_ALTA_HOSP_02,

CASE 
  WHEN UPPER (DS_METODO_PLANO_02) IN ('D','M','F','V','A','O') THEN DECODE (UPPER (DS_METODO_PLANO_02),'D','Demonstra��o','M','Manual do Paciente','F','Folhetos','V','Verbal','A','Audio Visual','O','Outros') 
  ELSE TO_CHAR (DS_METODO_PLANO_02) END AS DS_METODO_PLANO_02,

CASE
  WHEN UPPER (SN_ENTENDIMENTO_PLANO_02) IN ('V','R','VN') THEN DECODE (UPPER (SN_ENTENDIMENTO_PLANO_02),'V','Verbaliza entendimento','R','Refor�o','VN','Verbaliza N�o entedimento')
  ELSE TO_CHAR (SN_ENTENDIMENTO_PLANO_02) END AS DS_ENTENDIMENTO_PLANO_02,
  
CASE 
  WHEN UPPER (TP_PROF_PLANO_02) IN ('E','FI','P','AS','FA','N','FO','O','OD','ME') THEN DECODE(UPPER (TP_PROF_PLANO_02),'E','Enfermeiro','FI','Fisioterapia','P','Psic�logo','AS','Assistencia Social','FA','Farmac�utico','N','Nutricionista','FO','Fonoaudiologo','O','Outros','OD','Odont�logo','ME','M�dicos')
  ELSE TO_CHAR(TP_PROF_PLANO_02) END AS DS_PROF_PLANO_02,
NM_PRESTADOR_02,

--INFORMA��ES REFERENTE AO GRUPO 03
TO_DATE (DH_PLANO_ALTA_03) AS DT_PLANO_ALTA_03,
HR_PLANO_ALTA_03,
NR_FOCO_EDUC_PLANO_03,
CASE 
  WHEN UPPER (TP_FOCO_EDUC_03) IN ('EPF','EAH') THEN DECODE (UPPER (TP_FOCO_EDUC_03), 'EPF','Educa��o de Pacientes e Familiares', 'EAH', 'Educa��o de Alta Hospitalar') 
  ELSE TO_CHAR (TP_FOCO_EDUC_03) END AS DS_FOCO_EDUC_03,

CASE
  WHEN UPPER (TP_CLIENTE_PLANO_03) IN ('PA','CD','F','C','O') THEN DECODE (UPPER (TP_CLIENTE_PLANO_03),'PA','Paciente','CD','Cuidador','F','Filho','C','C�njuge','O','Outros') 
  ELSE TO_CHAR (TP_CLIENTE_PLANO_03) END AS DS_CLIENTE_PLANO_03,

CASE 
  WHEN UPPER (SN_INFO_ALTA_HOSP_03) IN ('S','N') THEN DECODE(UPPER (SN_INFO_ALTA_HOSP_03),'S','Sim','N','N�o') 
  ELSE TO_CHAR (SN_INFO_ALTA_HOSP_03) END AS SN_INFO_ALTA_HOSP_03,

CASE 
  WHEN UPPER (DS_METODO_PLANO_03) IN ('D','M','F','V','A','O') THEN DECODE (UPPER (DS_METODO_PLANO_03),'D','Demonstra��o','M','Manual do Paciente','F','Folhetos','V','Verbal','A','Audio Visual','O','Outros') 
  ELSE TO_CHAR (DS_METODO_PLANO_03) END AS DS_METODO_PLANO_03,

CASE
  WHEN UPPER (SN_ENTENDIMENTO_PLANO_03) IN ('V','R','VN') THEN DECODE (UPPER (SN_ENTENDIMENTO_PLANO_03),'V','Verbaliza entendimento','R','Refor�o','VN','Verbaliza N�o entedimento')
  ELSE TO_CHAR (SN_ENTENDIMENTO_PLANO_03) END AS DS_ENTENDIMENTO_PLANO_03,
  
CASE 
  WHEN UPPER (TP_PROF_PLANO_03) IN ('E','FI','P','AS','FA','N','FO','O','OD','ME') THEN DECODE(UPPER (TP_PROF_PLANO_03),'E','Enfermeiro','FI','Fisioterapia','P','Psic�logo','AS','Assistencia Social','FA','Farmac�utico','N','Nutricionista','FO','Fonoaudiologo','O','Outros','OD','Odont�logo','ME','M�dicos')
  ELSE TO_CHAR(TP_PROF_PLANO_03) END AS DS_PROF_PLANO_03,
NM_PRESTADOR_03,


--INFORMA��ES REFERENTE AO GRUPO 04
TO_DATE (DH_PLANO_ALTA_04) AS DT_PLANO_ALTA_04,
HR_PLANO_ALTA_04,
NR_FOCO_EDUC_PLANO_04,
CASE 
  WHEN UPPER (TP_FOCO_EDUC_04) IN ('EPF','EAH') THEN DECODE (UPPER (TP_FOCO_EDUC_04), 'EPF','Educa��o de Pacientes e Familiares', 'EAH', 'Educa��o de Alta Hospitalar') 
  ELSE TO_CHAR (TP_FOCO_EDUC_04) END AS DS_FOCO_EDUC_04,

CASE
  WHEN UPPER (TP_CLIENTE_PLANO_04) IN ('PA','CD','F','C','O') THEN DECODE (UPPER (TP_CLIENTE_PLANO_04),'PA','Paciente','CD','Cuidador','F','Filho','C','C�njuge','O','Outros') 
  ELSE TO_CHAR (TP_CLIENTE_PLANO_04) END AS DS_CLIENTE_PLANO_04,

CASE 
  WHEN UPPER (SN_INFO_ALTA_HOSP_04) IN ('S','N') THEN DECODE(UPPER (SN_INFO_ALTA_HOSP_04),'S','Sim','N','N�o') 
  ELSE TO_CHAR (SN_INFO_ALTA_HOSP_04) END AS SN_INFO_ALTA_HOSP_04,

CASE 
  WHEN UPPER (DS_METODO_PLANO_04) IN ('D','M','F','V','A','O') THEN DECODE (UPPER (DS_METODO_PLANO_04),'D','Demonstra��o','M','Manual do Paciente','F','Folhetos','V','Verbal','A','Audio Visual','O','Outros') 
  ELSE TO_CHAR (DS_METODO_PLANO_04) END AS DS_METODO_PLANO_04,

CASE
  WHEN UPPER (SN_ENTENDIMENTO_PLANO_04) IN ('V','R','VN') THEN DECODE (UPPER (SN_ENTENDIMENTO_PLANO_04),'V','Verbaliza entendimento','R','Refor�o','VN','Verbaliza N�o entedimento')
  ELSE TO_CHAR (SN_ENTENDIMENTO_PLANO_04) END AS DS_ENTENDIMENTO_PLANO_04,
  
CASE 
  WHEN UPPER (TP_PROF_PLANO_04) IN ('E','FI','P','AS','FA','N','FO','O','OD','ME') THEN DECODE(UPPER (TP_PROF_PLANO_04),'E','Enfermeiro','FI','Fisioterapia','P','Psic�logo','AS','Assistencia Social','FA','Farmac�utico','N','Nutricionista','FO','Fonoaudiologo','O','Outros','OD','Odont�logo','ME','M�dicos')
  ELSE TO_CHAR(TP_PROF_PLANO_04) END AS DS_PROF_PLANO_04,
NM_PRESTADOR_04,


--INFORMA��ES REFERENTE AO GRUPO 05
TO_DATE (DH_PLANO_ALTA_05) AS DT_PLANO_ALTA_05,
HR_PLANO_ALTA_05,
NR_FOCO_EDUC_PLANO_05,
CASE 
  WHEN UPPER (TP_FOCO_EDUC_05) IN ('EPF','EAH') THEN DECODE (UPPER (TP_FOCO_EDUC_05), 'EPF','Educa��o de Pacientes e Familiares', 'EAH', 'Educa��o de Alta Hospitalar') 
  ELSE TO_CHAR (TP_FOCO_EDUC_05) END AS DS_FOCO_EDUC_05,

CASE
  WHEN UPPER (TP_CLIENTE_PLANO_05) IN ('PA','CD','F','C','O') THEN DECODE (UPPER (TP_CLIENTE_PLANO_05),'PA','Paciente','CD','Cuidador','F','Filho','C','C�njuge','O','Outros') 
  ELSE TO_CHAR (TP_CLIENTE_PLANO_05) END AS DS_CLIENTE_PLANO_05,

CASE 
  WHEN UPPER (SN_INFO_ALTA_HOSP_05) IN ('S','N') THEN DECODE(UPPER (SN_INFO_ALTA_HOSP_05),'S','Sim','N','N�o') 
  ELSE TO_CHAR (SN_INFO_ALTA_HOSP_05) END AS SN_INFO_ALTA_HOSP_05,

CASE 
  WHEN UPPER (DS_METODO_PLANO_05) IN ('D','M','F','V','A','O') THEN DECODE (UPPER (DS_METODO_PLANO_05),'D','Demonstra��o','M','Manual do Paciente','F','Folhetos','V','Verbal','A','Audio Visual','O','Outros') 
  ELSE TO_CHAR (DS_METODO_PLANO_05) END AS DS_METODO_PLANO_05,

CASE
  WHEN UPPER (SN_ENTENDIMENTO_PLANO_05) IN ('V','R','VN') THEN DECODE (UPPER (SN_ENTENDIMENTO_PLANO_05),'V','Verbaliza entendimento','R','Refor�o','VN','Verbaliza N�o entedimento')
  ELSE TO_CHAR (SN_ENTENDIMENTO_PLANO_05) END AS DS_ENTENDIMENTO_PLANO_05,
  
CASE 
  WHEN UPPER (TP_PROF_PLANO_05) IN ('E','FI','P','AS','FA','N','FO','O','OD','ME') THEN DECODE(UPPER (TP_PROF_PLANO_05),'E','Enfermeiro','FI','Fisioterapia','P','Psic�logo','AS','Assistencia Social','FA','Farmac�utico','N','Nutricionista','FO','Fonoaudiologo','O','Outros','OD','Odont�logo','ME','M�dicos')
  ELSE TO_CHAR(TP_PROF_PLANO_05) END AS DS_PROF_PLANO_05,
NM_PRESTADOR_05,

--INFORMA��ES REFERENTE AO GRUPO 06
DH_PLANO_ALTA_06,
HR_PLANO_ALTA_06,
NR_FOCO_EDUC_PLANO_06,
CASE 
  WHEN UPPER (TP_FOCO_EDUC_06) IN ('EPF','EAH') THEN DECODE (UPPER (TP_FOCO_EDUC_06), 'EPF','Educa��o de Pacientes e Familiares', 'EAH', 'Educa��o de Alta Hospitalar') 
  ELSE TO_CHAR (TP_FOCO_EDUC_06) END AS DS_FOCO_EDUC_06,

CASE
  WHEN UPPER (TP_CLIENTE_PLANO_06) IN ('PA','CD','F','C','O') THEN DECODE (UPPER (TP_CLIENTE_PLANO_06),'PA','Paciente','CD','Cuidador','F','Filho','C','C�njuge','O','Outros') 
  ELSE TO_CHAR (TP_CLIENTE_PLANO_06) END AS DS_CLIENTE_PLANO_06,

CASE 
  WHEN UPPER (SN_INFO_ALTA_HOSP_06) IN ('S','N') THEN DECODE(UPPER (SN_INFO_ALTA_HOSP_06),'S','Sim','N','N�o') 
  ELSE TO_CHAR (SN_INFO_ALTA_HOSP_06) END AS SN_INFO_ALTA_HOSP_06,

CASE 
  WHEN UPPER (DS_METODO_PLANO_06) IN ('D','M','F','V','A','O') THEN DECODE (UPPER (DS_METODO_PLANO_06),'D','Demonstra��o','M','Manual do Paciente','F','Folhetos','V','Verbal','A','Audio Visual','O','Outros') 
  ELSE TO_CHAR (DS_METODO_PLANO_06) END AS DS_METODO_PLANO_06,

CASE
  WHEN UPPER (SN_ENTENDIMENTO_PLANO_06) IN ('V','R','VN') THEN DECODE (UPPER (SN_ENTENDIMENTO_PLANO_06),'V','Verbaliza entendimento','R','Refor�o','VN','Verbaliza N�o entedimento')
  ELSE TO_CHAR (SN_ENTENDIMENTO_PLANO_06) END AS DS_ENTENDIMENTO_PLANO_06,
  
CASE 
  WHEN UPPER (TP_PROF_PLANO_06) IN ('E','FI','P','AS','FA','N','FO','O','OD','ME') THEN DECODE(UPPER (TP_PROF_PLANO_06),'E','Enfermeiro','FI','Fisioterapia','P','Psic�logo','AS','Assistencia Social','FA','Farmac�utico','N','Nutricionista','FO','Fonoaudiologo','O','Outros','OD','Odont�logo','ME','M�dicos')
  ELSE TO_CHAR(TP_PROF_PLANO_06) END AS DS_PROF_PLANO_06,
NM_PRESTADOR_06,
*/
--INFORMA��ES REFERENTE AO GRUPO 06
DH_PLANO_ALTA_06,
HR_PLANO_ALTA_06,
NR_FOCO_EDUC_PLANO_06,
CASE 
  WHEN UPPER (TP_FOCO_EDUC_06) IN ('EPF','EAH') THEN DECODE (UPPER (TP_FOCO_EDUC_06), 'EPF','Educa��o de Pacientes e Familiares', 'EAH', 'Educa��o de Alta Hospitalar') 
  ELSE TO_CHAR (TP_FOCO_EDUC_06) END AS DS_FOCO_EDUC_06,

CASE
  WHEN UPPER (TP_CLIENTE_PLANO_06) IN ('PA','CD','F','C','O') THEN DECODE (UPPER (TP_CLIENTE_PLANO_06),'PA','Paciente','CD','Cuidador','F','Filho','C','C�njuge','O','Outros') 
  ELSE TO_CHAR (TP_CLIENTE_PLANO_06) END AS DS_CLIENTE_PLANO_06,

CASE 
  WHEN UPPER (SN_INFO_ALTA_HOSP_06) IN ('S','N') THEN DECODE(UPPER (SN_INFO_ALTA_HOSP_06),'S','Sim','N','N�o') 
  ELSE TO_CHAR (SN_INFO_ALTA_HOSP_06) END AS SN_INFO_ALTA_HOSP_06,

CASE 
  WHEN UPPER (DS_METODO_PLANO_06) IN ('D','M','F','V','A','O') THEN DECODE (UPPER (DS_METODO_PLANO_06),'D','Demonstra��o','M','Manual do Paciente','F','Folhetos','V','Verbal','A','Audio Visual','O','Outros') 
  ELSE TO_CHAR (DS_METODO_PLANO_06) END AS DS_METODO_PLANO_06,

CASE
  WHEN UPPER (SN_ENTENDIMENTO_PLANO_06) IN ('V','R','VN') THEN DECODE (UPPER (SN_ENTENDIMENTO_PLANO_06),'V','Verbaliza entendimento','R','Refor�o','VN','Verbaliza N�o entedimento')
  ELSE TO_CHAR (SN_ENTENDIMENTO_PLANO_06) END AS DS_ENTENDIMENTO_PLANO_06,
  
CASE 
  WHEN UPPER (TP_PROF_PLANO_06) IN ('E','FI','P','AS','FA','N','FO','O','OD','ME') THEN DECODE(UPPER (TP_PROF_PLANO_06),'E','Enfermeiro','FI','Fisioterapia','P','Psic�logo','AS','Assistencia Social','FA','Farmac�utico','N','Nutricionista','FO','Fonoaudiologo','O','Outros','OD','Odont�logo','ME','M�dicos')
  ELSE TO_CHAR(TP_PROF_PLANO_06) END AS DS_PROF_PLANO_06,

DH_PLANO_ALTA_08,
DS_METODO_PLANO_08,
HR_PLANO_ALTA_08,
NM_PRESTADOR_08,
NR_FOCO_EDUC_PLANO_08,
SN_ENTENDIMENTO_PLANO_08,
SN_INFO_ALTA_HOSP_08,
TP_CLIENTE_PLANO_08,
TP_FOCO_EDUC_08,
TP_PROF_PLANO_08,

DH_PLANO_ALTA_09,
DS_METODO_PLANO_09,
HR_PLANO_ALTA_09,
NM_PRESTADOR_09,
NR_FOCO_EDUC_PLANO_09,
SN_ENTENDIMENTO_PLANO_09,
SN_INFO_ALTA_HOSP_09,
TP_CLIENTE_PLANO_09,
TP_FOCO_EDUC_09,
TP_PROF_PLANO_09,

DH_PLANO_ALTA_10,
DS_METODO_PLANO_10,
HR_PLANO_ALTA_10,
NM_PRESTADOR_10,
NR_FOCO_EDUC_PLANO_10,
SN_ENTENDIMENTO_PLANO_10,
SN_INFO_ALTA_HOSP_10,
TP_CLIENTE_PLANO_10,
TP_FOCO_EDUC_10,
TP_PROF_PLANO_10,

DH_PLANO_ALTA_11,
DS_METODO_PLANO_11,
HR_PLANO_ALTA_11,
NM_PRESTADOR_11,
NR_FOCO_EDUC_PLANO_11,
SN_ENTENDIMENTO_PLANO_11,
SN_INFO_ALTA_HOSP_11,
TP_CLIENTE_PLANO_11,
TP_FOCO_EDUC_11,
TP_PROF_PLANO_11,

DH_PLANO_ALTA_12,
DS_METODO_PLANO_12,
HR_PLANO_ALTA_12,
NM_PRESTADOR_12,
NR_FOCO_EDUC_PLANO_12,
SN_ENTENDIMENTO_PLANO_12,
SN_INFO_ALTA_HOSP_12,
TP_CLIENTE_PLANO_12,
TP_FOCO_EDUC_12,
TP_PROF_PLANO_12,

DH_PLANO_ALTA_13,
DS_METODO_PLANO_13,
HR_PLANO_ALTA_13,
NM_PRESTADOR_13,
NR_FOCO_EDUC_PLANO_13,
SN_ENTENDIMENTO_PLANO_13,
SN_INFO_ALTA_HOSP_13,
TP_CLIENTE_PLANO_13,
TP_FOCO_EDUC_13,
TP_PROF_PLANO_13,

DH_PLANO_ALTA_14,
DS_METODO_PLANO_14,
HR_PLANO_ALTA_14,
NM_PRESTADOR_14,
NR_FOCO_EDUC_PLANO_14,
SN_ENTENDIMENTO_PLANO_14,
SN_INFO_ALTA_HOSP_14,
TP_CLIENTE_PLANO_14,
TP_FOCO_EDUC_14,
TP_PROF_PLANO_14
FROM 
(SELECT
      EC.DS_CAMPO,
      ERC.CD_REGISTRO,
      --EC.DS_IDENTIFICADOR,
      DH_FECHAMENTO,
      DBMS_LOB.SUBSTR(ERC.LO_VALOR, 4000, 1) DADO
    FROM
      DBAMV.PW_DOCUMENTO_CLINICO PDC,
      DBAMV.PW_EDITOR_CLINICO PEC,
      DBAMV.EDITOR_REGISTRO_CAMPO ERC,
      DBAMV.EDITOR_CAMPO EC
    WHERE
      PDC.CD_DOCUMENTO_CLINICO = PEC.CD_DOCUMENTO_ClINICO
      AND PEC.CD_EDITOR_REGISTRO = ERC.CD_REGISTRO
      AND EC.CD_CAMPO = ERC.CD_CAMPO 
      --FILTROS
      AND PEC.CD_DOCUMENTO = 1030
      --AND pdc.DH_FECHAMENTO between TO_DATE ('05052024','dd/mm/rrrr') and sysdate
      --AND ERC.CD_REGISTRO = 33834906
      order by 2 DESC
      )
      PIVOT (
          MAX(DADO) FOR DS_CAMPO IN(
          'C�digo do Atendimento' AS CD_ATENDIMENTO,
          'C�digo do Documento' AS CD_DOC,
          'C�digo do Usu�rio' AS CD_USUARIO,
          'Necessidade de Auxilio para Autocuidado' AS SN_AUX_AUTOCUIDADO,
          'Barreiras Nao' AS SN_BARREIRA_N,
          'barreiras sim' AS SN_BARREIRA_S,
          'Necessidade de Medica��o ou cuidados continuos' AS SN_MED_CUID_CONTINUOS,
          'Af�sico' AS TP_AFASICO,
          'Surdez' AS TP_AUDICAO,
          'Cegueira' AS TP_CEGUEIRA,
          'Cuidado com o rec�m nascido pu�rperas' AS TP_CUIDADO_RN,
          'Dif�sico' AS TP_DIFASICO,
          'Diminui��o' AS TP_DIMINUICAO,
          'Diminui��o' AS TP_DIMINUICAO_1,
          'Emocional' AS TP_EMOCIONAL,
          'equipamentos' AS TP_EQUIPAMENTOS,
          'Cultural Idioma' AS TP_IDIOMA,
          'Mobilidade F�sica Prejudicada' AS TP_MOB_FISICA_PREJ,
          'Outras Barreiras' AS TP_OUTRAS_BARREIRAS,
          'Pr�tese ocular' AS TP_PROTESE_OCULAR,
          'Psicomotora' AS TP_PSICOMOTORA,
          'Religiosa' AS TP_RELIGI�O,
          'DATA PLANO DE ALTA E EDUCA��O HOSPITALAR 1' AS DH_PLANO_ALTA_01,
          'METODO PLANO DE ALTA E EDUCACAO HOSPITALAR 1' AS DS_METODO_PLANO_01,
          'HORA PLANO DE ALTA E EDUCA��O HOSPITALAR 1' AS HR_PLANO_ALTA_01,
          'NOME E N DO CONSELHO 1' AS NM_PRESTADOR_01,
          'NUMERO DO FOCO EDUCACIONAL PLANO DE ALTA E EDUCACAO 1' AS NR_FOCO_EDUC_PLANO_01,
          'ENTENDIMENTO PLANO DE ALTA E EDUCACAO 1' AS SN_ENTENDIMENTO_PLANO_01,
          'DESEJA RECEBER INFORMACAO PLANO DE EDUCACAO 1' AS SN_INFO_ALTA_HOSP_01,
          'CLIENTE PLANO DE ALTA E EDUCACAO 1' AS TP_CLIENTE_PLANO_01,
          'TIPO DO FOCO PLANO DE ALTA E EDUCACAO 1' AS TP_FOCO_EDUC_01,
          'PROFISSIONAL PLANO DE ALTA E EDUCACAO 1' AS TP_PROF_PLANO_01,
          'DATA E HORA PLANO DE EDUCACAO E ALTA 2' AS DH_PLANO_ALTA_02,
          'METODO PLANO DE ALTA E EDUCACAO 2' AS DS_METODO_PLANO_02,
          'HORA PLANO DE ALTA E EDUCACAO 2' AS HR_PLANO_ALTA_02,
          'NUMERO DO CONSELHO PLANO DE ALTA E EDUCACAO 2' AS NM_PRESTADOR_02,
          'N DO FOCO EDUCACIONAL PLANO DE ALTA E EDUCACAO 1' AS NR_FOCO_EDUC_PLANO_02,
          'ENTENDIMENTO PLANO DE ALTA E EDUCACAO 2' AS SN_ENTENDIMENTO_PLANO_02,
          'DESEJA RECEBER INFORMA��O PLANO DE ALTA E EDUCACAO 2' AS SN_INFO_ALTA_HOSP_02,
          'CLIENTE PLANO DE ALTA E EDUCACAO 2' AS TP_CLIENTE_PLANO_02,
          'TIPO DE FOCO EDUCACIONAL 2' AS TP_FOCO_EDUC_02,
          'PROFISSIONAL PLANO DE ALTA E EDUCACAO 2' AS TP_PROF_PLANO_02,
          'DATA PLANO DE ALTA E EDUCACAO HOSPITALAR 3' AS DH_PLANO_ALTA_03,
          'METODO PLANO DE EDUCACAO E ALTA HOSPITALAR 3' AS DS_METODO_PLANO_03,
          'HORA PLANO DE EDUCACAO E EALTA HOSPITALAR 3' AS HR_PLANO_ALTA_03,
          'NOME E N DO CONSELHO PLANO DE ALTA HOSPITALAR 3' AS NM_PRESTADOR_03,
          'NUMERO DO FOCO EDUCACIONAL PLANO DE ALTA HOSPITALAR 3' AS NR_FOCO_EDUC_PLANO_03,
          'ENTENDIMENTO PLANO DE EDUCACAO E ALTA HOSPITALAR 3' AS SN_ENTENDIMENTO_PLANO_03,
          'DESEJA RECEBER A INFORMACAO PLANO DE ALTA 3' AS SN_INFO_ALTA_HOSP_03,
          'CLIENTE PLANO DE ALTA HOSPITALAR E EDUCACAO 3' AS TP_CLIENTE_PLANO_03,
          'TIPO DE FOCO EDUCACIONAL PLANO DE ALTA 3' AS TP_FOCO_EDUC_03,
          'PROFISSIONAL PLANO DE ALTA E EDUCACAO HOSPITALAR 3' AS TP_PROF_PLANO_03,
          'DATA E HORA PLANO DE ALTA E EDUCACAO HOSPITALAR 4' AS DH_PLANO_ALTA_04,
          'METODO PLANO DE ALTA E EDUCACAO HOSPITALAR 4' AS DS_METODO_PLANO_04,
          'HORA PLANO DE ALTA E EDUCACAO HOSPITALAR 4' AS HR_PLANO_ALTA_04,
          'NOME E N DO CONSELHO PLANO DE ALTA E EDUCACAO HOSPITALAR' AS NM_PRESTADOR_04,
          'NUMERO DO FOCO EDUCACIONAL PLANO DE ALTA E EDUCACAO HOSPITALAR 4' AS NR_FOCO_EDUC_PLANO_04,
          'ENTENDIMENTO PLANO DE ALTA E EDUCACAO HOSPITALAR 4' AS SN_ENTENDIMENTO_PLANO_04,
          'DESEJA RECEBER INFOMA��O PLANO DE ALTA HOSPITALAR 4' AS SN_INFO_ALTA_HOSP_04,
          'CLIENTE PLANO DE ALTA E EDUCACAO HOSPITLAR 4' AS TP_CLIENTE_PLANO_04,
          'TIPO DE FOCO EDUCACIONAL E PLANO DE ALTA 4' AS TP_FOCO_EDUC_04,
          'PROFISSIONAL PLANO DE ALTA E EDUCACAO HOSPITLAR' AS TP_PROF_PLANO_04,
          'DATA E HORA PLANO DE ALTA E EDUCACAO 5' AS DH_PLANO_ALTA_05,
          'METODO PLANO DE ALTA E EDUCACAO 5' AS DS_METODO_PLANO_05,
          'HORA ALTA HOSPITALAR E EDUCACAO 5' AS HR_PLANO_ALTA_05,
          'NOME E N DO CONSELHO PLANO DE ALTA 5' AS NM_PRESTADOR_05,
          'NUMERO O FOCO PLANO DE ALTA 5' AS NR_FOCO_EDUC_PLANO_05,
          'ENTEDIMENTO PLANO DE ALTA E EDUCACAO HOSPITALAR 5' AS SN_ENTENDIMENTO_PLANO_05,
          'DESEJA RECEBER INFOMACAO PLANO DE ALTA 5' AS SN_INFO_ALTA_HOSP_05,
          'CLIENTE PLANO DE ALTA EDUCA��O HOSPITALAR 5' AS TP_CLIENTE_PLANO_05,
          'TIPO DE FOCO EDUCACIONAL PLANO DE ALTA HOSPITALAR 5' AS TP_FOCO_EDUC_05,
          'PROFISSIONAL PLANO DE ALTA EDUCACAO HOSPITALAR 5' AS TP_PROF_PLANO_05,
          'DATA E HORA PLANO DE ALTA E EDUCACAO 6' AS DH_PLANO_ALTA_06,
          'METODO PLANO DE ALTA E EDUCACAO 6' AS DS_METODO_PLANO_06,
          'HORA PLANO DE ALTA E EDUCACAO 5' AS HR_PLANO_ALTA_06,
          'NOME E N DO CONSELHO PLANO DE ALTA 6' AS NM_PRESTADOR_06,
          'NUMERO DO FOCO EDUCACIONAL PLANO DE ALTA 6' AS NR_FOCO_EDUC_PLANO_06,
          'ENTENDIMENTO PLANO DE ALTA E EDUCACAO 6' AS SN_ENTENDIMENTO_PLANO_06,
          'DESEJA RECEBER A INFORMACAO PLANO DE ALTA HOSPITALAR 6' AS SN_INFO_ALTA_HOSP_06,
          'CLIENTE PLANO DE EDUCACAO E ALTA 6' AS TP_CLIENTE_PLANO_06,
          'TIPO DE FOCO EDUCACIONAL PLANO DE ALTA HOSPITALAR 6' AS TP_FOCO_EDUC_06,
          'PROFISSIONAL PLANO DE ALTA E EDUCACAO HOSPITALAR 6' AS TP_PROF_PLANO_06,
          'DATA E HORA PLANO DE ALTA E EDUCACAO 7' AS DH_PLANO_ALTA_07,
          'METODO PLANO DE ALTA E EDUCACAO 7' AS DS_METODO_PLANO_07,
          'HORA PLANO DE ALTA E EDUCACAO 7' AS HR_PLANO_ALTA_07,
          'NOME E N DO CONSELHO PLANO DE ALTA 7' AS NM_PRESTADOR_07,
          'NUMERO DO FOCO EDUCACIONAL PLANO DE ALTA 7' AS NR_FOCO_EDUC_PLANO_07,
          'ENTENDIMENTO PLANO DE ALTA E EDUCACAO 7' AS SN_ENTENDIMENTO_PLANO_07,
          'DESEJA RECEBER A INFORMACAO PLANO DE ALTA HOSPITALAR 7' AS SN_INFO_ALTA_HOSP_07,
          'CLIENTE PLANO DE EDUCACAO E ALTA 7' AS TP_CLIENTE_PLANO_07,
          'TIPO DE FOCO EDUCACIONAL PLANO DE ALTA HOSPITALAR 7' AS TP_FOCO_EDUC_07,
          'PROFISSIONAL PLANO DE ALTA E EDUCACAO HOSPITALAR 7' AS TP_PROF_PLANO_07,
          'DATA E HORA PLANO DE ALTA E EDUCACAO 8' AS DH_PLANO_ALTA_08,
          'METODO PLANO DE ALTA E EDUCACAO 8' AS DS_METODO_PLANO_08,
          'HORA PLANO DE ALTA E EDUCACAO 8' AS HR_PLANO_ALTA_08,
          'NOME E N DO CONSELHO PLANO DE ALTA 8' AS NM_PRESTADOR_08,
          'NUMERO DO FOCO EDUCACIONAL PLANO DE ALTA 8' AS NR_FOCO_EDUC_PLANO_08,
          'ENTENDIMENTO PLANO DE ALTA E EDUCACAO 8' AS SN_ENTENDIMENTO_PLANO_08,
          'DESEJA RECEBER A INFORMACAO PLANO DE ALTA HOSPITALAR 8' AS SN_INFO_ALTA_HOSP_08,
          'CLIENTE PLANO DE EDUCACAO E ALTA 8' AS TP_CLIENTE_PLANO_08,
          'TIPO DE FOCO EDUCACIONAL PLANO DE ALTA HOSPITALAR 8' AS TP_FOCO_EDUC_08,
          'PROFISSIONAL PLANO DE ALTA E EDUCACAO HOSPITALAR 8' AS TP_PROF_PLANO_08,
          'DATA E HORA PLANO DE ALTA E EDUCACAO 9' AS DH_PLANO_ALTA_09,
          'METODO PLANO DE ALTA E EDUCACAO 9' AS DS_METODO_PLANO_09,
          'HORA PLANO DE ALTA E EDUCACAO 9' AS HR_PLANO_ALTA_09,
          'NOME E N DO CONSELHO PLANO DE ALTA 9' AS NM_PRESTADOR_09,
          'NUMERO DO FOCO EDUCACIONAL PLANO DE ALTA 9' AS NR_FOCO_EDUC_PLANO_09,
          'ENTENDIMENTO PLANO DE ALTA E EDUCACAO 9' AS SN_ENTENDIMENTO_PLANO_09,
          'DESEJA RECEBER A INFORMACAO PLANO DE ALTA HOSPITALAR 9' AS SN_INFO_ALTA_HOSP_09,
          'CLIENTE PLANO DE EDUCACAO E ALTA 9' AS TP_CLIENTE_PLANO_09,
          'TIPO DE FOCO EDUCACIONAL PLANO DE ALTA HOSPITALAR 9' AS TP_FOCO_EDUC_09,
          'PROFISSIONAL PLANO DE ALTA E EDUCACAO HOSPITALAR 9' AS TP_PROF_PLANO_09,
          'DATA E HORA PLANO DE ALTA E EDUCACAO 10' AS DH_PLANO_ALTA_10,
          'METODO PLANO DE ALTA E EDUCACAO 10' AS DS_METODO_PLANO_10,
          'HORA PLANO DE ALTA E EDUCACAO 10' AS HR_PLANO_ALTA_10,
          'NOME E N DO CONSELHO PLANO DE ALTA 10' AS NM_PRESTADOR_10,
          'NUMERO DO FOCO EDUCACIONAL PLANO DE ALTA 10' AS NR_FOCO_EDUC_PLANO_10,
          'ENTENDIMENTO PLANO DE ALTA E EDUCACAO 10' AS SN_ENTENDIMENTO_PLANO_10,
          'DESEJA RECEBER A INFORMACAO PLANO DE ALTA HOSPITALAR 10' AS SN_INFO_ALTA_HOSP_10,
          'CLIENTE PLANO DE EDUCACAO E ALTA 10' AS TP_CLIENTE_PLANO_10,
          'TIPO DE FOCO EDUCACIONAL PLANO DE ALTA HOSPITALAR 10' AS TP_FOCO_EDUC_10,
          'PROFISSIONAL PLANO DE ALTA E EDUCACAO HOSPITALAR 10' AS TP_PROF_PLANO_10,
          'DATA E HORA PLANO DE ALTA E EDUCACAO 11' AS DH_PLANO_ALTA_11,
          'METODO PLANO DE ALTA E EDUCACAO 11' AS DS_METODO_PLANO_11,
          'HORA PLANO DE ALTA E EDUCACAO 11' AS HR_PLANO_ALTA_11,
          'NOME E N DO CONSELHO PLANO DE ALTA 11' AS NM_PRESTADOR_11,
          'NUMERO DO FOCO EDUCACIONAL PLANO DE ALTA 11' AS NR_FOCO_EDUC_PLANO_11,
          'ENTENDIMENTO PLANO DE ALTA E EDUCACAO 11' AS SN_ENTENDIMENTO_PLANO_11,
          'DESEJA RECEBER A INFORMACAO PLANO DE ALTA HOSPITALAR 11' AS SN_INFO_ALTA_HOSP_11,
          'CLIENTE PLANO DE EDUCACAO E ALTA 11' AS TP_CLIENTE_PLANO_11,
          'TIPO DE FOCO EDUCACIONAL PLANO DE ALTA HOSPITALAR 11' AS TP_FOCO_EDUC_11,
          'PROFISSIONAL PLANO DE ALTA E EDUCACAO HOSPITALAR 11' AS TP_PROF_PLANO_11,
          'DATA E HORA PLANO DE ALTA E EDUCACAO 12' AS DH_PLANO_ALTA_12,
          'METODO PLANO DE ALTA E EDUCACAO 12' AS DS_METODO_PLANO_12,
          'HORA PLANO DE ALTA E EDUCACAO 12' AS HR_PLANO_ALTA_12,
          'NOME E N DO CONSELHO PLANO DE ALTA 12' AS NM_PRESTADOR_12,
          'NUMERO DO FOCO EDUCACIONAL PLANO DE ALTA 12' AS NR_FOCO_EDUC_PLANO_12,
          'ENTENDIMENTO PLANO DE ALTA E EDUCACAO 12' AS SN_ENTENDIMENTO_PLANO_12,
          'DESEJA RECEBER A INFORMACAO PLANO DE ALTA HOSPITALAR 12' AS SN_INFO_ALTA_HOSP_12,
          'CLIENTE PLANO DE EDUCACAO E ALTA 12' AS TP_CLIENTE_PLANO_12,
          'TIPO DE FOCO EDUCACIONAL PLANO DE ALTA HOSPITALAR 12' AS TP_FOCO_EDUC_12,
          'PROFISSIONAL PLANO DE ALTA E EDUCACAO HOSPITALAR 12' AS TP_PROF_PLANO_12,
          'DATA E HORA PLANO DE ALTA E EDUCACAO 13' AS DH_PLANO_ALTA_13,
          'METODO PLANO DE ALTA E EDUCACAO 13' AS DS_METODO_PLANO_13,
          'HORA PLANO DE ALTA E EDUCACAO 13' AS HR_PLANO_ALTA_13,
          'NOME E N DO CONSELHO PLANO DE ALTA 13' AS NM_PRESTADOR_13,
          'NUMERO DO FOCO EDUCACIONAL PLANO DE ALTA 13' AS NR_FOCO_EDUC_PLANO_13,
          'ENTENDIMENTO PLANO DE ALTA E EDUCACAO 13' AS SN_ENTENDIMENTO_PLANO_13,
          'DESEJA RECEBER A INFORMACAO PLANO DE ALTA HOSPITALAR 13' AS SN_INFO_ALTA_HOSP_13,
          'CLIENTE PLANO DE EDUCACAO E ALTA 13' AS TP_CLIENTE_PLANO_13,
          'TIPO DE FOCO EDUCACIONAL PLANO DE ALTA HOSPITALAR 13' AS TP_FOCO_EDUC_13,
          'PROFISSIONAL PLANO DE ALTA E EDUCACAO HOSPITALAR 13' AS TP_PROF_PLANO_13,
          'DATA E HORA PLANO DE ALTA E EDUCACAO 14' AS DH_PLANO_ALTA_14,
          'METODO PLANO DE ALTA E EDUCACAO 14' AS DS_METODO_PLANO_14,
          'HORA PLANO DE ALTA E EDUCACAO 14' AS HR_PLANO_ALTA_14,
          'NOME E N DO CONSELHO PLANO DE ALTA 14' AS NM_PRESTADOR_14,
          'NUMERO DO FOCO EDUCACIONAL PLANO DE ALTA 14' AS NR_FOCO_EDUC_PLANO_14,
          'ENTENDIMENTO PLANO DE ALTA E EDUCACAO 14' AS SN_ENTENDIMENTO_PLANO_14,
          'DESEJA RECEBER A INFORMACAO PLANO DE ALTA HOSPITALAR 14' AS SN_INFO_ALTA_HOSP_14,
          'CLIENTE PLANO DE EDUCACAO E ALTA 14' AS TP_CLIENTE_PLANO_14,
          'TIPO DE FOCO EDUCACIONAL PLANO DE ALTA HOSPITALAR 14' AS TP_FOCO_EDUC_14,
          'PROFISSIONAL PLANO DE ALTA E EDUCACAO HOSPITALAR 14' AS TP_PROF_PLANO_14,
          'OUTROS' AS DS_OUTROS
          ))
where TRUNC (DH_FECHAMENTO) BETWEEN TO_dATE('01052024','DD/MM/YYYY') AND TRUNC (SYSDATE)
--AND TP_FOCO_EDUC_06 IS NOT NULL 
AND cd_registro = 33657200