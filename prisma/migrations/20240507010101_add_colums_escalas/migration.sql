/*
  Warnings:

  - You are about to drop the column `horario_missa` on the `Horarios_Missa` table. All the data in the column will be lost.
  - You are about to drop the column `tipo_cerimonia` on the `Horarios_Missa` table. All the data in the column will be lost.
  - Added the required column `horario_missa` to the `Escalas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tipo_cerimonia` to the `Escalas` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Escalas" ADD COLUMN     "horario_missa" TEXT NOT NULL,
ADD COLUMN     "tipo_cerimonia" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Horarios_Missa" DROP COLUMN "horario_missa",
DROP COLUMN "tipo_cerimonia";
