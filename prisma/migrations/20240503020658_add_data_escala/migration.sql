/*
  Warnings:

  - Added the required column `data_escala` to the `Escalas` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Escalas" ADD COLUMN     "data_escala" TEXT NOT NULL;
