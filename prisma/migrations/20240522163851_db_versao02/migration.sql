/*
  Warnings:

  - You are about to drop the `Capelas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Coroinhas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Coroinhas_Capelas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Escalas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Escalas_Capelas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Objetos_Liturgicos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Objetos_Liturgicos_Capelas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_CapelasToObjetos_Liturgicos` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Coroinhas_Capelas" DROP CONSTRAINT "Coroinhas_Capelas_Capelas_id_capela_fkey";

-- DropForeignKey
ALTER TABLE "Coroinhas_Capelas" DROP CONSTRAINT "Coroinhas_Capelas_Coroinhas_id_coroinha_fkey";

-- DropForeignKey
ALTER TABLE "Escalas" DROP CONSTRAINT "Escalas_id_capela_fkey";

-- DropForeignKey
ALTER TABLE "Escalas" DROP CONSTRAINT "Escalas_id_coroinha_fkey";

-- DropForeignKey
ALTER TABLE "Escalas" DROP CONSTRAINT "Escalas_id_objeto_fkey";

-- DropForeignKey
ALTER TABLE "Escalas_Capelas" DROP CONSTRAINT "Escalas_Capelas_Capelas_id_capela_fkey";

-- DropForeignKey
ALTER TABLE "Escalas_Capelas" DROP CONSTRAINT "Escalas_Capelas_Escalas_id_escala_fkey";

-- DropForeignKey
ALTER TABLE "Objetos_Liturgicos_Capelas" DROP CONSTRAINT "Objetos_Liturgicos_Capelas_Capelas_id_capela_fkey";

-- DropForeignKey
ALTER TABLE "Objetos_Liturgicos_Capelas" DROP CONSTRAINT "Objetos_Liturgicos_Capelas_Objetos_Liturgicos_id_objeto_fkey";

-- DropForeignKey
ALTER TABLE "_CapelasToObjetos_Liturgicos" DROP CONSTRAINT "_CapelasToObjetos_Liturgicos_A_fkey";

-- DropForeignKey
ALTER TABLE "_CapelasToObjetos_Liturgicos" DROP CONSTRAINT "_CapelasToObjetos_Liturgicos_B_fkey";

-- DropTable
DROP TABLE "Capelas";

-- DropTable
DROP TABLE "Coroinhas";

-- DropTable
DROP TABLE "Coroinhas_Capelas";

-- DropTable
DROP TABLE "Escalas";

-- DropTable
DROP TABLE "Escalas_Capelas";

-- DropTable
DROP TABLE "Objetos_Liturgicos";

-- DropTable
DROP TABLE "Objetos_Liturgicos_Capelas";

-- DropTable
DROP TABLE "_CapelasToObjetos_Liturgicos";

-- CreateTable
CREATE TABLE "Coroinha" (
    "id_coroinha" SERIAL NOT NULL,
    "nome_coroinha" TEXT NOT NULL,
    "sexo_coroinha" TEXT NOT NULL,
    "altura_coroinha" DOUBLE PRECISION,
    "tipo_coroinha" TEXT NOT NULL,

    CONSTRAINT "Coroinha_pkey" PRIMARY KEY ("id_coroinha")
);

-- CreateTable
CREATE TABLE "Capela" (
    "id_capela" SERIAL NOT NULL,
    "nome_capela" TEXT NOT NULL,

    CONSTRAINT "Capela_pkey" PRIMARY KEY ("id_capela")
);

-- CreateTable
CREATE TABLE "ObjetoLiturgico" (
    "id_objeto" SERIAL NOT NULL,
    "nome_objeto" TEXT NOT NULL,

    CONSTRAINT "ObjetoLiturgico_pkey" PRIMARY KEY ("id_objeto")
);

-- CreateTable
CREATE TABLE "Escala" (
    "id_escala" SERIAL NOT NULL,
    "id_capela" INTEGER NOT NULL,
    "data_escala" TIMESTAMP(3) NOT NULL,
    "tipo_cerimonia" TEXT NOT NULL,
    "horario_missa" TEXT NOT NULL,

    CONSTRAINT "Escala_pkey" PRIMARY KEY ("id_escala")
);

-- CreateTable
CREATE TABLE "EscalaCoroinha" (
    "id" SERIAL NOT NULL,
    "id_escala" INTEGER NOT NULL,
    "id_coroinha" INTEGER NOT NULL,
    "id_objeto" INTEGER NOT NULL,

    CONSTRAINT "EscalaCoroinha_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CapelaToObjetoLiturgico" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "EscalaCoroinha_id_escala_id_coroinha_id_objeto_key" ON "EscalaCoroinha"("id_escala", "id_coroinha", "id_objeto");

-- CreateIndex
CREATE UNIQUE INDEX "_CapelaToObjetoLiturgico_AB_unique" ON "_CapelaToObjetoLiturgico"("A", "B");

-- CreateIndex
CREATE INDEX "_CapelaToObjetoLiturgico_B_index" ON "_CapelaToObjetoLiturgico"("B");

-- AddForeignKey
ALTER TABLE "Escala" ADD CONSTRAINT "Escala_id_capela_fkey" FOREIGN KEY ("id_capela") REFERENCES "Capela"("id_capela") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EscalaCoroinha" ADD CONSTRAINT "EscalaCoroinha_id_escala_fkey" FOREIGN KEY ("id_escala") REFERENCES "Escala"("id_escala") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EscalaCoroinha" ADD CONSTRAINT "EscalaCoroinha_id_coroinha_fkey" FOREIGN KEY ("id_coroinha") REFERENCES "Coroinha"("id_coroinha") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EscalaCoroinha" ADD CONSTRAINT "EscalaCoroinha_id_objeto_fkey" FOREIGN KEY ("id_objeto") REFERENCES "ObjetoLiturgico"("id_objeto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CapelaToObjetoLiturgico" ADD CONSTRAINT "_CapelaToObjetoLiturgico_A_fkey" FOREIGN KEY ("A") REFERENCES "Capela"("id_capela") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CapelaToObjetoLiturgico" ADD CONSTRAINT "_CapelaToObjetoLiturgico_B_fkey" FOREIGN KEY ("B") REFERENCES "ObjetoLiturgico"("id_objeto") ON DELETE CASCADE ON UPDATE CASCADE;
