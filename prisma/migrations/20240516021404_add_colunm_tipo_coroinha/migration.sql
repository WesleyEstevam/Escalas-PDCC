/*
  Warnings:

  - Added the required column `tipo_coroinha` to the `Coroinhas` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Coroinhas" ADD COLUMN     "tipo_coroinha" TEXT NOT NULL;
