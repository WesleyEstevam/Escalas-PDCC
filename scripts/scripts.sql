/*RELATÓRIOS DE ESCALAS*/

SELECT nome_coroinha, nome_capela, horario_missa, nome_objeto FROM "Coroinhas" as cor 
	JOIN "Horarios_Missa" as hm ON cor.id_coroinha = hm.id_horario 
	JOIN "Objetos_Liturgicos" as ol ON cor.id_coroinha = ol.id_objeto