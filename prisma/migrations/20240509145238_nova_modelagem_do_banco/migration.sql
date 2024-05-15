/*
  Warnings:

  - You are about to drop the column `id_horario` on the `Escalas` table. All the data in the column will be lost.
  - You are about to drop the `Coroinhas_Horarios_Missa` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Escalas_Horarios_Missa` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Horarios_Missa` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Objetos_Liturgicos_Horarios_Missa` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_Horarios_MissaToObjetos_Liturgicos` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `id_capela` to the `Escalas` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Coroinhas_Horarios_Missa" DROP CONSTRAINT "Coroinhas_Horarios_Missa_Coroinhas_id_coroinha_fkey";

-- DropForeignKey
ALTER TABLE "Coroinhas_Horarios_Missa" DROP CONSTRAINT "Coroinhas_Horarios_Missa_Horarios_Missa_id_horario_fkey";

-- DropForeignKey
ALTER TABLE "Escalas" DROP CONSTRAINT "Escalas_id_horario_fkey";

-- DropForeignKey
ALTER TABLE "Escalas_Horarios_Missa" DROP CONSTRAINT "Escalas_Horarios_Missa_Escalas_id_escala_fkey";

-- DropForeignKey
ALTER TABLE "Escalas_Horarios_Missa" DROP CONSTRAINT "Escalas_Horarios_Missa_Horarios_Missa_id_horario_fkey";

-- DropForeignKey
ALTER TABLE "Objetos_Liturgicos_Horarios_Missa" DROP CONSTRAINT "Objetos_Liturgicos_Horarios_M_Objetos_Liturgicos_id_objeto_fkey";

-- DropForeignKey
ALTER TABLE "Objetos_Liturgicos_Horarios_Missa" DROP CONSTRAINT "Objetos_Liturgicos_Horarios_Miss_Horarios_Missa_id_horario_fkey";

-- DropForeignKey
ALTER TABLE "_Horarios_MissaToObjetos_Liturgicos" DROP CONSTRAINT "_Horarios_MissaToObjetos_Liturgicos_A_fkey";

-- DropForeignKey
ALTER TABLE "_Horarios_MissaToObjetos_Liturgicos" DROP CONSTRAINT "_Horarios_MissaToObjetos_Liturgicos_B_fkey";

-- AlterTable
ALTER TABLE "Escalas" DROP COLUMN "id_horario",
ADD COLUMN     "id_capela" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Coroinhas_Horarios_Missa";

-- DropTable
DROP TABLE "Escalas_Horarios_Missa";

-- DropTable
DROP TABLE "Horarios_Missa";

-- DropTable
DROP TABLE "Objetos_Liturgicos_Horarios_Missa";

-- DropTable
DROP TABLE "_Horarios_MissaToObjetos_Liturgicos";

-- CreateTable
CREATE TABLE "Capelas" (
    "id_capela" SERIAL NOT NULL,
    "nome_capela" TEXT NOT NULL,

    CONSTRAINT "Capelas_pkey" PRIMARY KEY ("id_capela")
);

-- CreateTable
CREATE TABLE "Coroinhas_Capelas" (
    "Coroinhas_id_coroinha" SERIAL NOT NULL,
    "Capelas_id_capela" SERIAL NOT NULL
);

-- CreateTable
CREATE TABLE "Escalas_Capelas" (
    "Escalas_id_escala" SERIAL NOT NULL,
    "Capelas_id_capela" SERIAL NOT NULL
);

-- CreateTable
CREATE TABLE "Objetos_Liturgicos_Capelas" (
    "Objetos_Liturgicos_id_objeto" SERIAL NOT NULL,
    "Capelas_id_capela" SERIAL NOT NULL
);

-- CreateTable
CREATE TABLE "_CapelasToObjetos_Liturgicos" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_CapelasToObjetos_Liturgicos_AB_unique" ON "_CapelasToObjetos_Liturgicos"("A", "B");

-- CreateIndex
CREATE INDEX "_CapelasToObjetos_Liturgicos_B_index" ON "_CapelasToObjetos_Liturgicos"("B");

-- AddForeignKey
ALTER TABLE "Escalas" ADD CONSTRAINT "Escalas_id_capela_fkey" FOREIGN KEY ("id_capela") REFERENCES "Capelas"("id_capela") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Coroinhas_Capelas" ADD CONSTRAINT "Coroinhas_Capelas_Coroinhas_id_coroinha_fkey" FOREIGN KEY ("Coroinhas_id_coroinha") REFERENCES "Coroinhas"("id_coroinha") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Coroinhas_Capelas" ADD CONSTRAINT "Coroinhas_Capelas_Capelas_id_capela_fkey" FOREIGN KEY ("Capelas_id_capela") REFERENCES "Capelas"("id_capela") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Escalas_Capelas" ADD CONSTRAINT "Escalas_Capelas_Escalas_id_escala_fkey" FOREIGN KEY ("Escalas_id_escala") REFERENCES "Escalas"("id_escala") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Escalas_Capelas" ADD CONSTRAINT "Escalas_Capelas_Capelas_id_capela_fkey" FOREIGN KEY ("Capelas_id_capela") REFERENCES "Capelas"("id_capela") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Objetos_Liturgicos_Capelas" ADD CONSTRAINT "Objetos_Liturgicos_Capelas_Objetos_Liturgicos_id_objeto_fkey" FOREIGN KEY ("Objetos_Liturgicos_id_objeto") REFERENCES "Objetos_Liturgicos"("id_objeto") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Objetos_Liturgicos_Capelas" ADD CONSTRAINT "Objetos_Liturgicos_Capelas_Capelas_id_capela_fkey" FOREIGN KEY ("Capelas_id_capela") REFERENCES "Capelas"("id_capela") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "_CapelasToObjetos_Liturgicos" ADD CONSTRAINT "_CapelasToObjetos_Liturgicos_A_fkey" FOREIGN KEY ("A") REFERENCES "Capelas"("id_capela") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CapelasToObjetos_Liturgicos" ADD CONSTRAINT "_CapelasToObjetos_Liturgicos_B_fkey" FOREIGN KEY ("B") REFERENCES "Objetos_Liturgicos"("id_objeto") ON DELETE CASCADE ON UPDATE CASCADE;
