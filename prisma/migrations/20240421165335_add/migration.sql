/*
  Warnings:

  - Added the required column `horario` to the `Horarios_missas` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Horarios_missas" ADD COLUMN     "horario" TEXT NOT NULL;
