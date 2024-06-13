-- DropForeignKey
ALTER TABLE "EscalaCoroinha" DROP CONSTRAINT "EscalaCoroinha_id_coroinha_fkey";

-- AddForeignKey
ALTER TABLE "EscalaCoroinha" ADD CONSTRAINT "EscalaCoroinha_id_coroinha_fkey" FOREIGN KEY ("id_coroinha") REFERENCES "Coroinha"("id_coroinha") ON DELETE CASCADE ON UPDATE CASCADE;
