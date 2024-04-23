/*
  Warnings:

  - Added the required column `id_objeto` to the `Escalas` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Escalas" ADD COLUMN     "id_objeto" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Escalas" ADD CONSTRAINT "Escalas_id_objeto_fkey" FOREIGN KEY ("id_objeto") REFERENCES "Objetos_Liturgicos"("id_objeto") ON DELETE RESTRICT ON UPDATE CASCADE;
