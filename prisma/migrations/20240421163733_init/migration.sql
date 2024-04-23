-- CreateTable
CREATE TABLE "Horarios_missas" (
    "id_horario" SERIAL NOT NULL,
    "nome_capela" TEXT NOT NULL,
    "tipo_cerimonia" TEXT NOT NULL,

    CONSTRAINT "Horarios_missas_pkey" PRIMARY KEY ("id_horario")
);

-- CreateTable
CREATE TABLE "Coroinhas" (
    "id_coroinha" SERIAL NOT NULL,
    "nome_coroinha" TEXT NOT NULL,
    "sexo_coroinha" TEXT NOT NULL,
    "altura" TEXT,

    CONSTRAINT "Coroinhas_pkey" PRIMARY KEY ("id_coroinha")
);

-- CreateTable
CREATE TABLE "Objetos_liturgicos" (
    "id_objeto" SERIAL NOT NULL,
    "nome_objeto" TEXT NOT NULL,

    CONSTRAINT "Objetos_liturgicos_pkey" PRIMARY KEY ("id_objeto")
);

-- CreateTable
CREATE TABLE "Escalas" (
    "id_escala" SERIAL NOT NULL,
    "coroinha_id" INTEGER NOT NULL,
    "objeto_id" INTEGER NOT NULL,
    "horario_id" INTEGER NOT NULL,

    CONSTRAINT "Escalas_pkey" PRIMARY KEY ("id_escala")
);

-- AddForeignKey
ALTER TABLE "Escalas" ADD CONSTRAINT "Escalas_coroinha_id_fkey" FOREIGN KEY ("coroinha_id") REFERENCES "Coroinhas"("id_coroinha") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Escalas" ADD CONSTRAINT "Escalas_objeto_id_fkey" FOREIGN KEY ("objeto_id") REFERENCES "Objetos_liturgicos"("id_objeto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Escalas" ADD CONSTRAINT "Escalas_horario_id_fkey" FOREIGN KEY ("horario_id") REFERENCES "Horarios_missas"("id_horario") ON DELETE RESTRICT ON UPDATE CASCADE;
