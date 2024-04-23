/*
  Warnings:

  - You are about to drop the column `coroinha_id` on the `Escalas` table. All the data in the column will be lost.
  - You are about to drop the column `horario_id` on the `Escalas` table. All the data in the column will be lost.
  - You are about to drop the column `objeto_id` on the `Escalas` table. All the data in the column will be lost.
  - Added the required column `coroinha_nome` to the `Escalas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `horarios` to the `Escalas` table without a default value. This is not possible if the table is not empty.
  - Added the required column `objeto_nome` to the `Escalas` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Escalas" DROP CONSTRAINT "Escalas_coroinha_id_fkey";

-- DropForeignKey
ALTER TABLE "Escalas" DROP CONSTRAINT "Escalas_horario_id_fkey";

-- DropForeignKey
ALTER TABLE "Escalas" DROP CONSTRAINT "Escalas_objeto_id_fkey";

-- AlterTable
ALTER TABLE "Escalas" DROP COLUMN "coroinha_id",
DROP COLUMN "horario_id",
DROP COLUMN "objeto_id",
ADD COLUMN     "coroinha_nome" INTEGER NOT NULL,
ADD COLUMN     "horarios" INTEGER NOT NULL,
ADD COLUMN     "objeto_nome" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Escalas" ADD CONSTRAINT "Escalas_coroinha_nome_fkey" FOREIGN KEY ("coroinha_nome") REFERENCES "Coroinhas"("id_coroinha") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Escalas" ADD CONSTRAINT "Escalas_objeto_nome_fkey" FOREIGN KEY ("objeto_nome") REFERENCES "Objetos_liturgicos"("id_objeto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Escalas" ADD CONSTRAINT "Escalas_horarios_fkey" FOREIGN KEY ("horarios") REFERENCES "Horarios_missas"("id_horario") ON DELETE RESTRICT ON UPDATE CASCADE;
