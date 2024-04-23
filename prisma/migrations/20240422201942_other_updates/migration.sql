-- CreateTable
CREATE TABLE "Coroinhas_Horarios_Missa" (
    "Coroinhas_id_coroinha" SERIAL NOT NULL,
    "Horarios_Missa_id_horario" SERIAL NOT NULL
);

-- CreateTable
CREATE TABLE "Escalas_Horarios_Missa" (
    "Escalas_id_escala" SERIAL NOT NULL,
    "Horarios_Missa_id_horario" SERIAL NOT NULL
);

-- CreateTable
CREATE TABLE "Objetos_Liturgicos_Horarios_Missa" (
    "Objetos_Liturgicos_id_objeto" SERIAL NOT NULL,
    "Horarios_Missa_id_horario" SERIAL NOT NULL
);

-- AddForeignKey
ALTER TABLE "Coroinhas_Horarios_Missa" ADD CONSTRAINT "Coroinhas_Horarios_Missa_Coroinhas_id_coroinha_fkey" FOREIGN KEY ("Coroinhas_id_coroinha") REFERENCES "Coroinhas"("id_coroinha") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Coroinhas_Horarios_Missa" ADD CONSTRAINT "Coroinhas_Horarios_Missa_Horarios_Missa_id_horario_fkey" FOREIGN KEY ("Horarios_Missa_id_horario") REFERENCES "Horarios_Missa"("id_horario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Escalas_Horarios_Missa" ADD CONSTRAINT "Escalas_Horarios_Missa_Escalas_id_escala_fkey" FOREIGN KEY ("Escalas_id_escala") REFERENCES "Escalas"("id_escala") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Escalas_Horarios_Missa" ADD CONSTRAINT "Escalas_Horarios_Missa_Horarios_Missa_id_horario_fkey" FOREIGN KEY ("Horarios_Missa_id_horario") REFERENCES "Horarios_Missa"("id_horario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Objetos_Liturgicos_Horarios_Missa" ADD CONSTRAINT "Objetos_Liturgicos_Horarios_M_Objetos_Liturgicos_id_objeto_fkey" FOREIGN KEY ("Objetos_Liturgicos_id_objeto") REFERENCES "Objetos_Liturgicos"("id_objeto") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Objetos_Liturgicos_Horarios_Missa" ADD CONSTRAINT "Objetos_Liturgicos_Horarios_Miss_Horarios_Missa_id_horario_fkey" FOREIGN KEY ("Horarios_Missa_id_horario") REFERENCES "Horarios_Missa"("id_horario") ON DELETE NO ACTION ON UPDATE NO ACTION;
