-- DropForeignKey
ALTER TABLE "EscalaCoroinha" DROP CONSTRAINT "EscalaCoroinha_id_escala_fkey";

-- AddForeignKey
ALTER TABLE "EscalaCoroinha" ADD CONSTRAINT "EscalaCoroinha_id_escala_fkey" FOREIGN KEY ("id_escala") REFERENCES "Escala"("id_escala") ON DELETE CASCADE ON UPDATE CASCADE;
