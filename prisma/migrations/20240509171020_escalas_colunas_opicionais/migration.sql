-- DropForeignKey
ALTER TABLE "Escalas" DROP CONSTRAINT "Escalas_id_coroinha_fkey";

-- DropForeignKey
ALTER TABLE "Escalas" DROP CONSTRAINT "Escalas_id_objeto_fkey";

-- AlterTable
ALTER TABLE "Escalas" ALTER COLUMN "id_coroinha" DROP NOT NULL,
ALTER COLUMN "id_objeto" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Escalas" ADD CONSTRAINT "Escalas_id_coroinha_fkey" FOREIGN KEY ("id_coroinha") REFERENCES "Coroinhas"("id_coroinha") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Escalas" ADD CONSTRAINT "Escalas_id_objeto_fkey" FOREIGN KEY ("id_objeto") REFERENCES "Objetos_Liturgicos"("id_objeto") ON DELETE SET NULL ON UPDATE CASCADE;
