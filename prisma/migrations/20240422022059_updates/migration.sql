/*
  Warnings:

  - You are about to drop the column `altura` on the `Coroinhas` table. All the data in the column will be lost.
  - You are about to drop the column `coroinha_nome` on the `Escalas` table. All the data in the column will be lost.
  - You are about to drop the column `horarios` on the `Escalas` table. All the data in the column will be lost.
  - You are about to drop the column `objeto_nome` on the `Escalas` table. All the data in the column will be lost.
  - You are about to drop the `Horarios_missas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Objetos_liturgicos` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `id_coroinha` to the `Escalas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id_horario` to the `Escalas` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Escalas" DROP CONSTRAINT "Escalas_coroinha_nome_fkey";

-- DropForeignKey
ALTER TABLE "Escalas" DROP CONSTRAINT "Escalas_horarios_fkey";

-- DropForeignKey
ALTER TABLE "Escalas" DROP CONSTRAINT "Escalas_objeto_nome_fkey";

-- AlterTable
ALTER TABLE "Coroinhas" DROP COLUMN "altura",
ADD COLUMN     "altura_coroinha" DOUBLE PRECISION;

-- AlterTable
ALTER TABLE "Escalas" DROP COLUMN "coroinha_nome",
DROP COLUMN "horarios",
DROP COLUMN "objeto_nome",
ADD COLUMN     "id_coroinha" INTEGER NOT NULL,
ADD COLUMN     "id_horario" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Horarios_missas";

-- DropTable
DROP TABLE "Objetos_liturgicos";

-- CreateTable
CREATE TABLE "Horarios_Missa" (
    "id_horario" SERIAL NOT NULL,
    "nome_capela" TEXT NOT NULL,
    "tipo_cerimonia" TEXT NOT NULL,
    "horario_missa" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Horarios_Missa_pkey" PRIMARY KEY ("id_horario")
);

-- CreateTable
CREATE TABLE "Objetos_Liturgicos" (
    "id_objeto" SERIAL NOT NULL,
    "nome_objeto" TEXT NOT NULL,

    CONSTRAINT "Objetos_Liturgicos_pkey" PRIMARY KEY ("id_objeto")
);

-- CreateTable
CREATE TABLE "_Horarios_MissaToObjetos_Liturgicos" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_Horarios_MissaToObjetos_Liturgicos_AB_unique" ON "_Horarios_MissaToObjetos_Liturgicos"("A", "B");

-- CreateIndex
CREATE INDEX "_Horarios_MissaToObjetos_Liturgicos_B_index" ON "_Horarios_MissaToObjetos_Liturgicos"("B");

-- AddForeignKey
ALTER TABLE "Escalas" ADD CONSTRAINT "Escalas_id_coroinha_fkey" FOREIGN KEY ("id_coroinha") REFERENCES "Coroinhas"("id_coroinha") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Escalas" ADD CONSTRAINT "Escalas_id_horario_fkey" FOREIGN KEY ("id_horario") REFERENCES "Horarios_Missa"("id_horario") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Horarios_MissaToObjetos_Liturgicos" ADD CONSTRAINT "_Horarios_MissaToObjetos_Liturgicos_A_fkey" FOREIGN KEY ("A") REFERENCES "Horarios_Missa"("id_horario") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Horarios_MissaToObjetos_Liturgicos" ADD CONSTRAINT "_Horarios_MissaToObjetos_Liturgicos_B_fkey" FOREIGN KEY ("B") REFERENCES "Objetos_Liturgicos"("id_objeto") ON DELETE CASCADE ON UPDATE CASCADE;
